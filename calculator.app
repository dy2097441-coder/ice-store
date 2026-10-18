ICEBERG-APP 2
# Calculator for Iceberg OS - whole numbers only
title Calculator
size 248 352

var acc 0
var cur 0
var op 0
var fresh 1

display 14 12 218 40 cur

button 14 64 50 44 clear C
button 70 64 50 44 negate +/-
button 126 64 50 44 operator:5 %
button 182 64 50 44 operator:4 /

button 14 114 50 44 digit:7 7
button 70 114 50 44 digit:8 8
button 126 114 50 44 digit:9 9
button 182 114 50 44 operator:3 *

button 14 164 50 44 digit:4 4
button 70 164 50 44 digit:5 5
button 126 164 50 44 digit:6 6
button 182 164 50 44 operator:2 -

button 14 214 50 44 digit:1 1
button 70 214 50 44 digit:2 2
button 126 214 50 44 digit:3 3
button 182 214 50 44 operator:1 +

button 14 264 106 44 digit:0 0
button 126 264 50 44 back Del
button 182 264 50 44 equals =

key 0 digit:0
key 1 digit:1
key 2 digit:2
key 3 digit:3
key 4 digit:4
key 5 digit:5
key 6 digit:6
key 7 digit:7
key 8 digit:8
key 9 digit:9
key + operator:1
key - operator:2
key * operator:3
key / operator:4
key % operator:5
key = equals
key enter equals
key backspace back
key c clear

on clear
set acc 0
set cur 0
set op 0
set fresh 1
set err 0
end

on negate
set cur -cur
end

on digit
set err 0
if fresh
set cur 0
set fresh 0
endif
if cur < 100000000 && cur > -100000000
if cur >= 0
set cur cur * 10 + arg
else
set cur cur * 10 - arg
endif
endif
end

on back
if fresh == 0
set cur cur / 10
endif
end

on operator
if op != 0 && fresh == 0
call compute
endif
set acc cur
set op arg
set fresh 1
end

on equals
if op != 0
call compute
endif
set op 0
set fresh 1
end

on compute
if op == 1
set cur acc + cur
endif
if op == 2
set cur acc - cur
endif
if op == 3
set cur acc * cur
endif
if op == 4
if cur == 0
set err 1
else
set cur acc / cur
endif
endif
if op == 5
if cur == 0
set err 1
else
set cur acc % cur
endif
endif
end
