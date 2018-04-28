.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13,10,'Nhap so: $' 
    TBAO3 DB 13,10,'Ket qua '
          DB 13,10,'Tong   : '
    TONG DB ?
          DB 13,10,'Hieu   : '
    HIEU DB ?      
          DB 13,10,'Tich   : '
    TICH DB ?      
          DB 13,10,'Thuong : '
    THUONG DB ?
          DB '$'
    SO DB ?
.CODE      
    MOV AX,@DATA
    MOV DS,AX
    
    CALL NHAP  
    
    MOV TONG,AL
    MOV HIEU,AL
    MOV TICH,AL
    MOV THUONG,AL 
    
    CALL NHAP
    MOV SO,AL
     
    ADD TONG,AL
 
    SUB HIEU,AL  
    
    XOR BX,BX
    
    MOV BL,TICH
    MUL BL
    MOV TICH,AL
    MOV AL,THUONG
    
    MOV BL,SO
    DIV BL
    MOV THUONG,AL
    
    
    OR TONG,30H 
    OR HIEU,30H  
    OR TICH,30H  
    OR THUONG,30H  
       
    MOV AH,9
    LEA DX,TBAO3
    INT 21H 
    
    MOV AH,4CH
    INT 21H

    NHAP PROC
    MOV AH,9
    LEA DX,TBAO1
    INT 21H 
    
    MOV AH,1
    INT 21H  
    CMP AL,'0'
    JB NHAP
    CMP AL,'9'
    JA NHAP
    AND AL,0FH   
    RET
    NHAP ENDP
    
    
   
END