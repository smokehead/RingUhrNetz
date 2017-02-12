EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:RingUhrNetz-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "LED-Ring-Uhr"
Date "26.01.2017"
Rev ""
Comp ""
Comment1 "WS2812-Ring mit eigner Stromversorung"
Comment2 "Uhr mit LED-Ring und RGB-LED"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LM7805CT U1
U 1 1 588A3664
P 1550 4960
F 0 "U1" H 1350 5160 50  0001 C CNN
F 1 "LM7805CT" H 1370 5160 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Horizontal" H 1550 5060 50  0000 C CIN
F 3 "" H 1550 4960 50  0000 C CNN
	1    1550 4960
	0    1    1    0   
$EndComp
$Comp
L Diode_Bridge D2
U 1 1 588A36D4
P 1250 3550
F 0 "D2" H 1000 3850 50  0000 C CNN
F 1 "Diode_Bridge" H 1600 3200 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_Bridge_15.7x15.7" H 1250 3550 50  0001 C CNN
F 3 "" H 1250 3550 50  0000 C CNN
	1    1250 3550
	1    0    0    -1  
$EndComp
$Comp
L D D1
U 1 1 588A3746
P 1880 4940
F 0 "D1" H 1740 5000 50  0000 C CNN
F 1 "1N4007" H 2090 5040 50  0000 C CNN
F 2 "Diodes_ThroughHole:D_5W_P10.16mm_Horizontal" H 1880 4940 50  0001 C CNN
F 3 "" H 1880 4940 50  0000 C CNN
	1    1880 4940
	0    1    1    0   
$EndComp
$Comp
L CP C2
U 1 1 588A38D0
P 1320 5400
F 0 "C2" V 1380 5250 50  0000 L CNN
F 1 "1µF" V 1170 5330 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 1358 5250 50  0001 C CNN
F 3 "" H 1320 5400 50  0000 C CNN
	1    1320 5400
	0    1    1    0   
$EndComp
$Comp
L CP CL1
U 1 1 588A3969
P 1340 4200
F 0 "CL1" V 1400 4050 50  0000 L CNN
F 1 "1000µF" V 1210 4080 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Axial_L20.0mm_D10.0mm_P26.00mm_Horizontal" H 1378 4050 50  0001 C CNN
F 3 "" H 1340 4200 50  0000 C CNN
	1    1340 4200
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 588A39FA
P 1320 5720
F 0 "C3" V 1390 5570 50  0000 L CNN
F 1 "100nF" V 1190 5600 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 1358 5570 50  0001 C CNN
F 3 "" H 1320 5720 50  0000 C CNN
	1    1320 5720
	0    1    1    0   
$EndComp
$Comp
L TRANSFO T1
U 1 1 588A3A4B
P 1250 2580
F 0 "T1" H 1250 2830 50  0000 C CNN
F 1 "230/9V 9W" H 1250 2280 50  0000 C CNN
F 2 "Transformers_CHK:Trafo_CHK-EI48-8VA_1xSec" H 1250 2580 50  0001 C CNN
F 3 "" H 1250 2580 50  0000 C CNN
	1    1250 2580
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 588A3ECE
P 790 1330
F 0 "P1" H 790 1480 50  0000 C CNN
F 1 "230 Volt" V 890 1330 50  0000 C CNN
F 2 "Connect:PINHEAD1-2" H 790 1330 50  0001 C CNN
F 3 "" H 790 1330 50  0000 C CNN
	1    790  1330
	-1   0    0    1   
$EndComp
$Comp
L F_Small F1
U 1 1 588A3F48
P 1160 1600
F 0 "F1" H 1120 1660 50  0000 L CNN
F 1 "1A Träge" H 1040 1540 50  0000 L CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" H 1160 1600 50  0001 C CNN
F 3 "" H 1160 1600 50  0000 C CNN
	1    1160 1600
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328-P IC1
U 1 1 588A408B
P 5250 2450
F 0 "IC1" H 4500 3700 50  0001 L BNN
F 1 "ATMEGA328-P" H 5650 1050 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 5250 2450 50  0001 C CIN
F 3 "" H 5250 2450 50  0000 C CNN
	1    5250 2450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P2
U 1 1 588A40CC
P 7910 1950
F 0 "P2" H 7910 2150 50  0000 C CNN
F 1 "LED-Ring" V 8010 1950 50  0000 C CNN
F 2 "Connect:PINHEAD1-3" H 7910 1950 50  0001 C CNN
F 3 "" H 7910 1950 50  0000 C CNN
	1    7910 1950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 588A4155
P 8270 1750
F 0 "P3" H 8270 1950 50  0000 C CNN
F 1 "Single LED" V 8370 1750 50  0000 C CNN
F 2 "Connect:PINHEAD1-3" H 8270 1750 50  0001 C CNN
F 3 "" H 8270 1750 50  0000 C CNN
	1    8270 1750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 588A41F2
