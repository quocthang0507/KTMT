.MODEL SMALL
.STACK
.DATA
    TBA01 DB 13,10,"NHAP MOT KY TU (HOAC ESC): $"
    TBA02 DB 13,10,"KY TU NHAP LA CHU$"
    TBA03 DB 13,10,"KY TU NHAP LA SO$" 
    TBA04 DB 13,10,"KY TU NHAP KHAC CHU/SO$"
    KYTU DB ?                                   
.CODE                                           
   MOV AX,@DATA                                 
   MOV DS,AX
        
 VONGLAP:  
   MOV AH,9 
   LEA DX,TBA01     
   INT 21H
                 
   MOV AH,1   
   INT 21H
   
   CMP AL,1BH
   JE KETTHUC
                 
   CMP AL,'0' 
   JB KHAC
   
   CMP AL,'9'
   JBE SO
            
   CMP AL,'A'
   JB KHAC
   
   CMP AL,'Z'
   JBE CHU
   
   CMP AL,'a'
   JB KHAC
   
   CMP AL,'z'
   JBE CHU         

   JMP KHAC  
   
   SO: 
        MOV AH,9
        LEA DX,TBA03
        INT 21H    
        JMP VONGLAP
   CHU:             
        MOV AH,9
        LEA DX,TBA02
        INT 21H    
        JMP VONGLAP   
   KHAC:             
        MOV AH,9
        LEA DX,TBA04
        INT 21H
        JMP VONGLAP
   KETTHUC:          
        MOV AH,4CH
        INT 21H   
END