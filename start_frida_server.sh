#!/bin/bash

echo "I keep looking for you in the world where~"
fileName=frida-server-14.2.18-android-arm64
fridaServerPath=/data/local/tmp/
curPath=$(pwd)/$fileName

adb shell su -c "rm -rf $fridaServerPath$fileName"
adb shell su -c "rm -rf $fridaServerPath/re.frida.server"
adb push $curPath $fridaServerPath

echo "-------start-------->"
    for id in $(adb shell su -c "ps -ef | grep frida | awk '{print $2}'" | awk '{print $2}')
    do
      adb shell su -c "kill -9 $id"
      echo "You defeated the Frida-Boss Hitburst helmet with$id  less damage"
    done
echo "--------end-------"
adb forward tcp:27042 tcp:27042
adb shell su -c "chmod 777 $fridaServerPath$fileName"
echo "-----If we were brothers take your dragon slayer and hit me with Ctrl+C-------"
adb shell su -c "nohup $fridaServerPath$fileName &"
