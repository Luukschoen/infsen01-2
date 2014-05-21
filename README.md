Compile java classes:
	javac -cp `hadoop classpath` *.java

Run with Hadoop:
	hadoop jar {jar-name.jar} {main-class-name} [{args..}]