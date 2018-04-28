.MODEL SMALL
.STACK 100h
.DATA
    
.CODE 
    MOV AH,2
    MOV DL, '?'
    INT 21H    
    
    CALL NHAP
    CALL XUAT 

    ;KET THUC
    MOV AH,4CH
    INT 21H 
    
    ;NHAP KY TU VAO STACK 
  NHAP PROC 
    POP BX
    XOR CX,CX 
    
    REPEAT:
    MOV AH,1
    INT 21H 
    
    ;SO SANH
    CMP AL,13
    JE UNTIL
    PUSH AX
    INC CX
    JMP REPEAT
    UNTIL:
    PUSH BX 
    RET
  NHAP ENDP 
    
    ;XUAT
  XUAT PROC  
    POP BX  
     
    MOV AH,2
    MOV DL,13
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H
    
    JCXZ ENDFORL 
    FORL:
    POP DX
    INT 21H 
    LOOP FORL
    
    ENDFORL:
    PUSH BX
    RET
  XUAT ENDP 
    
END  