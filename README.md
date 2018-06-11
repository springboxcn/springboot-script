# springboot-script

## 授权

chmod 777 run_xxx.sh

chmod 777 stop_xxx.sh

## 执行

./stop_xxx.sh

./run_xxx.sh

---
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


---
echo "Killing: \`cat xxx.pid\`" 

kill -9 \`cat xxx.pid\` 

rm -rf xxx.pid


## 打包ZIP

### pom.xml

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-jar-plugin</artifactId>
            <configuration>
                <archive>
                    <manifest>
                        <mainClass>edu.maskleo.demo1.Demo1Application</mainClass>
                        <addClasspath>true</addClasspath>
                        <classpathPrefix>lib/</classpathPrefix>
                    </manifest>
                    <manifestEntries>
                        <Class-Path>./</Class-Path>
                    </manifestEntries>
                </archive>
                <excludes>
                    <exclude>config/**</exclude>
                    <exclude>application-*.yml</exclude>
                    <exclude>bootstrap.yml</exclude>
                    <exclude>logback-spring.xml</exclude>
                    <exclude>*.json</exclude>
                </excludes>
            </configuration>
        </plugin>

        <plugin>
            <artifactId>maven-assembly-plugin</artifactId>
            <configuration>
                <appendAssemblyId>false</appendAssemblyId>
                <descriptors>
                    <descriptor>package.xml</descriptor>
                </descriptors>
            </configuration>
            <executions>
                <execution>
                    <id>make-assembly</id>
                    <phase>package</phase>
                    <goals>
                        <goal>single</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```

### package.xml

```xml
<id>package</id>  
<formats>  
    <format>zip</format>
</formats>
<includeBaseDirectory>true</includeBaseDirectory>
<fileSets>
    <fileSet>
        <directory>src/main/bin</directory>
        <outputDirectory>/</outputDirectory>
    </fileSet>  
    <fileSet>
        <directory>src/main/resources</directory>
        <outputDirectory>/</outputDirectory>  
    </fileSet>
    <fileSet>
        <directory>${project.build.directory}</directory>
        <outputDirectory>/</outputDirectory>
        <includes>
            <include>*.jar</include>  
        </includes>
    </fileSet>
</fileSets>
<dependencySets>
    <dependencySet>
        <outputDirectory>lib</outputDirectory>
        <scope>runtime</scope>
        <excludes>
            <exclude>${groupId}:${artifactId}</exclude>
        </excludes>
    </dependencySet>
</dependencySets>
<baseDirectory>demo1</baseDirectory>
```

## LICENSE

### [CC-BY-SA-3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/cn/)

[![](LICENSE.png)](https://creativecommons.org/licenses/by-nc-sa/3.0/cn/)
