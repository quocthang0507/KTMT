.MODEL SMALL
.STACK
.DATA
    MSG1 DB "HELLO, WORLD!$"
    MSG2 DB 13,10,"HELLO, SOLAR SYSTEM!$"
    MSG3 DB 13,10,"HELLO, UNIVERSE!$"
.CODE                                
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09H
    LEA DX,MSG1   
    INT 21H
    LEA DX,MSG2
    INT 21H
    LEA DX,MSG3
    INT 21H
    
    MOV AH,4CH
    INT 21H
END                               