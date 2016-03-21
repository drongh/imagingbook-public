<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.imagingbook</groupId>
  <artifactId>imagingbook-public</artifactId>
  <!-- https://issues.apache.org/jira/browse/MNG-624 -->
<!--   <version>1.0</version> -->
    <version>1.0</version>
  <packaging>pom</packaging>
  <!-- <name>ImagingBook</name> -->
  
  <description>Java source code for image processing books by W. Burger and M.J. Burge</description>
  <inceptionYear>2006</inceptionYear>
  <url>http://www.imagingbook.com</url>
  <developers>
  	<developer>
  		<name>Wilhelm Burger</name>
  	</developer>
  	<developer>
  		<name>Mark J. Burge</name>
  	</developer>
  </developers>
  <licenses>
  	<license>
  		<name>BSD 2-Clause "Simplified" License</name>
  		<url>http://opensource.org/licenses/BSD-2-Clause</url>
  	</license>
  </licenses>
  
  <scm>
    <developerConnection>scm:git:https://bitbucket.org/imagingbook/imagingbook-public.git</developerConnection>
    <tag>imagingbook-public-1.0</tag>
  </scm>
  
  
  <modules>
  	<module>imagingbook-common</module>
  	<module>imagingbook-plugins-all</module>
  	<module>imagingbook-plugins-de2</module>
  	<module>imagingbook-plugins-de3</module>
  	<module>imagingbook-plugins-en1</module>
  	<module>imagingbook-plugins-en2</module>
  	<module>imagingbook-plugins-en3</module>
  </modules>
    
  <properties>
  	<!-- https://stackoverflow.com/questions/8026783/can-you-inherit-the-version-from-the-parent-pom-in-maven/13946375#13946375 -->
	<!-- <imagingbook.version>1.0-SNAPSHOT</imagingbook.version> -->
	<!-- <imagingbook-common.version>1.0-SNAPSHOT</imagingbook-common.version> -->
  	
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    
    <!-- settings for JavaDoc generation: -->
    <myproject.root>${basedir}/..</myproject.root>   <!-- property is overwritten in submodule POMs! http://stackoverflow.com/a/8848129 -->
    <imagingbook.webroot>imagingbook-website</imagingbook.webroot>
    <!-- <imagingbook.basedir>${project.parent.basedir}</imagingbook.basedir> -->
    <!-- <imagingbook.webdir>web-submodule</imagingbook.webdir> -->
    
    <javadoc-doctitle>${project.name} (${project.version})</javadoc-doctitle> <!-- overwrite in submodules if needed -->
    
    <!-- https://itaffinity.wordpress.com/2014/02/25/maven-create-a-simple-build-number/ -->
    <maven.build.timestamp.format>yyyyMMddHHmmss</maven.build.timestamp.format>
    <buildDate>${maven.build.timestamp}</buildDate>
    
  </properties>
  
  <repositories>
  	<repository>
    	<id>imagej.public</id>
    	<url>http://maven.imagej.net/content/groups/public</url>
 	 </repository>
	</repositories>

  <dependencies>
  	<dependency>
  		<groupId>net.imagej</groupId>
  		<artifactId>ij</artifactId>
  		<version>1.50e</version>
  	</dependency>
  </dependencies>
  
  <build>
	  <pluginManagement>
	     <plugins>
	        <plugin>
	           <groupId>org.apache.maven.plugins</groupId>
	           <artifactId>maven-compiler-plugin</artifactId>
	           <version>3.3</version>
	           <configuration>
	              <source>1.8</source>
	              <target>1.8</target>
	           </configuration>
	        </plugin>
	     </plugins>
	  </pluginManagement>
	  
	  <plugins>	
	  
	  <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-release-plugin</artifactId>
        <version>2.5.3</version>
        <configuration>
    		<goals>deploy</goals>
    		<autoversionsubmodules>true</autoversionsubmodules>
  		</configuration>
      </plugin>
	  	
	    <plugin>
	      <!-- Javadoc generation -->
	        <groupId>org.apache.maven.plugins</groupId>
	        <artifactId>maven-javadoc-plugin</artifactId>
	        <version>2.10.3</version>
	        <configuration>
	        	<!-- Default configuration for all reports -->    	
	        	<!-- <reportOutputDirectory>${imagingbook.basedir}</reportOutputDirectory> -->
	        	<!-- <destDir>${imagingbook.webdir}/javadoc/${project.name}</destDir> --> 
	        	<!-- <reportOutputDirectory>C:/PROJECTS/imagingbook</reportOutputDirectory> -->
	        	<reportOutputDirectory>${myproject.root}</reportOutputDirectory>
	        	<destDir>${imagingbook.webroot}/javadoc/${project.name}</destDir>
	        	
	        	<doctitle>${javadoc-doctitle}</doctitle>
	        	<packagesheader>${project.name}</packagesheader>
	        	<!-- <header>The ImagingBook HEADER</header> -->
	        	<!-- <footer>The ImagingBook FOOTER</footer> -->
	        	<!-- <top>The ImagingBook TOP text</top> -->
	        	<bottom>
	        		<![CDATA[Copyright &#169; {inceptionYear}&#x2013;{currentYear}, 
	        		<a href="http://www.imagingbook.com" target="new">
	        		Wilhelm Burger, Mark J. Burge</a>
	        		<a href="http://opensource.org/licenses/BSD-2-Clause" target="new">
	        		(BSD 2-Clause Simplified License)</a>]]>
	        	</bottom>
				<show>protected</show>
				<nohelp>true</nohelp>
				<linksource>true</linksource>
				<author>false</author>
				<verbose>true</verbose>
				<!-- <detectLinks>true</detectLinks> -->
				<!-- <detectOfflineLinks>true</detectOfflineLinks> -->
	        </configuration>
	      </plugin>
      
      
      <plugin>  <!-- add more properties to MANIFEST file -->
	    <groupId>org.apache.maven.plugins</groupId>
	    <artifactId>maven-jar-plugin</artifactId>
	    <version>2.1</version>
	    <configuration>
	      <archive>
	        <manifest>
	          <addDefaultImplementationEntries>true</addDefaultImplementationEntries>
	        </manifest>
	        <manifestEntries>
                <Build-Date>${buildDate}</Build-Date>
            </manifestEntries>
	      </archive>
	    </configuration>
	  </plugin>
	  
 	 </plugins>
  </build>
  
  <reporting>
	<plugins>
		<plugin>  <!-- to stop Maven complaining about missing version number -->
 			<groupId>org.apache.maven.plugins</groupId>
			<artifactId>maven-project-info-reports-plugin</artifactId>
			<version>2.8.1</version>
			<reportSets>
				 <reportSet />
			</reportSets>
		</plugin>
     </plugins>
  </reporting>
  
</project>