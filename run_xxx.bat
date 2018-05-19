@echo on
CHCP 65001
title oauth2_server
echo "oauth2_server on...."
java -Dfile.encoding=utf-8 -jar oauth2_server-1.0-SNAPSHOT.jar
pause
:end
