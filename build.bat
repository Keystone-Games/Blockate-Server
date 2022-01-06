@echo off
color 3

if %1==nodejs (
  haxelib install hxnodejs
  
  md hxml
  cd hxml
  fsutil file createnew nodejs.hxml 0
  
  echo --class-path src>>nodejs.hxml
  echo -lib hxnodejs>>nodejs.hxml
  echo -main Main>>nodejs.hxml
  echo -js ../bin/js/Server.js
  
  haxe nodejs.hxml
)
