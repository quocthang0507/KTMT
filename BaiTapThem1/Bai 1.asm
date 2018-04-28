.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "NHAP 1 KY TU : $"
    TBAO2 DB 13,10,"KY TU IN HOA : $"
    KYTU1 DB ? 
    KYTU2 DB ?
.CODE        
    MOV AX,@DATA
    MOV DS,AX
              
    MOV AH,09H
    LEA DX,TBAO1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV KYTU1,AL
    
    MOV AH,09H
    LEA DX,TBAO2
    INT 21H
    
    MOV AL,KYTU1
    SUB AL,32
    MOV KYTU2,AL
    
    MOV AH,2
    MOV DL,KYTU2
    INT 21H          
              
    MOV AH,4CH
    INT 21H
END