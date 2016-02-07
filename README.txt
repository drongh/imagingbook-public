https://imagingbook@bitbucket.org/imagingbook/imagingbook-public.git

execute mvn clean package install site


Maven Javadoc stuff:

	<!-- https://maven.apache.org/plugins/maven-javadoc-plugin/usage.html -->
 	<!-- mvn javadoc:javadoc -->
   <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-javadoc-plugin</artifactId>
        <version>2.10.3</version>
        <configuration>
<!--         	<outputDirectory>${project.build.directory}/apidocsXXXX</outputDirectory> -->
        	<!-- <reportOutputDirectory>${project.basedir}/www</reportOutputDirectory> -->  <!-- works! -->
        	<!-- <reportOutputDirectory>C:/PROJECTS/imagingbook</reportOutputDirectory> --> <!-- works! -->
        	<!-- <reportOutputDirectory>${project.parent.basedir}</reportOutputDirectory> --> <!-- works! http://stackoverflow.com/a/25290513 -->
        	
        	<reportOutputDirectory>${imagingbook.basedir}</reportOutputDirectory>
        	<destDir>${imagingbook.webdir}/javadoc/${project.name}</destDir>
        	
			<show>protected</show>
			<nohelp>true</nohelp>
			<linksource>true</linksource>
			<author>false</author>
			<verbose>true</verbose>
        </configuration>
      </plugin>
    </plugins>
  </build>


Old version (reporting)

<!--   <reporting>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-javadoc-plugin</artifactId>
        <version>2.10.3</version>
        <configuration>
          <reportOutputDirectory>${project.reporting.outputDirectory}/myoutput</reportOutputDirectory>
          <destDir>apidocsXXX</destDir>
        </configuration>
      </plugin>
    </plugins>
  </reporting> -->
  