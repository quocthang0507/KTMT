.MODEL
.STACK
.DATA
    TBAO1 DB 13,10,"NHAP SO THAP LUC PHAN (TOI DA 4 KY SO) : $"
    TBAO2 DB 13,10,"XUAT SO THAP LUC PHAN : $" 
    LOI DB 13,10,"BAN NHAP SAI$"
.CODE 
   MOV AX,@DATA
   MOV DS,AX
   
   LEA DX,TBAO1
   MOV AH,9
   INT 21H
   
   XOR BX,BX          
   MOV AH, 1
   MOV CL,4         
   FOR1:
       INT 21H 
       
       CMP AL, 0DH   
       JE  END_FOR       
       
       CMP AL, 30H
       JB NHAPSAI
       
       CMP AL,'9'
       JBE NUMBER
       
       CMP AL,'A'
       JB NHAPSAI
       
       CMP AL,'F'
       JBE LETTER
       
       JMP NHAPSAI            
                           
       NUMBER:
       SUB AL, 48    
       JMP SHIFT
              
       LETTER:
           SUB AL, 37H
       SHIFT:
           SHL BX, 4
           OR BL, AL
           JMP LAP          
       LAP:
           LOOP FOR1
           JMP END_FOR 
       NHAPSAI:
           MOV AH,9
           LEA DX,LOI
           INT 21H
           JMP KETTHUC    
        
   END_FOR:
       MOV AH,9
       LEA DX,TBAO2
       INT 21H
   PRINTN:
       MOV CX, 4
       MOV AH, 2
    
   FOR:
       MOV DL, BH
       SHR DL, 4
         
       CMP DL, 10
       JB NUM
       JAE LETTER2
       
       NUM:
       ADD DL , 48
       INT 21H
       JMP END_OF_LOOP2
       
       LETTER2:
       ADD DL , 55
       INT 21H
           
       
       END_OF_LOOP2:
       ROL BX,4
    LOOP FOR
    
   KETTHUC:  
    MOV AH , 4CH
    INT 21H
END                
     