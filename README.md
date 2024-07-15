# mips-asm-spim

Examples of simple programs written in MIPS assembly
language and designed to run in the SPIM simulator.

## 1. Requirements

To work effectively with the repository, you need
to install several programs. This section of the README
is dedicated to the description and installation
of the necessary programs.

> [!IMPORTANT]
> I use Ubuntu (WSL),
> so the listed commands are relevant,
> to a greater extent, for such systems.

### 1.1 SPIM

To download and execute MIPS assembly language
example program files, you must install the SPIM simulator.

SPIM is a self-contained simulator that runs
MIPS32 programs. It reads and executes assembly
language programs written for this processor.
Spim also provides a simple debugger and minimal set
of operating system services. Spim does not execute
binary (compiled) programs[^1].

SPIM implements almost the entire MIPS32 
assembler-extended instruction set. 
(It omits most floating point comparisons and 
rounding modes and the memory system page tables.)
The MIPS architecture has several variants that differ
in various ways (e.g., the MIPS64 architecture supports
64-bit integers and addresses), which means that Spim will
not run programs for all MIPS processors[^1].

To install SPIM you can use the command:

```
sudo apt install spim -y
```

I have the following version of SPIM installed:

```
$ apt-cache policy spim
spim:
  Installed: 8.0+dfsg-6.1
  Candidate: 8.0+dfsg-6.1
  Version table:
 *** 8.0+dfsg-6.1 500
        500 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages
        100 /var/lib/dpkg/status
```

### 1.2 Make

For convenience, loading and executing the source
code in assembly language in the SPIM simulator is
wrapped with calls GNU Make utility. At the root of
the repository there is a ```Makefile``` that
describes the rules for running each example program.

GNU Make is a tool which controls the generation
of executables and other non-source files of a program 
from the program's source files[^2].

Make gets its knowledge of how to build your program
from a file called the makefile, which lists each of
the non-source files and how to compute it from other files.
When you write a program, you should write a makefile for it,
so that it is possible to use Make to build and
install the program[^2].

To install Make you can use the command:

```
sudo apt install make -y
```

I have the following version of Make installed:

```
$ apt-cache policy make
make:
  Installed: 4.3-4.1build1
  Candidate: 4.3-4.1build1
  Version table:
 *** 4.3-4.1build1 500
        500 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages
        100 /var/lib/dpkg/status
```

[^1]: [SPIM: A MIPS32 Simulator](https://spimsimulator.sourceforge.net/)

[^2]: [Make - GNU Project - Free Software Foundation](https://www.gnu.org/software/make/)

## 2. Usage

To run example programs, simply call the make
utility in the command line, specifying the target
(the name of the example program) as shown below.

```
make [example program name]
```

When called without a target (without a target program name), a usage hint will be shown with a list of available example programs.

If the target name (the name of the example program) is invalid, Make will report this.

### 2.1 Usage example

Running the sample program `hello`:

```
make hello
```

Result:

```
SPIM Version 8.0 of January 8, 2010
Copyright 1990-2010, James R. Larus.
All Rights Reserved.
See the file README for a full copyright notice.
Loaded: /usr/lib/spim/exceptions.s
Hello, world!
```

The first five lines do not refer to the
hello example program. This is the SPIM
simulator launch message.
