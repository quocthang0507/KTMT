.MODEL SMALL
.STACK
.DATA
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,7FFFH
    MOV BX,1
    ADD AX,BX

    MOV AL,1
    MOV BL,00FFh
    SUB AL,BL
    
    MOV AL,0
    DEC AL
     
    MOV AL,7FH
    NEG AL 
           
    MOV AX,1ABCH
    MOV BX,712AH
    XCHG AX,BX    
    
    MOV AL,80H
    MOV BL,0FFH
    ADD AL,BL

    MOV AX,0
    MOV BX,8000H
    SUB AX,BX
    
    MOV AX,1
    NEG AX
    
    MOV AH,4CH
    INT 21H
END