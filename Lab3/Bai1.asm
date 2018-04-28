.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13,10,"Bay gio la (S)ang, (C)hieu hay (T)oi?$"   
    TBAO2 DB 13,10,"CHAO BUOI SANG$"
    TBAO3 DB 13,10,"CHAO BUOI CHIEU$"
    TBAO4 DB 13,10,"CHAO BUOI TOI$"
.CODE   
        MOV AX,@DATA
    	MOV DS,AX 
    	   
    VONGLAP:
        LEA DX,TBAO1
    	MOV AH,9        
    	INT 21H
        
        MOV AH,1
        INT 21H
        
        CMP AL,'S'
        JE SANG
        CMP AL,'s'
        JE SANG
        CMP AL,'C'
        JE CHIEU 
        CMP AL,'c'
        JE CHIEU
        CMP AL,'T'
        JE TOI 
        CMP AL,'t'
        JE TOI 
        JMP VONGLAP
                
    SANG:  
        LEA DX,TBAO2 
        JMP LOICHAO        
    CHIEU:
        LEA DX,TBAO3
        JMP LOICHAO       
    TOI:  
        LEA DX,TBAO4
        JMP LOICHAO
    LOICHAO:
        MOV AH,9 
        INT 21H 
END