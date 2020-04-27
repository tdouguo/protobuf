@echo off

echo --delete all files in Output\ [删除旧的生成文件]
del /q Output\*

../protoc-win32/bin/protoc.exe -I=./ --python_out=./Output Demo.proto


 
echo --completed!!![打完收工]

pause
exit