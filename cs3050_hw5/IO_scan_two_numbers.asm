start:  lodd on:
        stod 4095
        call xbsywt:
        loco str1:
nextw:  pshi
        addd c1:
        stod pstr1:
        pop
        jzer crnl:
        stod 4094
        push
        subd c255:
        jneg crnl:
        call sb:
        insp 1
        push
        call xbsywt:
        pop
        stod 4094
        call xbsywt:
        lodd pstr1:
        jump nextw:
crnl:   lodd cr:
        stod 4094
        call xbsywt:
        lodd nl:
        stod 4094
        call xbsywt:
        lodd on:                ; mic1 program to print string
        stod 4093               ; and scan in a 1-5 digit number
bgndig: call rbsywt:            ; using CSR memory locations
        lodd 4092
        subd numoff:
        push
nxtdig: call rbsywt:
        lodd 4092
        stod nxtchr:
        subd nl:
        jzer endnum:
        mult 10
        lodd nxtchr:
        subd numoff:
        addl 0
        stol 0
        jump nxtdig:
endnum: lodd numptr:
        popi
        addd c1:
        stod numptr:
        lodd numcnt:
        jzer addnms:
        subd c1:
        stod numcnt:
        jump start:   
addnms: lodd binum1:
        addd binum2:
        stod biansw:
        lodd on:
        stod 4095
        call xbsywt:
        loco str2:
        call print:
        lodd on:
        stod 4095
        call xbsywt:
        lodd biansw:
        call print:
        halt
        call cnvert:
over:   lodd on:
        stod 4095
        call xbsywt:
        loco str3:
        call print:
        halt
cnvert: lodd biansw:
        jzer cvtFin:
        div  10
        addd numoff:
        push
        lodd count:
        addd c1:
        stod count:
        call cnvert:
cvtFin: lodd on:
        stod 4095
        call xbsywt:
        call prtSum:
        retn
prtSum: jzer dnePrt:
        popi
        call print:
        lodd count:
        subd c1:
        stod count:
        jump prtSum:
dnePrt: retn
print:  pshi
        addd c1:
        stod pstr1:
        pop
        jzer done:
        stod 4094
        push
        subd c255:
        jneg done:
        call sb:
        insp 1
        push
        call xbsywt:
        pop
        stod 4094
        call xbsywt:
        lodd pstr1:
        jump print:
done:   lodd cr:
        stod 4094
        call xbsywt:
        lodd nl:
        stod 4094
        addd mask:
        stod 4095
        retn
xbsywt: lodd 4095
        subd mask:
        jneg xbsywt:
        retn
rbsywt: lodd 4093
        subd mask:
        jneg rbsywt:
        retn
sb:     loco 8
loop1:  jzer finish:
        subd c1:
        stod lpcnt:
        lodl 1
        jneg add1:
        addl 1
        stol 1
        lodd lpcnt:
        jump loop1:
add1:   addl 1
        addd c1:
        stol 1
        lodd lpcnt:
        jump loop1:
finish: lodl 1
        retn
numoff: 48
nxtchr: 0
numptr: binum1:
binum1: 0
binum2: 0
biansw: 0
asciAn: 0
count:  0
lpcnt:  0
mask:   10
on:     8
nl:     10
cr:     13
c1:     1
c10:    10
c255:   255
sum:    0
numcnt: 1
pstr1:  0
str1:   "Please enter a between 1 and 32767 digit number followed by enter"
str2:   "The sum of these integers are:"
str3:   "Overflow, no sum possible"