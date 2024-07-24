
; pseudo-code

;   IF (var1 > 5) && (var2 < 10)
;       THEN
;           SUM = SUM + 100;
;       ELSE
;           SUM = 10;
;   ENDIF


; var1, var2가 각각 R1, R2에 저장되어 있다고 가정, sum은 R3에 저장

ORG 0H                      ; 0에서 시작
    
    MOV     A, R1           ; R1에 저장된 var1을 A로 이동
    CJNE    A, #05, L1      ; A에 저장된 var1을 5와 비교하여 다르다면 L1으로 점프
    SJMP    EXIT            ; EXIT로 점프
    
    L1:
        JC      EXIT        ; Carry가 1이면(var1이 5보다 작으면) EXIT로 점프
        CLR     A           ; A 초기화
        MOV     A, R2       ; R2에 저장된 var2를 A로 이동
        CJNE    A, #10, L2  ; A에 저장된 var2를 10과 비교하여 다르다면 L2로 점프
        SJMP    EXIT        ; EXIT로 점프
    
    L2:
        JNC     EXIT        ; Carry가 0이면(var2가 10보다 크면) EXIT로 점프
        CLR     A           ; A 초기화
        MOV     A, R1       ; R1에 저장된 var1을 A로 이동
        ADD     A, R2       ; R2에 저장된 var2를 A에 저장된 var1과 더해서 A에 저장
        ADD     A, #100     ; A에 저장된 var1+var2(=sum)에 100을 더해서 A에 저장
        MOV     R3, A       ; A에 sum+100을 R3로 이동
    
    EXIT:
        MOV     R3, #10     ; R3에 10을 저장

END                         ; 종료