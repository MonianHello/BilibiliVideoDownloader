@echo off
cls
:home
title MonianHello
color 3f
::2020年3月24日 23:58:13
echo ===========
echo.
echo [a]av号转为bv号
echo [b]bv号转为av号
echo [q]退出程序
echo.
echo ===========
set /p choose=请选择:
if %choose% == a goto avtobv
if %choose% == b goto bvtoav
if %choose% == q goto Download
goto home
:bvtoav
title MonianHello
color fc
echo.
echo ===========
set /p bv=请输入要转换的bv号([q]返回):
if %bv% == q goto home
python changebvtoav.py -bv %bv%
pause
goto bvtoav
:avtobv
title MonianHello
color fc
echo.
echo ===========
set /p av=请输入要转换的av号([q]返回):
if %av% == q goto home
python changeavtobv.py -av %av%
pause
goto avtobv
:Download
cls
Downloader.bat
pause 
exit