P 8650 2900
F 0 "P4" H 8650 3050 50  0000 C CNN
F 1 "Taster 1" V 8750 2900 50  0000 C CNN
F 2 "Connect:PINHEAD1-2" H 8650 2900 50  0001 C CNN
F 3 "" H 8650 2900 50  0000 C CNN
	1    8650 2900
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P5
U 1 1 588A425D
P 9080 3000
F 0 "P5" H 9080 3150 50  0000 C CNN
F 1 "Taster 2" V 9180 3000 50  0000 C CNN
F 2 "Connect:PINHEAD1-2" H 9080 3000 50  0001 C CNN
F 3 "" H 9080 3000 50  0000 C CNN
	1    9080 3000
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 588A43DE
P 6450 2040
F 0 "Y1" H 6450 2190 50  0000 C CNN
F 1 "16MHz" H 6450 1890 50  0000 C CNN
F 2 "Crystals:Crystal_HC51-U_Vertical" H 6450 2040 50  0001 C CNN
F 3 "" H 6450 2040 50  0000 C CNN
	1    6450 2040
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 588A44E4
P 6760 1940
F 0 "C4" H 6785 2040 50  0000 L CNN
F 1 "22pF" H 6785 1840 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 6798 1790 50  0001 C CNN
F 3 "" H 6760 1940 50  0000 C CNN
	1    6760 1940
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 588A4585
P 6760 2210
F 0 "C5" H 6785 2310 50  0000 L CNN
F 1 "22pF" H 6785 2110 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 6798 2060 50  0001 C CNN
F 3 "" H 6760 2210 50  0000 C CNN
	1    6760 2210
	0    1    1    0   
$EndComp
$Comp
L C C6
U 1 1 588A4614
P 3030 5570
F 0 "C6" H 3055 5670 50  0000 L CNN
F 1 "100nF" H 3055 5470 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 3068 5420 50  0001 C CNN
F 3 "" H 3030 5570 50  0000 C CNN
	1    3030 5570
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 588A469D
P 3360 5570
F 0 "C7" H 3385 5670 50  0000 L CNN
F 1 "100nF" H 3385 5470 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 3398 5420 50  0001 C CNN
F 3 "" H 3360 5570 50  0000 C CNN
	1    3360 5570
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 588A4714
P 3700 5570
F 0 "C8" H 3725 5670 50  0000 L CNN
F 1 "100nF" H 3725 5470 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 3738 5420 50  0001 C CNN
F 3 "" H 3700 5570 50  0000 C CNN
	1    3700 5570
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P6
U 1 1 588A48D1
P 7530 2750
F 0 "P6" H 7530 3000 50  0000 C CNN
F 1 "RTC Modul" V 7630 2750 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-04_04x2.54mm_Straight" H 7530 2750 50  0001 C CNN
F 3 "" H 7530 2750 50  0000 C CNN
	1    7530 2750
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 588A497C
P 6580 2800
F 0 "R1" V 6660 2800 50  0000 C CNN
F 1 "10k" V 6580 2800 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6510 2800 50  0001 C CNN
F 3 "" H 6580 2800 50  0000 C CNN
	1    6580 2800
	0    1    1    0   
$EndComp
$Comp
L VR VR1
U 1 1 588CE311
P 1260 1350
F 0 "VR1" V 1320 1304 50  0000 C TNN
F 1 "VR" V 1260 1350 50  0000 C CNN
F 2 "Varistors:RV_Disc_D12_W7.5_P7.5" H 1260 1350 50  0001 C CNN
F 3 "" H 1260 1350 50  0000 C CNN
	1    1260 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	990  1280 990  1100
Wire Wire Line
	990  1100 1450 1100
Wire Wire Line
	990  1380 990  1600
Wire Wire Line
	990  1600 1060 1600
Connection ~ 1260 1100
Connection ~ 1260 1600
Wire Wire Line
	1260 1600 1260 1740
Wire Wire Line
	1260 1740 1050 1740
Wire Wire Line
	1050 1740 1050 2180
Wire Wire Line
	1450 1100 1450 2180
Wire Wire Line
	1050 2980 1250 2980
Wire Wire Line
	1250 2980 1250 3150
Wire Wire Line
	1250 3950 1760 3950
Wire Wire Line
	1760 3950 1760 2980
Wire Wire Line
	1760 2980 1450 2980
Wire Wire Line
	1650 3550 1650 4060
Wire Wire Line
	1650 4060 1600 4060
Wire Wire Line
	1600 4060 1600 4560
Wire Wire Line
	850  3550 850  6050
Wire Wire Line
	1600 4200 1490 4200
Wire Wire Line
	1190 4200 850  4200
