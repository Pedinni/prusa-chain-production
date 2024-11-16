; Prusa GPIO Board P6 -> PIN_PRUSA_FAN -> Arduino D20
; Prusa GPIO Board P7 -> PIN_PRUSA_EJECT -> Arduino D21

M262 P6 B0      ; Setup Pin-Mode: P6 as Output
M264 P6 B1      ; Set P6 to High -> Open Drain Output disabled
M262 P7 B0      ; Setup Pin-Mode: P7 as Output
M264 P7 B1      ; Set P7 to High -> Open Drain Output disabled

G4 S2           ; Wait 2 s

; Toggle FAN Output 2 times
M264 P6 B0      ; Set P6 to Low
G4 S1
M264 P6 B1      ; Set P6 to High
G4 S1
M264 P6 B0      ; Set P6 to Low
G4 S1
M264 P6 B1      ; Set P6 to High
G4 S1

; Eject
M264 P7 B0      ; Set P7 to Low
G4 P10          ; Wait 10 ms
M264 P7 B1      ; Set P7 to High