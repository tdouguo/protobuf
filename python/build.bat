@echo off

echo --delete all files in Output\ [ɾ���ɵ������ļ�]
del /q Output\*

../protoc-win32/bin/protoc.exe -I=./ --python_out=./Output Demo.proto


 
echo --completed!!![�����չ�]

pause
exit