.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "NHAP 1 KY TU THUONG : $"
    TBAO2 DB 13,10,"KY TU IN HOA : $"  
    TBAO3 DB 13,10,"NHAP 1 KY TU HOA : $"
    TBAO4 DB 13,10,"KY TU IN THUONG : $"
    KYTU1 DB ? 
    KYTU2 DB ?
    KYTU3 DB ?
    KYTU4 DB ?
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
    
    MOV AH,9
    LEA DX,TBAO3
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV KYTU3,AL
    
    MOV AL,KYTU3
    ADD AL,32
    MOV KYTU4,AL
    
    MOV AH,9
    LEA DX,TBAO4
    INT 21H
    
    MOV AH,2
    MOV DL,KYTU4
    INT 21H          
              
    MOV AH,4CH
    INT 21H
END