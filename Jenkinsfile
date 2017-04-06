node {
    
    checkout scm

    stage "Build runtime image"
        sh "docker build -t savedsearch-middle:runtime ."

    stage "Tag image"
        sh "docker tag savedsearch-middle:runtime 127.0.0.1:30400/savedsearch-middle:latest"

    stage "Push image"
        proxy = sh "docker run --name socat -d -p 30400:5000 chadmoon/socat:latest socat TCP4-LISTEN:5000,fork,reuseaddr TCP4:192.168.99.100:30400"
        sh "sleep 4"
        sh "docker push 127.0.0.1:30400/savedsearch-middle:latest"
        sh "docker kill socat"
        sh "docker rm socat"

    stage "Deploy image"
        sh "kubectl apply -f k8s/deployment.yaml"
}