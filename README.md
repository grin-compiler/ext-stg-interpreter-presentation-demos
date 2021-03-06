# External STG interpreter presentation demos

Demo programs of the presentation

## Why and How the External STG Interpreter is Useful

**Abstract**  
*The external STG interpreter is a from scratch implementation of the STG machine in Haskell.
Currently it supports almost all GHC primops and RTS features.
It can run real world Haskell programs that were compiled with GHC Whole Program Compiler (GHC-WPC).
GHC-WPC is a GHC fork that exports the whole program STG IR.  
The external STG interpreter is an excellent tool to study the runtime behaviour of Haskell programs, i.e. it can run/interpret GHC or Pandoc.
The implementation of the interpreter is in plain simple Haskell, so it makes compiler backend and tooling development approachable for everyone.
It already has a programmable debugger which supports step-by-step evaluation, breakpoints and execution region based inspection.
It also can export the whole program memory state and call-graphs to files for further investigation.
These features make it easy to find a memory leak or to identify a performance bottleneck in a large real world Haskell application.*

[![Watch the video](https://img.youtube.com/vi/wt6iCgYmVGA/hqdefault.jpg)](https://youtu.be/wt6iCgYmVGA)

[youtube video](https://www.youtube.com/watch?v=wt6iCgYmVGA)  
[youtube video with fullscreen view](https://www.youtube.com/watch?v=Ey5OFPkxF_w)  
[slides](https://docs.google.com/presentation/d/1Lmfpwtx_7TbIAGYnSE0HqkawRu75y2GGwbObuu0xYPY/edit#slide=id.p)


## Build & Run

**You'll need 15GB of free space in total**

1. Watch the presentation
2. Clone this repository:
   ```
   git clone --recursive git@github.com:grin-compiler/ext-stg-interpreter-presentation-demos.git
   ```
2. Install External STG Interpreter
   ```
   cd ghc-whole-program-compiler-project/external-stg-interpreter
   stack install
   ```
   see: https://github.com/grin-compiler/ghc-whole-program-compiler-project/tree/master/external-stg-interpreter#example-usage
3. Install GHC-WPC  
   ```
   cd ghc-whole-program-compiler-project

   (cd mod-pak ; stack install)

   cd ghc-wpc
   ./boot
   ./configure
   hadrian/build-stack -j
   ```
   see: https://github.com/grin-compiler/ghc-whole-program-compiler-project#usage
4. Fix paths in the build scripts and stack.yaml files.  
   i.e. in `demo-02-minigame/stack.yaml` fix this path to point to your ghc-wpc:
   ```
   # use local GHC (for development)
   system-ghc: true
   extra-path:
     - /home/csaba/haskell/grin-compiler/ghc-whole-program-compiler-project/ghc-wpc/_build/stage1/bin
   ```
5. Compile `unzip` with zstd support **(optional)**  
   You'll need this to browse the content of `.modpak` and `.fullpak` files manually.
   ```
   cd unzip-zstd
   make -f unix/Makefile generic_zstd
   cp unzip $HOME/.local/bin
   ```
6. Reproduce the demo part of the presentation  
   https://youtu.be/wt6iCgYmVGA?t=2054

*If you have questions or if you have issues with the build steps please open an issue in this repo.*


### Docker instructions
**You'll need 15GB of free space in total**
This is an option if you're familiar with docker and don't want to build a compiler.
The container comes with ghc-wpc and ext-stg-interpreter build and the demo files are
available in `/root/`.
1. Watch the presentation
2. (optional) disable access control for X,
   this allows you to run X applications from within the container,
   but keep in mind this makes your system slightly less secure.
   ```
   xhost +
   ```
3. Run the container, it'll fetch it from dockerhub if not found:
   ```
   docker run -v /tmp/.X11-unix:/tmp/.X11-unix -it jappie/ext-stg-demo
   ```
4. Reproduce the demo part of the presentation
   https://youtu.be/wt6iCgYmVGA?t=2054


#### Docker build instructions

1. Watch the presentation
2. Clone this repository:
   ```
   git clone --recursive git@github.com:grin-compiler/ext-stg-interpreter-presentation-demos.git
   ```
3. ```
   cd ext-stg-interpreter-presentation-demos
   git submodule update --init --recursive
   docker build .
   xhost +
   docker run -v /tmp/.X11-unix:/tmp/.X11-unix -it whateverhash bash
   ```

4. Reproduce the demo part of the presentation  
   https://youtu.be/wt6iCgYmVGA?t=2054

+ note that the compiler lives in /root/ghc-whole-program-compiler-project/ghc-wpc/_build/stage1/bin/ghc
+ you can install additional programs with apt
