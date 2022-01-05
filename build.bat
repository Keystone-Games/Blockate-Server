@echo off
color 3

if %1==nodejs (
  md hxml
  cd hxml
  fsutil file createnew nodejs.hxml 0
  
  echo --class-path src>>nodejs.hxml
  echo --cpp ../bin/cpp/Server.exe>>nodejs.hxml
  echo -L hxnodejs>>nodejs.hxml
  echo --main Main>>nodejs.hxml
  
  haxe nodejs.hxml
)
