pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YOUR-USERNAME/YOUR-REPO.git'
            }
        }
        
        stage('Setup Robot Framework') {
            steps {
                sh '''
                    echo "Installing Robot Framework if not present..."
                    python3 --version || (echo "Python3 not found, installing..." && apt-get update && apt-get install -y python3 python3-pip)
                    pip3 show robotframework || pip3 install --user robotframework robotframework-seleniumlibrary
                    
                    echo "Checking Robot Framework installation..."
                    which robot || echo "robot command not found in PATH"
                    python3 -m robot --version || echo "robot module not found"
                    
                    # Try to find robot executable
                    find /var/jenkins_home -name "robot" -type f 2>/dev/null || echo "No robot executable found"
                '''
            }
        }
        
        stage('Run Robot Tests') {
            steps {
                sh '''
                    mkdir -p test-results
                    
                    # Try different ways to run robot
                    if [ -f "/var/jenkins_home/.local/bin/robot" ]; then
                        echo "Using robot from .local/bin"
                        /var/jenkins_home/.local/bin/robot --outputdir test-results tests/
                    elif command -v robot >/dev/null 2>&1; then
                        echo "Using robot from PATH"
                        robot --outputdir test-results tests/
                    elif python3 -m robot --version >/dev/null 2>&1; then
                        echo "Using robot via python module"
                        python3 -m robot --outputdir test-results tests/
                    else
                        echo "Installing Robot Framework and trying again..."
                        pip3 install --user robotframework
                        python3 -m robot --outputdir test-results tests/
                    fi
                '''
            }
            post {
                always {
                    archiveArtifacts artifacts: 'test-results/**/*', allowEmptyArchive: true
                    publishHTML([
                        allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'test-results',
                        reportFiles: 'report.html',
                        reportName: 'Robot Framework Report'
                    ])
                }
            }
        }
    }
}