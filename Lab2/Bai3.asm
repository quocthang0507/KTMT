.MODEL SMALL
.STACK
.DATA
.CODE
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AX,2143H
     MOV BX,1986H
     SUB AX,BX
     
     MOV AX,81FEH
     MOV BX,1986H
     SUB AX,BX
     
     MOV AX,19BCH
     MOV BX,81FEH
     SUB AX,BX
     
     MOV AX,0002H
     ;MOV BX,FE0FH
     SUB AX,BX
     
     MOV AX,8BCDH
     MOV BX,71ABH
     SUB AX,BX
          
     MOV AH,4CH
     INT 21H
END