@echo off
cls
:home
title MonianHello
color 3f
::2020��3��24�� 23:58:13
echo ===========
echo.
echo [a]av��תΪbv��
echo [b]bv��תΪav��
echo [q]�˳�����
echo.
echo ===========
set /p choose=��ѡ��:
if %choose% == a goto avtobv
if %choose% == b goto bvtoav
if %choose% == q goto Download
goto home
:bvtoav
title MonianHello
color fc
echo.
echo ===========
set /p bv=������Ҫת����bv��([q]����):
if %bv% == q goto home
python changebvtoav.py -bv %bv%
pause
goto bvtoav
:avtobv
title MonianHello
color fc
echo.
echo ===========
set /p av=������Ҫת����av��([q]����):
if %av% == q goto home
python changeavtobv.py -av %av%
pause
goto avtobv
:Download
cls
Downloader.bat
pause 
exit