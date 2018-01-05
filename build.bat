@echo off

tools\spasm src\rom0.asm -E -L -O obj\rom0.lab
tools\spasm src\rom1.asm -E -L -O obj\rom1.lab
tools\spasm src\rom2.asm -E -L -O obj\rom2.lab

python tools\filter.py obj/rom0.lab obj/rom1.lab obj/rom2.lab obj/r?.inc

tools\spasm -V "#include \"obj/r2.inc\" \\ #include \"src/rom2.asm\"" -E obj\rom2.bin
tools\spasm -V "#include \"obj/r1.inc\" \\ #include \"src/rom1.asm\"" -E obj\rom1.bin
tools\spasm -V "#include \"obj/r0.inc\" \\ #include \"src/rom0.asm\"" -E obj\rom0.bin

rem tools\spasm src\tstr.asm -L -E -O



 
