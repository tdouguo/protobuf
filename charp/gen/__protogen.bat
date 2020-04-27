@echo off

cd ..\
protobuf-net\ProtoGen\protogen.exe ^
-i:Demo.proto ^
-o:ProtobufModel\ProtobufModel.cs -ns:ProtobufModel
cd gen
