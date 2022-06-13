#Student ID:1091551
#Name:簡珮庭
.global __start
.rodata
    msg1: .string"Input the number of test cases: "
    msg2: .string"Input the number of integers in a test case: "
    msg3: .string"Start to read data from the keyboard: \n"
    msg4: .string"Start sorting: \n"
    msg5: .string"The sorted list is: \n"
    msg6: .string"The median(s) is(are):"
  #The above messages are printed out to direct the input process or provide information about output.
.data
    ary:.zero 4000 # set up a buffer of 4000 bytes to hold the data read from the keyboard.
    
.text
__start:
  # prints msg1
  li a0, 4     ###output code
  la a1, msg1  ###output msg1
  ecall        ###system call
   # reads an int and moves it to t0 
  li a0, 5     ###input 輸入執行幾次
  ecall        ###system call
  mv t0, a0    ###move a0 to s1
  j input      ###go to input function
  
newline:
  li a0, 11    ###output code
  li a1, '\n'  ###make a new line
  ecall        ###system call
  
# sorting input number
input:
  # prints msg2  
  li a0, 4     ###output code
  la a1, msg2  ###output msg2
  ecall        ###system call
  # reads an int and moves it to t3 
  li a0, 5     ###input 要輸入幾個數字
  ecall        ###system call
  mv t1, a0    ###move a0 to t1
  mv t3, a0    ###move a0 to t3
  # prints msg3
  li a0, 4     ###output code
  la a1, msg3  ###output msg3
  ecall        ###system call
  la t2, ary   ###load an array
inputfor:
  beq t3, zero, sorting ###if t3!=0 go to sorting function
  addi t3, t3, -1       ###t3-1
  li a0, 5              ###input 輸入數字
  ecall                 ###system call
  sw a0, 0(t2)          ###input number put in array(t2)
  addi t2, t2, 4        ###t2 shift back
  j inputfor            ###go to inputfor function  
sorting:
  li t3, 0              ###make i==0(t3)
iloop:
  bge t3, t1, evenans   ###if i>=n end loop
  addi t4, t3, -1       ###make j==i-1 (t4==t3-1)
jloop:
  la t2, ary            ###load an array
  blt t4, zero,iloopend ###if j<0
  slli t5, t4, 2        ###j left shift 4 bits
  add t5, t2, t5        ###t5是address
  lw t2, 0(t5)          ###t2==ary[j]
  lw t6, 4(t5)          ###t6==ary[j+1]
  ble t2, t6, iloopend  ###if ary[j]<=ary[j+1] go to iloopend function
  sw t2, 4(t5)          ###ary[j+1]==ary[j]
  sw t6, 0(t5)          ###ary[j]==ary[j+1]
  addi t4, t4, -1       ###j--
  j jloop                ###go to jloop function
iloopend:
  addi t3,t3,1          ###i++
  j iloop                ###go to iloop function

# find median 
evenans:
  # prints msg6
  li a0, 4              ###output code
  la a1, msg6           ###output msg6
  ecall                 ###system call
  li t5, 2              ###make t5==2
  la t2, ary            ###load an array
  div t6, t1, t5        ###test cases/2 ans
  rem t3, t1, t5        ###test cases%2 ans
  bne t3, zero, oddans  ###if test cases=odd go to oddans function
  li t3, 1              ###t3=1
  sub t6, t6, t3        ###output ary[test median cases -1]和ary[test median cases]
  slli t6, t6, 2        ###t6 left shift 4 bits
  add t6, t2, t6        ###t6==ary's median
  lw t5, 0(t6)          ###store median
  li a0, 1              ###output code
  mv a1, t5             ###output median
  ecall                 ###system call
  li a0, 11             ###output code
  li a1, ' '            ###output space
  ecall                 ###system call
  lw t5, 4(t6)          ###store median
  li a0, 1              ###output code
  mv a1, t5             ###output median
  ecall                 ###system call
  addi t0, t0, -1       ###test cases --
  bne t0, zero, newline ###if t0!=0 go to newline function
  # ends the program with status code 0
  li a0, 10             ###end
  ecall                 ###system call  
oddans:
  slli t6, t6, 2        ###t6 left shift 4 bits
  add t6, t2, t6        ###t6==ary's median
  lw t5, 0(t6)          ###store median
  li a0, 1              ###output code
  mv a1, t5             ###output median
  ecall                 ###system call
  addi t0, t0, -1       ###test cases --
  bne t0, zero, newline ###if t0!=0 go to newline function
# ends the program with status code 0
  li a0, 10             ###end
  ecall                 ###system call 
