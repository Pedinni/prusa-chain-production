; Prusa GPIO Board P6 -> PIN_PRUSA_FAN -> Arduino D20
; Prusa GPIO Board P7 -> PIN_PRUSA_EJECT -> Arduino D21

M262 P6 B0      ; Setup Pin-Mode: P6 as Output
M264 P6 B1      ; Set P6 to High -> Open Drain Output disabled
M262 P7 B0      ; Setup Pin-Mode: P7 as Output
M264 P7 B1      ; Set P7 to High -> Open Drain Output disabled

G0 X125 Y211 Z221 F2400         ; Prusa MK4s: Xmax = 251, Ymax = 211, Zmax = 221
M84                             ; Disable printer motors
M264 P6 B0                      ; Enable automated part removal fans
M190 R30                        ; Set and wait for bed temperature
M140 S0                         ; Disable Heatbed
G4 S300                         ; Wait 300s
M264 P6 B1                      ; Disable automated part removal fans

; Eject
M264 P7 B0      ; Set P7 to Low
G4 P10          ; Wait 10 ms
M264 P7 B1      ; Set P7 to High