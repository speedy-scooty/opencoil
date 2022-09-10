EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP-12F U1
U 1 1 5F5FC996
P 2550 2850
F 0 "U1" H 2550 3831 50  0000 C CNN
F 1 "ESP-12F" H 2550 3740 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 2550 2850 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 2200 2950 50  0001 C CNN
	1    2550 2850
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM1117-3.3 U2
U 1 1 5F5FD947
P 2550 4200
F 0 "U2" H 2550 4349 50  0000 C CNN
F 1 "LM1117-3.3" H 2550 4440 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2550 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 2550 4200 50  0001 C CNN
	1    2550 4200
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5F5FEA51
P 4600 3700
F 0 "J1" H 4518 3375 50  0000 C CNN
F 1 "Conn_01x02" H 4518 3466 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4600 3700 50  0001 C CNN
F 3 "~" H 4600 3700 50  0001 C CNN
	1    4600 3700
	1    0    0    1   
$EndComp
Wire Wire Line
	2550 3900 2550 3600
Connection ~ 2550 3600
Wire Wire Line
	2550 3600 2550 3550
Wire Wire Line
	3150 3150 3450 3150
Wire Wire Line
	3450 3150 3450 3600
Connection ~ 3450 3600
Wire Wire Line
	3450 3600 2550 3600
Wire Wire Line
	4400 3700 2850 3700
Wire Wire Line
	2850 3700 2850 4200
$Comp
L Connector:Conn_01x10_Female J2
U 1 1 630BE98C
P 1350 2950
F 0 "J2" H 1750 2700 50  0000 C CNN
F 1 "Conn_01x10_Female" H 1800 2800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 1350 2950 50  0001 C CNN
F 3 "~" H 1350 2950 50  0001 C CNN
	1    1350 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 3600 3450 3600
Wire Wire Line
	4400 3600 3900 3600
Connection ~ 3900 3600
Wire Wire Line
	3900 3150 3900 3600
Connection ~ 2550 2050
Wire Wire Line
	2550 2050 1700 2050
Wire Wire Line
	2550 3600 1550 3600
Wire Wire Line
	1550 3600 1550 3350
Wire Wire Line
	1000 4200 1000 1750
Wire Wire Line
	1000 1750 1550 1750
Wire Wire Line
	2550 1750 2550 2050
Connection ~ 2250 4200
Wire Wire Line
	2250 4200 2350 4200
Wire Wire Line
	1550 2450 1550 1750
Connection ~ 1550 1750
Wire Wire Line
	1550 1750 2550 1750
Wire Wire Line
	1700 2050 1700 2450
Wire Wire Line
	1950 2450 1700 2450
Wire Wire Line
	1000 4200 2250 4200
Wire Wire Line
	1550 2550 1950 2550
Wire Wire Line
	1950 2550 1950 2650
Wire Wire Line
	3150 2250 3150 1550
Wire Wire Line
	3150 1550 700  1550
Wire Wire Line
	700  1550 700  3250
Wire Wire Line
	700  3250 1550 3250
Wire Wire Line
	1550 2650 1850 2650
Wire Wire Line
	1850 2650 1850 2700
Wire Wire Line
	1850 2700 2700 2700
Wire Wire Line
	2700 2700 2700 3250
Wire Wire Line
	2700 3250 3150 3250
Wire Wire Line
	1550 2750 2650 2750
Wire Wire Line
	2650 2750 2650 3050
Wire Wire Line
	2650 3050 3150 3050
Wire Wire Line
	3150 2850 3750 2850
Wire Wire Line
	3750 2850 3750 1950
Wire Wire Line
	3750 1950 1200 1950
Wire Wire Line
	1200 1950 1200 2850
Wire Wire Line
	1200 2850 1550 2850
Wire Wire Line
	3900 2950 3900 1850
Wire Wire Line
	3900 1850 1100 1850
Wire Wire Line
	1100 1850 1100 2950
Wire Wire Line
	1100 2950 1550 2950
Wire Wire Line
	3150 2950 3900 2950
Wire Wire Line
	1550 3050 1800 3050
Wire Wire Line
	1800 3050 1800 2850
Wire Wire Line
	1800 2850 1950 2850
Wire Wire Line
	1550 3150 1850 3150
Wire Wire Line
	1850 3150 1850 2950
Wire Wire Line
	1850 2950 1950 2950
$EndSCHEMATC
