#!/bin/bash


JENKINSFILE=`cat /Jenkinsfile`

cat <<EOT >> /Jenkinsfile.groovy
#!/usr/bin/env groovy

import static Constants.*

class Constants {
    static final scm = "scm"
}

def node(Closure c){
    c.call()
}

# def sh(cmd) {
#     ProcessBuilder builder = new ProcessBuilder( cmd.split(' ') )
#     builder.redirectErrorStream(true)
#     Process process = builder.start()
    
#     InputStream stdout = process.getInputStream ()
#     BufferedReader reader = new BufferedReader (new InputStreamReader(stdout))
    
#     while ((line = reader.readLine ()) != null) {
#         System.out.println (line)
#     }
# }

def sh(cmd) {

}

def checkout (scm) {

}

def scm () {
    return "scm";
}

def stage (stageName){
    println "RUNNING STAGE ${stageName}"
}

$JENKINSFILE
EOT

chmod +x /Jenkinsfile.groovy

cat /Jenkinsfile.groovy

#./$1.groovy

#rm -f $1.groovy