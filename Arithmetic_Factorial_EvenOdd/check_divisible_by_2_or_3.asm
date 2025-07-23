.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB "Enter number: $"
    divBy3 DB 0AH, "It is divisble by 3.$"
    divBy2 DB 0AH, "It is divisble by 2.$"
    notByBoth DB 0AH, "It is divisble neither by 2 nor 3.$"
    temp DW ?
    num DW 0
.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09
    LEA DX, msg1
    INT 21H
    
    CALL INPUT
    
    MOV AX, num
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    JNE skipBy2
    
    MOV AH, 09H
    LEA DX, divBy2
    INT 21H
    
    skipBy2:
    
    MOV AX, num
    MOV BL, 3
    
    DIV BL
    
    CMP AH, 0
    JNE skipBy3
    
    MOV AH, 09H
    LEA DX, divBy3
    INT 21H
    JMP endpr
    
    skipBy3:
    MOV AX, num
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    JE endpr

    MOV AH, 09H
    LEA DX, notByBoth
    INT 21H
    
    endpr:
    
    MOV AH, 4CH
    INT 21H
        

MAIN ENDP

INPUT PROC
    
    start:
                        
        MOV AH, 01H
        INT 21H
        
        CMP AL, 0DH
        JE endLoop

        SUB AL, '0'        
        MOV AH, 0
        
        MOV temp, AX    ;keeping input in temp = 5
        
        MOV AX, 10
        MOV BX, num    ;res in DX:AX
        
        MUL BX
        MOV num, AX    
        MOV AX, temp    ;again 5 in temp
        ADD num, AX    ;res in num1
        
        JMP start
        
    endLoop:
        RET
        
INPUT ENDP

END MAIN
