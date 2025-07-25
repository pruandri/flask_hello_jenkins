pipeline {
  agent {
    kubernetes {
      label 'jenkins-agent-my-app'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    component: ci
spec:
  containers:
  - name: python
    image: python:3.7
    command:
    - cat
    tty: true
    volumeMounts:
    - name: ssh-key
      mountPath: /home/jenkins/.ssh
      readOnly: true
  volumes:
  - name: ssh-key
    secret:
      secretName: jenkins-ssh-key
"""
    }
  }
  stages {
    stage('Test python') {
      steps {
        container('python') {
          sh "pip install -r requirements.txt"
          sh "python test.py"
        }
      }
    }
  }
}
