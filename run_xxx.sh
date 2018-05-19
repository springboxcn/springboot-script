JAVA_OPTS="-Xms128m -Xmx256m"

echo "xxx on...."

if find -name xxx.pid | grep "xxx.pid";
then
  echo "xxx is running..."
  exit
fi

nohup java $JAVA_OPTS -jar xxx-1.0-SNAPSHOT.jar >  output 2>&1 &

if [ ! -z "xxx.pid" ]; then
  echo $!> xxx.pid
fi
