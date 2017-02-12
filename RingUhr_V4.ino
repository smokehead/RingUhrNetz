/* 
Diese Version setzt auf V3 auf. Hier werden die Lampen aber immer komplett
ausgeschaltet und dann immer alle Lampen in einem Zug neu gesetzt. Das passiert
ca. 3 mal pro Sekunde Zusätzlich gibt es noch eine einzelne
LED, die die Einzelminuten anzeigt.
*/
/*********************************************************************************
* Uhr, das die Uhrzeit via DS3231 Breakout über I2C mit einem Ring von NeoPixeln *
* anzeigt. Die Stunden werden über eine rote LED angezeigt, immer 5 Minuten über *
* eine blaue LED und die 5 Sekunden über eine Grüne LED.                         *
* Sollten 2 LED auf dieselbe Stelle fallen, dann wird die Farbe entsprechend ge- *
* mischt.                                                                        *
*                                                                                *
**********************************************************************************/
// Wird für die Uhr benötigt
#include "Wire.h"
// Wird für den NeoPixel-Ring benötigt
#include <Adafruit_NeoPixel.h>
#include <avr/power.h>
// Datenpin für den Neopixel-Ring
#define PIN 13
#define PINS 11
//Adresse des DS3231 setzen
#define DS3231_I2C_ADDRESS 0x68
//Grundeinstellung (Anzahl der LEDs, usw.)
Adafruit_NeoPixel strip = Adafruit_NeoPixel(12, PIN, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel sled = Adafruit_NeoPixel(1, PINS, NEO_RGB + NEO_KHZ800);
// 2 Basiswerte zum Entprellen der Stelltaster
volatile unsigned long alteZeit = 0,
                       entprell = 20;
// Zeitwerte
int GvStd, GvMin, GvSek, GvwTag, GvTag, GvMonat, GvJahr;
boolean GvChangeTimeSw = false;
// Nummer der einzuschaltenden LED für die Stunden, Minuten
// Sekunden sind in der Routine definiert, damit sie den globalen Speicher
// nicht belasten
uint16_t StdLED, MinLED, SekLED;
uint32_t HHFarbe, MMFarbe, SSFarbe, AlleFarbe, SMinFarbe, 
         AusFarbe, StSekFarbe, StMiFarbe, MiSekFarbe;
uint32_t Min0Farbe, Min1Farbe, Min2Farbe, Min3Farbe, Min4Farbe;
/******************************************************************************
         S E T U P  - - -  S E T U P
*******************************************************************************/
void setup() {
  strip.begin();
  strip.show(); // Alle LEDs initialisieren
  sled.begin();
  sled.show(); // Einzelne LED initialisieren
// Aktionen für den DS3231
  Wire.begin();
//Einstellungen für die Taster zum Stellen der Uhrzeit
  pinMode(2, INPUT);
  pinMode(3, INPUT);
// Einschalten der internen Pullups
  digitalWrite(2, HIGH);
  digitalWrite(3, HIGH);
//Interrupts Registrieren
  attachInterrupt(0, StundenHoch, LOW);
  attachInterrupt(1, MinutenHoch, LOW);
// Farbwerte setzen
  HHFarbe    = strip.Color(255, 0, 0);
  MMFarbe    = strip.Color(0, 0, 255);
  SSFarbe    = strip.Color(0, 255, 0);
  AlleFarbe  = strip.Color(255, 255, 255);
  AusFarbe   = strip.Color(0, 0, 0);
  StSekFarbe = strip.Color(200, 100, 0);
  StMiFarbe  = strip.Color(255, 0, 255);
  MiSekFarbe = strip.Color(205, 102, 0);
  Min0Farbe  = strip.Color(0, 0, 0);
  Min1Farbe  = strip.Color(255, 0, 0);
  Min2Farbe  = strip.Color(0, 255, 0);
  Min3Farbe  = strip.Color(0, 0, 255);
  Min4Farbe  = strip.Color(200, 100, 0);
// DS3231 seconds, minutes, hours, day, date, month, year
  setDS3231time(30,02,17,5,03,12,15);
}
/*************************************************************
         L O O P ---- L O O P 
**************************************************************/
void loop() {
// Zeitwerte lesen
  ZeitLesen();
// Die aktuellen LEDs alle Ausschalten
  strip.setPixelColor(StdLED, AusFarbe);
  strip.setPixelColor(MinLED, AusFarbe);
  strip.setPixelColor(SekLED, AusFarbe);
  sled.setPixelColor(0, AusFarbe);
  strip.show();
  sled.show();
// LED-Nummern setzen
// Stunden
  StundenLED();
// Minuten
  MinutenLED();
// Sekunden
  SekundenLED();
// Einzelminuten Ist immer die 13 wird im setup gesetzt 
// Farbe der Einzelminute
// Farben der LED setzen
  LEDFarbenSetzen();
  sled.setPixelColor(0, SMinFarbe);
  strip.show();
  sled.show();
  delay(300);
}

/*****************************************************************
     L E D - A U F - D E M - R I N G - S C H A L T E N
******************************************************************/
void StundenLED(){
// Berechnen der LED-Nummer für die Stunden.
  if (GvStd > 12) {
    StdLED = GvStd - 12;
   } else {
    StdLED = GvStd;
  }
  if (StdLED > 12) {
    StdLED = 12;
  }
}
/*
   M I N U T E N  
*/
void MinutenLED(){
// Berechnen der Minuten-Lampe
  if (GvMin < 6) {
    MinLED = 0;
  } else {
    MinLED = GvMin / 5;
  }
// Einzelminuten
int minute = GvMin % 5;
  switch (minute) {
    case 0:
      SMinFarbe = Min0Farbe;
      break;
    case 1:
      SMinFarbe = Min1Farbe;
      break;
    case 2:
      SMinFarbe = Min2Farbe;
      break;
    case 3:
      SMinFarbe = Min3Farbe;
      break;
    case 4:
      SMinFarbe = Min4Farbe;
      break;
  }
}
/*
       S E K U N D E N 
*/
void SekundenLED(){
// Berechnen der Sekunden-Lampe
  if (GvSek < 6) {
    SekLED = 0;
  } else {
    SekLED = GvSek / 5;
  }
}
/*************************************************************
   Hier werden die Farben gesetzt
**************************************************************/
void LEDFarbenSetzen() {
//uint16_t StdLED, MinLED, SekLED;
//  HHFarbe    = strip.Color(255, 0, 0);
//  MMFarbe    = strip.Color(0, 0, 255);
//  SSFarbe    = strip.Color(0, 255, 0);
//  AlleFarbe  = strip.Color(255, 255, 255);
//  AusFarbe   = strip.Color(0, 0, 0);
//  StSekFarbe = strip.Color(205, 102, 0);
//  StMiFarbe  = strip.Color(255, 0, 255);
//  MiSekFarbe = strip.Color(205, 102, 0);
  if (StdLED == MinLED &&
      MinLED == SekLED) {
      strip.setPixelColor(StdLED, AlleFarbe);
      return;
   }
// Wenn das stimmt sind nur die Sekunden an anderer Stelle
  if (StdLED == MinLED) {
      strip.setPixelColor(StdLED, StMiFarbe);
      strip.setPixelColor(SekLED, SSFarbe);
      return;    
  }
// Wenn das folgende Stimmt müssen die Sekunden auf der stunde nicht aber
// auf den Minuten liegen
  if (StdLED == SekLED) {
      strip.setPixelColor(StdLED, StSekFarbe);
      strip.setPixelColor(MinLED, MMFarbe);
      return;    
  }
// Wenn man bis hierher kommt und es stimmt, dann ist die Stunde alleine
  if (MinLED == SekLED) {
      strip.setPixelColor(StdLED, HHFarbe);
      strip.setPixelColor(MinLED, MiSekFarbe);
      return;    
  }
// Jetzt bleibt nur noch dass alle unterschiedlich sitzen
  strip.setPixelColor(StdLED, HHFarbe);
  strip.setPixelColor(MinLED, MMFarbe);
  strip.setPixelColor(SekLED, SSFarbe);
}

/************************************************************
    Call-Back-Routinen für die beiden Interrupts 
*************************************************************/
//Auffangroutine für den Interrupt 0 Stunden
void StundenHoch() {
  if ((millis() - alteZeit) > entprell) {
    GvStd++;
    if (GvStd > 23) {
      GvStd = 0;
    }
    alteZeit = millis();
    GvChangeTimeSw = true;
  }
}

//Auffangroutine für den Interrupt 1 Minuten
void MinutenHoch() {
  if ((millis() - alteZeit) > entprell) {
    GvMin++;
    if (GvMin > 59) {
      GvMin = 0;
    }
    alteZeit = millis();
    GvChangeTimeSw = true;
  }
}
/*
   DS3231 Auslesen Unter und UnterUnterfunktionen 
*/
// Zeit lesen und in Integervariablen umsetzen
void ZeitLesen() {
  byte second, minute, hour, dayOfWeek, 
       dayOfMonth, month, year;
// Sollte ein Interrupt ausgelesen worden sein, dann erst
// die Zeit auf der RTC korrigieren und dann lesen
  if (GvChangeTimeSw) {
    setDS3231time(GvSek,
                  GvMin,
                  GvStd,
                  GvwTag,
                  GvTag,
                  GvMonat,
                  GvJahr);
    GvChangeTimeSw = false;
  }

  readDS3231time(&second, &minute, &hour, &dayOfWeek, 
                 &dayOfMonth, &month,&year);

  GvSek   = second;
  GvMin   = minute;
  GvStd   = hour;
  GvwTag  = dayOfWeek;
  GvTag   = dayOfMonth;
  GvMonat = month;
  GvJahr  = year;
}

// Datum Uhrzeit setzen

void setDS3231time(byte second, byte minute, byte hour, byte dayOfWeek, byte
dayOfMonth, byte month, byte year)
{
// sets time and date data to DS3231
  Wire.beginTransmission(DS3231_I2C_ADDRESS);
  Wire.write(0); // set next input to start at the seconds register
  Wire.write(decToBcd(second)); // set seconds
  Wire.write(decToBcd(minute)); // set minutes
  Wire.write(decToBcd(hour)); // set hours
  Wire.write(decToBcd(dayOfWeek)); // set day of week (1=Sunday, 7=Saturday)
  Wire.write(decToBcd(dayOfMonth)); // set date (1 to 31)
  Wire.write(decToBcd(month)); // set month
  Wire.write(decToBcd(year)); // set year (0 to 99)
  Wire.endTransmission();
}

// Datum und Uhrzeit lesen
void readDS3231time(byte *second,
                    byte *minute,
                    byte *hour,
                    byte *dayOfWeek,
                    byte *dayOfMonth,
                    byte *month,
                    byte *year)
{
  Wire.beginTransmission(DS3231_I2C_ADDRESS);
  Wire.write(0); // set DS3231 register pointer to 00h
  Wire.endTransmission();
  Wire.requestFrom(DS3231_I2C_ADDRESS, 7);
// request seven bytes of data from DS3231 starting from register 00h
  *second = bcdToDec(Wire.read() & 0x7f);
  *minute = bcdToDec(Wire.read());
  *hour = bcdToDec(Wire.read() & 0x3f);
  *dayOfWeek = bcdToDec(Wire.read());
  *dayOfMonth = bcdToDec(Wire.read());
  *month = bcdToDec(Wire.read());
  *year = bcdToDec(Wire.read());
}

// Convert normal decimal numbers to binary coded decimal

byte decToBcd(byte val)
{
  return( (val/10*16) + (val%10) );
}
// Convert binary coded decimal to normal decimal numbers
byte bcdToDec(byte val)
{
  return( (val/16*10) + (val%16) );
}

