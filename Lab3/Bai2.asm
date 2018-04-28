.MODEL SMALL
.STACK
.DATA
    TBA01 DB 13,10,"NHAP MOT KY TU: $"
    TBA02 DB 13,10,"KY TU DA NHAP LA CHU$"
    TBA03 DB 13,10,"KY TU DA NHAP LA SO$" 
    TBA04 DB 13,10,"KY TU DA NHAP KHAC CHU/SO$"
    KYTU DB ?                                   
.CODE                                           
   MOV AX,@DATA                                 
   MOV DS,AX
        
   MOV AH,9 
   LEA DX,TBA01     
   INT 21H
                 
   MOV AH,1   
   INT 21H
                 
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
        JMP KETTHUC 
   CHU:             
        MOV AH,9
        LEA DX,TBA02
        INT 21H    
        JMP KETTHUC   
   KHAC:             
        MOV AH,9
        LEA DX,TBA04
        INT 21H
   KETTHUC:          
        MOV AH,4CH
        INT 21H   
END