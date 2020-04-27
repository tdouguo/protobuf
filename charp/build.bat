@echo off

cd ProtobufModel

echo --delete all files in bin\Release\ [ɾ���ɵ������ļ�]
del /q bin\Release\*

echo --delete all files in obj\Release\ [ɾ���ɵ������ļ�]
del /q obj\Release\*

echo --gen proto message to ProtobufModel.cs [���ɽ�������,ȫ���ŵ�һ��csԴ����]
cd ..\gen
call __genbat.bat

echo --compile ProtobufModel.cs [����Դ�� ����DLL]
cd ..\ProtobufModel
C:\Windows\Microsoft.NET\Framework\v4.0.30319\Csc.exe /noconfig /nowarn:1701,1702 /nostdlib+ /errorreport:prompt /warn:4 /define:TRACE /reference:C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.dll /reference:protobuf-net.dll /reference:C:\Windows\Microsoft.NET\Framework\v2.0.50727\System.dll /debug:pdbonly /filealign:512 /optimize+ /out:obj\Release\ProtobufModel.dll /target:library /utf8output ProtobufModel.cs Properties\AssemblyInfo.cs

echo --output to bin\Release\ [����DLL���·��]
copy obj\Release\ProtobufModel.dll bin\Release\ProtobufModel.dll
copy obj\Release\ProtobufModel.pdb bin\Release\ProtobufModel.pdb
copy protobuf-net.dll bin\Release\protobuf-net.dll

echo --precompile ProtobufModel.dll [����ר�����л���DLL�ļ�]
cd bin\Release
..\..\..\protobuf-net\Precompile\precompile.exe ProtobufModel.dll -o:ProtobufModelSerializer.dll -t:ProtobufModelSerializer

: �����ļ���ָ���ļ���
echo --copy dlls to unity project [�����ļ���ָ���ļ���Bin]
copy ProtobufModel.dll ..\..\..\Output\Bin\ProtobufModel.dll
copy ProtobufModelSerializer.dll ..\..\..\Output\Bin\ProtobufModelSerializer.dll
copy protobuf-net.dll ..\..\..\Output\Bin\protobuf-net.dll
copy ..\..\..\ProtobufModel\ProtobufModel.cs ..\..\..\Output\ProtobufModel.cs

echo --completed!!![�����չ�,��ȥ��ǰ�ļ���Bin�¸�������DLL�����U3D��Ŀ��]

pause
exit