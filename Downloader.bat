:: -----------------------------------------
:: Ϊ������ע�ͺʹ����ƵĲ��� ע��������: �����ƵĲ�����rem
:: ������Ҫ��������⣺
:: - 1.�Զ��ж�python��youtube-dl���Ƿ�װ��û��װ�Ļ���װһ�»���
:: - 2.������վ����Ƶ����(��������������Խ��Խ�ã����ܿ��Ƿֳɲ�ͬ���ļ�)
:: - 3.�������ض����Ƶ(bash����ʲô�б�����Ƭ�������ҿ�����python��ɣ����ļ���ȡҲ���ǲ��У��鷳)
:: - 4.������
:: Ŀǰ�̶�����Ŀ¼Ϊ���棬û����ĵ���˼
:: ����������Ŀ�����<:Bilibilichoice>ǰ���һ��<cd Ŀ��Ŀ¼>
:: ��֮һ��ʼ����Ϊ�˷����Լ�������...����flv����Ҫ�ڸ�ʽ����ת����mp4��������au ae��Щ���������˵�������ټ�һ��FFmpeg����ת��
:: 2020��1��25�� 18:12:12     
:: Happy new year!
:: -----------------------------------------
:Set
set bilibili=http://www.bilibili.com/video
goto Main
:Main
@echo off
color 9f
echo [MonianHello]��ӭʹ����Ƶ����
echo [MonianHello]�ð汾��ҪPython��Ϊǰ��
echo [MonianHello]İ��Hello ��������Ȩ��
rem echo [MonianHello]----------
rem echo [MonianHello]��ѡ������Ŀ¼:
rem set /p listchoose=[MonianHello]����[1]Ϊ���� ����Ϊ�˳����ļ�����
set desktopdrive=%CD%
rem if "listchoose" == "1" set desktopdrive=%homedrive%%homepath%\Desktop
rem echo [MonianHello]���ڸ�������Ŀ¼...
cd %desktopdrive%
echo [MonianHello]�Ѹ�������Ŀ¼��%desktopdrive%
rem goto Homepage
rem :Homepage
rem cls
rem echo [MonianHello]----------
rem echo [MonianHello][b]Bilibili
rem echo [MonianHello][e]������վ
rem echo [MonianHello]----------
rem echo [MonianHello][q]�˳�����
rem set /p choose=[MonianHello]������:
rem if "choose" == "b" goto bilibilichoice
rem if "choose" == "e" goto elseweb
rem if "choose" == "q" exit
rem goto Bilibilichoice
:Bilibilichoice
@echo off
cls
set /p bilibilinomber=[MonianHello]������av��(����):
echo [MonianHello]����ʱ��ϳ�,�����ĵȴ�...
youtube-dl -F %bilibili%/av%bilibilinomber%
echo ��
echo [MonianHello]�������ͷ��ָ����(���к���best��ʾΪ�����ƵԴ)
set /p fnumber=
youtube-dl -f%fnumber% %bilibili%/av%bilibilinomber%
echo [MonianHello]�ѳɹ����ص�%desktopdrive%
pause
goto Homepage
rem :first
rem start https://jingyan.baidu.com/article/3c48dd34cec9c2e10be358e4.html
rem echo �����밲װPython,��װ�����ڵ����������������.
rem echo ��Ҫ��Ϊ��һ�ε��鷳��ѡ�����.Python��һ��ǿ��Ľű�����,İ�������Ƶ�ĺ��ľ���Python�е�һ�����Youtube-dl.����Ҳ����PythonΪ������д���.
rem echo ��װ��ɺ����������...
rem pause>nul
rem pip install youtube-dl