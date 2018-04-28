.MODEL    SMALL
.STACK
.DATA
    TBAO1 DB "NHAP KY TU THU NHAT: $"
    TBAO2 DB 13,10,"NHAP KY TU THU HAI: $"
    TBAO3 DB 13,10,"KY TU TONG: $"
    CHAR1 DB ?
    CHAR2 DB ?
    CHARSUM DB ?
.CODE
        MOV AX,@DATA
        MOV DS,AX

        LEA DX, TBAO1
        MOV AH, 9            
        INT 21H

        MOV AH, 1        
        MOV CHAR1, AL
        INT 21H
        
        LEA DX,TBAO2
        MOV AH,9
        INT 21H
        
        MOV AH,1
        MOV CHAR2,AL  
        INT 21H
                     
        MOV AL,CHAR1
        ADD AL,CHAR2
        MOV CHARSUM,AL
                     
        LEA DX,TBAO3
        MOV AH,9
        INT 21H
        
        MOV AH,2
        MOV DL,CHARSUM
        INT 21H                  

        MOV AH, 4CH
        INT 21H
END