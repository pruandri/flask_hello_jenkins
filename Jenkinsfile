pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Tantely61123/mini_projet.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install --user --no-cache-dir -r flask_app/requirements.txt'
            }
        }

        stage('Tests') {
            steps {
                 bat '"C:\\Users\\RAFATA\\AppData\\Local\\Programs\\Python\\Python310\\python.exe" flask_app\\test.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t localhost:4000/flask_hello:latest flask_app/'
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push localhost:4000/flask_hello:latest'
            }
        }

stage('Deploy to Kubernetes') {
    steps {
        bat '''kubectl create deployment flask-app --image=localhost:4000/flask_hello:latest
              kubectl expose deployment flask-app --type=LoadBalancer --port=5000'''
    }
}
    }
}
