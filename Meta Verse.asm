; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'
org 100h

.data
str db 'Enter number of points : $'  ;take points from user
stri db 0ah,0dh,'Enter consecutive points : $'
str1 db 0ah,0dh,'($'
str2 db ',$'
str3 db ')$'
str4 db 0ah,0dh,'($'
str5 db ',$'
str6 db ')$'
str7 db 0ah,0dh,'($'
str8 db ',$'
str9 db ')$'
str10 db 0ah,0dh,'($'
str11 db ',$'
str12 db ')$'
str13 db 0ah,0dh,'($'
str14 db ',$'
str15 db ')$'
str16 db 0ah,0dh,'($'
str17 db ',$'
str18 db ')$'
str19 db 0ah,0dh,'($'
str20 db ',$'
str21 db ')$'
str22 db 0ah,0dh,'Unknown!$'
str23 db 0ah,0dh,'Square!$'
str24 db 0ah,0dh,'Rectangle!$'
str25 db 0ah,0dh,'Triangle!$'
str26 db 0ah,0dh,'$'

np db ? ;number of points


;Points of Triangle:
x1 db ?
y1 db ?
x2 db ?
y2 db ?
x3 db ?
y3 db ?

;Points of Rectangle and Square
x4 db ?
y4 db ?
x5 db ?
y5 db ?
x6 db ?
y6 db ?
x7 db ?
y7 db ?   
; diff beteewn 2 points
difx45 db ?
dify45 db ?
difx56 db ?
dify56 db ?



.code
mov ax,@data
mov ds,ax
main proc
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str
    int 21h ;display str
    
    mov ah,01h
    int 21h
    sub al,30h
    mov np,al
    
    cmp np,3 ;np=3-3
    je l3;jump to l3 if result eqal 0
    jl un;jump to unknown if result < 3
    cmp np,4
    je l4;jump to l4 if result eqal 0
    jg un; jump to unknown if result > 4
;--------------------------------------------    
;take 3 points of the triangle    
    l3:
    
    
    mov ax,000h
    mov ah,09h
    mov dx,offset stri
    int 21h
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov x1,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str2
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov y1,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str3
    int 21h
;----------------------------------------------    
    mov ax,000h
    mov ah,09h
    mov dx,offset str4
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov x2,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str5
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov y2,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str6
    int 21h
    
;-----------------------------------------------
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str7
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov x3,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str8
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov y3,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str9
    int 21h
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str25
    int 21h
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str26
    int 21h
    
    
 ;draw triangle   
    mov bx,1
    mov cx,5
    
   LR1:
    push cx
    mov ah,2
    mov dl,32
   
   LR2:
    int 21h
    LOOP LR2   
   
   
   mov cx,bx        
   mov dl,'*' 
 
  LR3:
   int 21h
   LOOP LR3
   
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21H
   inc bx
   inc bx   
   pop cx  
   LOOP LR1      
  
    jmp exit
;--------------------------------------------------
;--------------------------------------------------    
;take 4 points for rectanle and square    
    l4:
    mov ax,000h
    mov ah,09h
    mov dx,offset stri
    int 21h
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str10
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov x4,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str11
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov y4,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str12
    int 21h
;----------------------------------------------    
    mov ax,000h
    mov ah,09h
    mov dx,offset str13
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov x5,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str14
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov y5,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str15
    int 21h
    
;-----------------------------------------------

    mov ax,000h
    mov ah,09h
    mov dx,offset str16
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov x6,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str17
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov y6,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str18
    int 21h
;--------------------------------------------------

    mov ax,000h
    mov ah,09h
    mov dx,offset str19
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov x7,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str20
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov y7,al
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str21
    int 21h    



