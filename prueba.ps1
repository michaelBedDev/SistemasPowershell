    #Amosa a data
Get-Date
    #Lista os directorios ou arquivos que hai en Windows/System32
    #e que o seu nome comece por w.
Get-ChildItem c:\windows\system32\w* | select Name
    #Fai a seguinte estrutura de directorios e arquivos:
    #C:
    #    SISTEMAS
    #    DOS
    #    MANUAL
    #        manual.txt
    #    EXERCICIOS
    #        folla1.txt
    #        folla2.txt
New-Item -Path "c:\" -Name "SISTEMAS" -ItemType "directory"
New-Item -Path "c:\" -Name "DOS" -ItemType "directory"
New-Item -Path "c:\" -Name "MANUAL" -ItemType "directory"
New-Item -Path "c:\" -Name "EXERCICIOS" -ItemType "directory"

New-Item -Path "c:\MANUAL\" -Name "manual.txt" -ItemType "file"
New-Item -Path "c:\EXERCICIOS\" -Name "folla1.txt" -ItemType "file"
New-Item -Path "c:\EXERCICIOS\" -Name "folla2.txt" -ItemType "file"
    #Copia todos os ficheiros do directorio ejercicios a C cunha soa orde.
Copy-Item -Path "C:\EXERCICIOS\*" -Destination "C:\"
    #Crea un directorio en C que se chame PRACTICA2
    #e copia o ficheiro LABEL.EXE do subdirectorio SYSTEM32 de WINDOWS
    #en PRACTICA2 pero co nome ETIQUETA.EXE.
    #Podes utilizar 2 comandos.
New-Item -Path "C:\" -Name "PRACTICA2" -ItemType "directory"
Copy-Item -Path "C:\Windows\System32\label.exe" -Destination "C:\PRACTICA2\ETIQUETA.exe"
    #Copia todos os ficheiros do directorio EXERCICIOS
    #a PRACTICA2 cunha soa orde.
Copy-Item -Path "C:\EXERCICIOS\*" -Destination "C:\PRACTICA2"
#Copia todos os ficheiros do directorio PRACTICA2
# que teñen extensión txt no directorio DOS
# pero coa extensión sol, cunha soa orde.
Copy-Item -Path "C:\PRACTICA2\*.txt" -Destination "C:\DOS" -PassThru | Rename-Item -Path "C:\DOS\*.txt" -NewName "*.sol"
#Con ruta absoluta renomea o ficheiro
#folla1.sol que se atopa en DOS como folla.dat
Rename-Item -Path "C:\DOS\folla1.sol" -NewName "folla.dat"
#Copia todo o directorio Sistemas noutro directorio chamado CopySist
# cunha soa orde.
Copy-Item -Path "C:\SISTEMAS\*.*" -Destination "C:\CopySist\" -Recurse
