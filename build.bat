@echo off
color 3

if %1==windows (
  md hxml
  cd hxml
  fsutil file createnew cpp.hxml 0
  
  echo --class-path src>>cpp.hxml
  echo --cpp ../bin/cpp/Server.exe
)