;Comparisons to determine if the shape is square or rectangular    
    mov al,x4
    cmp al,x5
    je  label1  
    jne label4
    
    label1:
    mov al,x6
    cmp al,x7
    je  label2  
    jne label4
    
    label2:
    mov al,y5
    cmp al,y6
    je  label3  
    jne label4
    
    label3:
    mov al,y4
    cmp al,y7  
    je  length2
    jne label4

    
    label4:
    mov al,y4
    cmp al,y5
    je label5  
    jne un
    
    label5:
    mov al,y6
    cmp al,y7
    je label6  
    jne un
    
    label6:
    mov al,x5
    cmp al,x6
    je label7  
    jne un
    
    label7:
    mov al,x4
    cmp al,x7  
    je length1
    jne un
    
  
     
    
    length2:
    
    mov al,y5
    sub al,y4
    mov dify45,al 
    
    mov al,x5
    sub al,x6
    mov difx56,al
    
        
    mov al,dify45    
    cmp al,difx56
    je  sq2
    jne rect2
    
    

        
    length1:
    
    mov al,x5
    sub al,x4
    mov difx45,al
    
    mov al,y6
    sub al,y5
    mov dify56,al  
    
    mov al,difx45
    cmp al,dify56
    je  sq1
    jne rect1
     
    
    
    
;draw square
    
    sq2:
      
    mov ax,000h
    mov ah,09h
    mov dx,offset str23
    int 21h
    mov bh,1
     PRINTN
     mov ah,2
     mov dl,'*'
     
     LOOP1:
     cmp bh,dify45; tol el del4
     jg LOOP1_EXIT
     mov bl,1
     
     LOOP2:
     cmp bl,dify45
     jg LOOP2_EXIT
     int 21h
     inc bl
     jmp LOOP2
     
     LOOP2_EXIT:
     PRINTN
     inc bh
     jmp LOOP1
     
     LOOP1_EXIT:
     mov ah,4ch
     int 21h
     jmp exit
     
     
     
;draw square        
    sq1:
    mov ax,000h
    mov ah,09h
    mov dx,offset str23
    int 21h
    mov bh,1
     PRINTN
     mov ah,2
     mov dl,'*'
     
     LOOP3:
     cmp bh,dify56
     jg LOOP3_EXIT
     mov bl,1
     
     LOOP4:
     cmp bl,dify56
     jg LOOP4_EXIT
     int 21h
     inc bl
     jmp LOOP4
     
     LOOP4_EXIT:
     PRINTN
     inc bh
     jmp LOOP3
     
     LOOP3_EXIT:
     mov ah,4ch
     int 21h
    jmp exit
   
;draw rectangle   
    rect1:
    mov ax,000h
    mov ah,09h
    mov dx,offset str24
    int 21h 
    mov bh,1
     PRINTN
     mov ah,2
     mov dl,'*'
     
     LOOP5:
     cmp bh,difx45
     jg LOOP5_EXIT
     mov bl,1
     
     LOOP6:
     cmp bl,dify56
     jg LOOP6_EXIT
     int 21h
     inc bl
     jmp LOOP6
     
     LOOP6_EXIT:
     PRINTN
     inc bh
     jmp LOOP5
     
     LOOP5_EXIT:
     mov ah,4ch
     int 21h
    jmp exit
    
    
;draw rectangle      
    rect2:
    mov ax,000h
    mov ah,09h
    mov dx,offset str24
    int 21h 
    mov bh,1
     PRINTN
     mov ah,2
     mov dl,'*'
     
     LOOP7:
     cmp bh,difx56; tol el del4
     jg LOOP7_EXIT
     mov bl,1
     
     LOOP8:
     cmp bl,dify45
     jg LOOP8_EXIT
     int 21h
     inc bl
     jmp LOOP8
     
     LOOP8_EXIT:
     PRINTN
     inc bh
     jmp LOOP7
     
     LOOP7_EXIT:
     mov ah,4ch
     int 21h
     jmp exit   

;Unknown label
un:
    
    mov ax,000h
    mov ah,09h
    mov dx,offset str22
    int 21h    
    
    
    exit:
    mov ah,4ch
    int 21h
    
        
    main endp
end main
ret