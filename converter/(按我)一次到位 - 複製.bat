@echo off
IF EXIST input (
echo running step01 ...
) else (
@echo on
echo ERROR!! folder input does not exit
@echo off
pause
)
dir input > checkInputFolder.txt
find ".conv" checkInputFolder.txt
If Errorlevel 1 (
@echo on
echo ERROR!! conv file does not exit
@echo off
del /f checkInputFolder.txt
pause
) else (
echo running step 02 ...
del /f checkInputFolder.txt
)
IF EXIST outconv.txt (
echo running step 03 ...
del /f outconv.txt
cd input
for %%i in (*.conv) DO @echo %%i >> outconv.txt
cd ..
mv input/outconv.txt outconv.txt
) else (
echo running step 04 ...
cd input
for %%i in (*.conv) DO @echo %%i >> outconv.txt
cd ..
mv input/outconv.txt outconv.txt
)
for /f %%i in (outconv.txt) do set /a n+=1
echo %n% > numb_of.txt
find "1" numb_of.txt
If Errorlevel 1 (
@echo on
echo ERROR!! have 1 or more conv files.
@echo off
pause
) else (
echo running step 05 ...
del /f numb_of.txt
)
del b.txt 2>NUL
echo strInput = "outconv.txt" >outconv.vbs
echo strOutput = "b.txt" >>outconv.vbs
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >>outconv.vbs
echo Set objInput = objFSO.OpenTextFile(strInput, 1) >>outconv.vbs
echo Set objOutput = objFSO.OpenTextFile(strOutput, 2, True, 0) >>outconv.vbs
echo Do Until objInput.AtEndOfStream >>outconv.vbs
echo strLine = Replace(objInput.ReadLine, ".conv", "") >>outconv.vbs
echo objOutput.WriteLine strLine >>outconv.vbs
echo Loop >>outconv.vbs
echo objInput.Close >>outconv.vbs
echo objOutput.Close >>outconv.vbs
cscript //nologo outconv.vbs
move /Y b.txt outconv.txt
del outconv.vbs
IF EXIST output (
echo running step 06 ...
rmdir /Q /S output
mkdir output
) ELSE (
echo running step 07 ...
mkdir output
)
set /p build=<outconv.txt
set ds=.conv
del /f outconv.txt
set STR2=%build:~0,-1%
set slashinput=input/
echo %slashinput%%STR2%%ds% > location.txt
call conv2mif.bat < location.txt
del /f location.txt
cd input
dir > checkHmif.txt
find ".mif" checkHmif.txt
If Errorlevel 1 (
@echo on
echo ERROR!! mif file does not exit
@echo off
del /f checkHmif.txt
pause
) else (
echo running step 08 ...
del /f checkHmif.txt
)
IF EXIST outmif.txt (
echo running step 09 ...
del /f outmif.txt
for %%i in (*.mif) DO @echo %%i >> outmif.txt
) else (
echo running step 10...
for %%i in (*.mif) DO @echo %%i >> outmif.txt
)
del b.txt 2>NUL
echo strInput = "outmif.txt" >outmif.vbs
echo strOutput = "b.txt" >>outmif.vbs
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >>outmif.vbs
echo Set objInput = objFSO.OpenTextFile(strInput, 1) >>outmif.vbs
echo Set objOutput = objFSO.OpenTextFile(strOutput, 2, True, 0) >>outmif.vbs
echo Do Until objInput.AtEndOfStream >>outmif.vbs
echo strLine = Replace(objInput.ReadLine, ".mif", "") >>outmif.vbs
echo objOutput.WriteLine strLine >>outmif.vbs
echo Loop >>outmif.vbs
echo objInput.Close >>outmif.vbs
echo objOutput.Close >>outmif.vbs
cscript //nologo outmif.vbs
move /Y b.txt outmif.txt
del outmif.vbs
for /f %%i in (outmif.txt) do set /a nkn+=1
echo %nkn% > numb_of.txt
find "1" numb_of.txt
If Errorlevel 1 (
@echo on
echo ERROR!! have 1 or more mif files.
@echo off
pause
) else (
echo running step 11 ...
del /f numb_of.txt
)
set /p omd=<outmif.txt
set mds=.mif
del /f outmif.txt
set ms2=%omd:~0,-1%
cd ..
echo %slashinput%%ms2%%mds% > location.txt
call loader.bat < location.txt
del /f location.txt
mv %slashinput%%ms2%%mds% output/%ms2%%mds%
mv code.mif output/code.mif
echo complete
pause