###1091551簡珮庭#
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
  addi t4, t4, 0 ###t4:count time

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
  
  li t6, 19  ###t6:count instruction executed
  add t5, zero, t3 ###copy input to t5
  bne t4, zero ,fib###first time:make an array put result
  addi sp, sp, -40 ###make an array
  sw s0, 40(sp)    ###put in s0
  addi s0, sp, 40  ###new s0
  # fibonnaci program
fib:
  addi t6,t6,+1 ###t6:count instruction executed
  beq t3, zero, finish
  addi t6,t6,+5 ###t6:count instruction executed
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
  addi t6,t6,+6 ###t6:count instruction executed
  
  slli s2,t4,2 ###logical left shift(array address:byte))
  sub s2,s0,s2 ###s2=s0 change address
  sw t5, 0(s2) ###t5=s2[0]
  li t2,8      ###2,3,4,5 put count time&result,so should change it address(8 bits)
  sub s2,s2,t2 ###let s2 change it address
  sw t0, 0(s2) ###store t0(fib number)
  sub s2,s2,t2 ###let s2 change it address
  sw t6, 0(s2) ###store t6(instruction executed)
  
  li a0, 11    ###output code
  li a1, '\n'  ###output newline
  ecall        ###system call
  li a0, 4     ###output code
  la a1, msg4  ######output msg4
  ecall        ###system call
  li a0, 1     ###output code
  mv a1, t6    ###output instruction executed
  ecall        ###system call
  
  li a0, 11    ###output code
  li a1, '\n'  ###output newline
  ecall        ###system call
  addi t4, t4, 1 ###count time+1
  li t3, 2       ###make t3=2
  bne t4,t3,__start###loop:make count time t4=2;if not:run again from __start

#count:
  lw t3, 0(s0)     ###take first input number
  sub t3,t3,t5     ###t3=t3-t5:𝑘 − 𝑗
  lw t4, -16(s0)   ###take first instrution executed result
  sub t4,t4,t6     ###t4=t4-t6:𝐸𝑘 − 𝐸𝑗
  div t4,t4,t3     ###t4=t4/t3:(𝐸𝑘 − 𝐸𝑗)/(𝑘 − 𝑗) 
  li a0, 4         ###output code
  la a1, msg5      ######output msg5
  ecall            ###system call
  li a0, 1         ###output code
  mv a1, t4        ###output (𝐸𝑘 − 𝐸𝑗)/(𝑘 − 𝑗)result
  ecall            ###system call
  
  li a0, 11        ###output code
  li a1, '\n'      ###output newline
  ecall            ###system call
  lw t4, -8(s0)    ###take first fib result
  sub t4,t4,t0     ###t4=t4/t0:𝐹𝑘 − 𝐹𝑗
  div t4,t4,t3     ###t4=t4/t3:(𝐹𝑘 − 𝐹𝑗)/(𝑘 − 𝑗) 
  li a0, 4         ###output code
  la a1, msg6      ###output msg6
  ecall            ###system call
  li a0, 1         ###output code
  mv a1, t4        ###output (𝐹𝑘 − 𝐹𝑗)/(𝑘 − 𝑗)result
  ecall            ###system call
  
  # ends the program with status code 0
  li a0, 10
  ecall
  
