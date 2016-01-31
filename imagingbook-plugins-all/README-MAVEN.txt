To copy ImageJ.exe, config ... look here:

http://stackoverflow.com/questions/586202/best-practices-for-copying-files-with-maven:
Alexander Drobyshevsky:


In order to copy a file use:

        <plugin>
            <artifactId>maven-resources-plugin</artifactId>
            <version>2.7</version>
            <executions>
                <execution>
                    <id>copy-resource-one</id>
                    <phase>install</phase>
                    <goals>
                        <goal>copy-resources</goal>
                    </goals>

                    <configuration>
                        <outputDirectory>${basedir}/destination-folder</outputDirectory>
                        <resources>
                            <resource>
                                <directory>/source-folder</directory>
                                <includes>
                                    <include>file.jar</include>
                                </includes>
                            </resource>
                        </resources>
                    </configuration>
                </execution>
           </executions>
        </plugin>

In order to copy folder with sub-folders use next configuration:
           <configuration>
              <outputDirectory>${basedir}/target-folder</outputDirectory>
              <resources>          
                <resource>
                  <directory>/source-folder</directory>
                  <filtering>true</filtering>
                </resource>
              </resources>              
            </configuration>  