Connection ~ 850  4200
Connection ~ 1600 4200
Wire Wire Line
	850  4960 1300 4960
$Comp
L C C1
U 1 1 588D2219
P 1350 4560
F 0 "C1" V 1410 4410 50  0000 L CNN
F 1 "330nF" V 1220 4450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 1388 4410 50  0001 C CNN
F 3 "" H 1350 4560 50  0000 C CNN
	1    1350 4560
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 4560 1500 4560
Connection ~ 1600 4560
Wire Wire Line
	1200 4560 850  4560
Connection ~ 850  4560
Wire Wire Line
	1600 5360 1600 5820
Wire Wire Line
	1470 5400 1600 5400
Connection ~ 1600 5400
Wire Wire Line
	1470 5720 1600 5720
Connection ~ 1600 5720
Wire Wire Line
	1880 5090 1880 5300
Wire Wire Line
	1880 5300 1600 5300
Connection ~ 1600 5300
Wire Wire Line
	1880 4790 1880 4640
Wire Wire Line
	1880 4640 1600 4640
Connection ~ 1600 4640
Connection ~ 850  4960
Wire Wire Line
	1170 5400 850  5400
Connection ~ 850  5400
Wire Wire Line
	1170 5720 850  5720
Connection ~ 850  5720
Wire Wire Line
	1580 5820 2180 5820
Wire Wire Line
	2180 5820 2110 760 
Wire Wire Line
	2110 760  10810 770 
Wire Wire Line
	850  6050 10920 6050
Wire Wire Line
	4350 3650 4340 6050
Connection ~ 4340 6050
Wire Wire Line
	4350 3550 4250 3550
Wire Wire Line
	4250 3550 4240 6050
Connection ~ 4240 6050
Wire Wire Line
	3700 5720 3700 6050
Connection ~ 3700 6050
Wire Wire Line
	3360 5720 3360 6050
Connection ~ 3360 6050
Wire Wire Line
	3030 5730 3030 6050
Connection ~ 3030 6050
Wire Wire Line
	3700 760  3700 5420
Wire Wire Line
	3700 1950 4350 1950
Wire Wire Line
	3360 760  3360 5420
Wire Wire Line
	3360 1650 4350 1650
Wire Wire Line
	3030 760  3030 5420
Wire Wire Line
	3030 1350 4350 1350
Connection ~ 3030 1350
Connection ~ 3360 1650
Connection ~ 3030 760 
Connection ~ 3360 760 
Connection ~ 3700 1950
Connection ~ 3700 760 
Wire Wire Line
	6250 2800 6430 2800
Wire Wire Line
	6250 2600 7330 2600
Wire Wire Line
	6250 2700 7330 2700
Wire Wire Line
	8070 1650 6250 1650
Wire Wire Line
	7990 1750 8070 1750
Wire Wire Line
	6250 1850 7710 1850
Wire Wire Line
	7710 1950 7640 1950
Wire Wire Line
	7640 1950 7640 760 
Connection ~ 7640 760 
Wire Wire Line
	7990 1750 7990 760 
Connection ~ 7990 760 
Wire Wire Line
	7710 2050 7640 2050
Wire Wire Line
	7640 2050 7640 6050
Connection ~ 7640 6050
Wire Wire Line
	8070 1850 8070 6050
Connection ~ 8070 6050
Wire Wire Line
	7330 2800 7260 2800
Wire Wire Line
	7260 2800 7260 760 
Connection ~ 7260 760 
Wire Wire Line
	7330 2900 7260 2900
Wire Wire Line
	7260 2900 7260 6050
Connection ~ 7260 6050
Wire Wire Line
	6250 1890 6610 1890
Wire Wire Line
	6250 1890 6250 1950
Wire Wire Line
	6330 2190 6610 2190
Wire Wire Line
	6330 2190 6330 2110
Wire Wire Line
	6330 2110 6250 2110
Wire Wire Line
	6250 2110 6250 2050
Wire Wire Line
	6610 1890 6610 1940
Connection ~ 6450 1890
Wire Wire Line
	6610 2190 6610 2210
Connection ~ 6450 2190
Wire Wire Line
	6910 1940 6980 1940
Wire Wire Line
	6980 1940 6980 6050
Connection ~ 6980 6050
Wire Wire Line
	6910 2210 6980 2210
Connection ~ 6980 2210
Wire Wire Line
	6730 2800 7150 2800
Wire Wire Line
	7150 2800 7130 760 
Connection ~ 7130 760 
Wire Wire Line
	6250 2950 8450 2950
Wire Wire Line
	6250 3050 8880 3050
Wire Wire Line
	8450 2850 8450 770 
Connection ~ 8450 770 
Wire Wire Line
	8880 2950 8880 760 
Connection ~ 8880 760 
$EndSCHEMATC