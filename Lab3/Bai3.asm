.MODEL SMALL
.STACK
.DATA
    TBAO DB 13,10,"CHU IN HOA TRONG BO MA ASCII: $"
.CODE 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TBAO
    INT 21H
    
    MOV AH, 2 
    MOV CX, 26 
    MOV DL, 65      
    
    VONGLAP:
        INT 21H
        INC DL
    LOOP VONGLAP
        
    MOV AH,4CH
    INT 21H
END