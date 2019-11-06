Using [Kubernetes-cli amazing Plugin](https://github.com/jenkinsci/kubernetes-cli-plugin)

Using Pipeline: Jenkinsfile basic example

~~~~
pipeline {
  environment {
    BIT_REPO = 'https://bitbucket.org/'
    BIT_BRANCH = 'master'
    IMAGE = 'nginx'
  }

  agent any

  stages {
    
    stage('Cloning Bitbucket Repo') {
      steps {
        git branch: BIT_BRANCH, url: BIT_REPO
      }
    }

    stage('Deploying to dev') {
      steps {
        kubernetesDeploy(kubeconfigId: 'k8s-credentials', configs: 'sample-deploy.yml', enableConfigSubstitution: true)
      }
    }
  }

}
~~~~

Example deploy using variable:

~~~~
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: sample-k8s-deployment
  namespace: teste
  labels:
    app: sample
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sample
  template:
    metadata:
      labels:
        app: sample
    spec:
      containers:
      - name: sample-k8s-app-container
        image: $IMAGE
        ports:
        - containerPort: 80
~~~~
