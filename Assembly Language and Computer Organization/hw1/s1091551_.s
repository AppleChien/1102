###1091551簡珮庭
#####################
# Fibonnaci Example #
#####################

.globl __start

.rodata
  msg1: .string "Please enter a number: "
  msg2: .string "The "
  msg3: .string " fibonnaci number is: "
  msg4: .string "Number of instructions being executed: "###msg4
  msg5: .string "The Average number of instructions executed per fibonnaci number: "###msg5
  msg6: .string "The slope of fibonnaci number between the given two integers: "###msg6

.text

__start:
  li t0, 0
  li t1, 1
  # prints msg1
  li a0, 4
  la a1, msg1
  ecall
  # reads an int and moves it to register t3
  li a0, 5
  ecall
  mv t3, a0
  mv s3,t3 ###s3:read first integer
  # prints a newline
  li a0, 11
  li a1, '\n'
  ecall
  # prints msg2
  li a0, 4
  la a1, msg2
  ecall
  # prints the int value in t3
  li a0, 1
  mv a1, t3 
  ecall
  li t4 ,19###count instructions being executed
  # fibonnaci program
fib:
  addi t4,t4,+1###count instructions being executed
  beq t3, zero, finish
  addi t4,t4,+5
  add t2, t1, t0
  mv t0, t1
  mv t1, t2
  addi t3, t3, -1
  j fib 
  
finish:
  # prints msg3
  li a0, 4
  la a1, msg3
  ecall
  # prints the result in t0
  li a0, 1
  mv a1, t0
  ecall
  addi t4,t4,+6
  ###prints a newline
  li a0, 11
  li a1, '\n'
  ecall
  li a0, 4
  la a1, msg4 ###print msg4
  ecall
  li a0, 1
  mv a1, t4 
  mv s6,t4 ###s6:msg4 ans
  ecall
  
__start2: ###copy start
  ###prints a newline
  li a0, 11
  li a1, '\n'
  ecall
  
  li s1, 0
  li t1, 1
  # prints msg1
  li a0, 4
  la a1, msg1
  ecall
  # reads an int and moves it to register t4
  li a0, 5
  ecall
  mv t4, a0
  mv s4,t4 ###s4:read second integer
  ###prints a newline
  li a0, 11
  li a1, '\n'
  ecall
  # prints msg2
  li a0, 4
  la a1, msg2
  ecall
  # prints the int value in t4
  li a0, 1
  mv a1, t4
  ecall
  li t5 ,19 ###count instructions being executed
  # fibonnaci program
fib2: ###copy fib
  addi t5,t5,+1###count instructions being executed
  beq t4, zero, finish2
  addi t5,t5,+5###count instructions being executed
  add t2, t1, s1
  mv s1, t1
  mv t1, t2
  addi t4, t4, -1
  j fib2

finish2: ###copy finish
  #prints msg3
  li a0, 4
  la a1, msg3
  ecall
  # prints the result in s1
  li a0, 1
  mv a1, s1
  ecall
  addi t5,t5,+6 ###count instructions being executed
  ###prints a newline
  li a0, 11
  li a1, '\n'
  ecall
  li a0, 4
  la a1, msg4 ###print msg4 
  ecall
  li a0, 1
  mv a1, t5 
  mv s5,t5 ###s5:msg4 ans
  ecall
#count:
  ###prints a newline
  li a0, 11
  li a1, '\n'
  ecall
  li a0, 4
  la a1, msg5 ###print msg5
  ecall
  sub s5,s5,s6 ###s5:second ins - first ins
  sub s4,s4,s3 ###s4:second int - first int
  div t4,s5,s4
  li a0, 1
  mv a1, t4 ###t4:ms5 answer=s5/s4
  ecall
  ###prints a newline
  li a0, 11
  li a1, '\n'
  ecall
  li a0, 4
  la a1, msg6 ###print msg6
  ecall
  sub t1,s1,t0 ###t1:second fib - first fib
  #ecall
  div t4,t1,s4
  li a0, 1 
  mv a1, t4 ###t4:ms6 answer=t1/s4
  ecall
  # ends the program with status code 0
  li a0, 10
  ecall
  
