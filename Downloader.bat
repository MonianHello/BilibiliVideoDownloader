
@echo off
:: -----------------------------------------
:: 为了区别注释和待改善的部分 注释用两个: 待改善的部分用rem
:: 现在需要解决的问题：
:: - 1.自动判断python和youtube-dl库是否安装，没安装的话安装一下环境
:: - 2.其他网站的视频下载(但是我想做的是越简单越好，可能考虑分成不同的文件)
:: - 3.连续下载多个视频(bash哪有什么列表和切片操作？我考虑用python完成，从文件读取也不是不行，麻烦)
:: - 4.继续简化
:: 目前固定下载目录为桌面，没有想改的意思
:: 有特殊情况的可以在<:Bilibilichoice>前面加一行<cd 目标目录>
:: 总之一开始就是为了方便自己随便糊的...况且flv还是要在格式工厂转换成mp4才能用在au ae这些东西里。所以说不定会再加一个FFmpeg用于转换
:: 2020年1月25日 18:12:12     
:: Happy new year!
:: -----------------------------------------
:: 对于av号转bv号的更新
:: 事发较为突然，先保留av/bv双下载模式
:: 2020年3月23日 19:28:52
:Set
:Homepage
set bilibili=http://www.bilibili.com/video
goto Main
:Main
@echo off
color 9f
echo [MonianHello]欢迎使用视频解析
echo [MonianHello]该版本需要Python作为前置
echo [MonianHello]陌念Hello 保留所有权利
rem echo [MonianHello]----------
rem echo [MonianHello]请选择下载目录:
rem set /p listchoose=[MonianHello]输入[1]为桌面 否则为此程序文件夹内
set desktopdrive=%CD%
rem if "listchoose" == "1" set desktopdrive=%homedrive%%homepath%\Desktop
rem echo [MonianHello]正在更换工作目录...
cd %desktopdrive%
echo [MonianHello]已更换工作目录到%desktopdrive%
rem goto Homepage
rem :Homepage
rem cls
rem echo [MonianHello]----------
rem echo [MonianHello][b]Bilibili
rem echo [MonianHello][e]其他网站
rem echo [MonianHello]----------
rem echo [MonianHello][q]退出程序
rem set /p choose=[MonianHello]请输入:
rem if "choose" == "b" goto bilibilichoice
rem if "choose" == "e" goto elseweb
rem if "choose" == "q" exit
rem goto Bilibilichoice

:Bilibilichoice
echo [MonianHello]----------
echo [MonianHello][a]av号
echo [MonianHello][b]bv号
echo [MonianHello]----------
set /p choose=[MonianHello]请输入:
if %choose% == a goto av
if %choose% == b goto bv
goto bv
:av
set /p bilibilinomber=[MonianHello]请输入av号(数字):
echo [MonianHello]加载时间较长,请耐心等待...
youtube-dl -F %bilibili%/av%bilibilinomber%
echo ↑
echo [MonianHello]请输入箭头所指数字(该行后有best表示为最佳视频源)
set /p fnumber=
youtube-dl -f%fnumber% %bilibili%/av%bilibilinomber%
echo [MonianHello]已成功下载到%desktopdrive%
pause
cls
goto Bilibilichoice
rem 2020年3月23日 21:52:15
rem 以下为临时，以后如果有谁破解出了BV->AV的算法请一定记得告诉下我
:bv
set /p bilibilinomber=[MonianHello]请输入bv号(数字与字母，注意大小写，不用输入"BV"):
echo [MonianHello]加载时间较长,请耐心等待...
youtube-dl -F %bilibili%/bv%bilibilinomber%
echo ↑
echo [MonianHello]请输入箭头所指数字(该行后有best表示为最佳视频源)
set /p fnumber=
youtube-dl -f%fnumber% %bilibili%/bv%bilibilinomber%
echo [MonianHello]已成功下载到%desktopdrive%
pause
cls
goto Bilibilichoice
rem :first
rem start https://jingyan.baidu.com/article/3c48dd34cec9c2e10be358e4.html
rem echo 首先请安装Python,安装方法在弹出的浏览器窗口中.
rem echo 不要因为第一次的麻烦而选择放弃.Python是一种强大的脚本语言,陌念解析视频的核心就是Python中的一个插件Youtube-dl.后续也会以Python为主题进行创作.
rem echo 安装完成后按任意键继续...
rem pause>nul
rem pip install youtube-dl