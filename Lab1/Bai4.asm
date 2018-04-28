.MODEL    SMALL
.STACK
.DATA
    TBAO1 DB "HAY NHAP MOT KY TU: $"
    TBAO2 DB 0DH,0AH,"KY TU DUNG TRUOC: $"
    TBAO3 DB ", DA NHAP: $"
    TBAO4 DB ", DUNG SAU: $"
    CHAR  DB  ?
.CODE
        MOV AX,@DATA
        MOV DS,AX

        LEA DX, TBAO1
        MOV AH, 9            
        INT 21H

        MOV AH, 1        
        INT 21H
        MOV CHAR, AL

        LEA DX, TBAO2
        MOV AH, 9        
        INT 21H

        MOV AH, 2        
        MOV DL, CHAR
        DEC DL
        INT 21H
                     
        LEA DX,TBAO3
        MOV AH,9             
        INT 21H

        MOV AH,2
        MOV DL,CHAR
        INT 21H
                     
        LEA DX, TBAO4
        MOV AH, 9        
        INT 21H

        MOV AH, 2        
        MOV DL, CHAR
        INC DL
        INT 21H

        MOV AH, 4CH
        INT 21H
END