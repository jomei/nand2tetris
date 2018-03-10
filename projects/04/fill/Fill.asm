// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

  @KBD
  D=A
  @screenEnd
  M=D

  @prevColor
  M=0

  @color
  M=0

(LISTEN)
  @SCREEN
  D=A
  @current
  M=D

  @KBD
  D=M
  @PRESSED
  D;JGT

  @color
  D=M
  @LISTEN
  D;JEQ // if color is still white jump to listen

  @color
  M=0
  @FILL
  0;JMP

(PRESSED)
  @color
  D=M
  @LISTEN // if color is still black jump to listen
  D;JLT

  @color
  M=-1

(FILL)
   @screenEnd
   D=M
   @current
   D=D-M
   @LISTEN
   D;JEQ

   @color
   D=M

   @current
   A=M
   M=D

   @current
   M=M+1

   @FILL
   0;JMP
