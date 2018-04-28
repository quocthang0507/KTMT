.MODEL SMALL
.STACK
.DATA
    MSG1 DB "HAY NHAP MOT KY TU: $"
    MSG2 DB 13,10,"KY TU DA NHAP: $" 
    CHAR DB ?
.CODE                               
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09H
    LEA DX,MSG1
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV CHAR,AL
           
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    MOV AH,2
    MOV DL,CHAR
    INT 21H
    
    MOV AH,4CH
    INT 21H
END