#!groovy

pipeline {
  agent {
        label 'baremetal'
  }
  options {
    timestamps()
    ansiColor("xterm")
    buildDiscarder(logRotator(numToKeepStr: "100"))
    timeout(time: 2, unit: "HOURS")
  }
  environment {
    TARGET="dns1 dns2" 
    TG_LOG="trace"
    TF_LOG_PATH="./terraform.log"
  }
    stages {
        stage("Print environment") {
            steps {
                sh 'printenv | sort'
            }
        }

        stage("Terraform lint") {
            when { expression { env.GIT_BRANCH != 'main' } }

            steps {
             withCredentials([file(credentialsId: 'GCS-Service-Account', variable: 'GCS_Service_Account')]) {
                sh '''
                export GOOGLE_APPLICATION_CREDENTIALS=$GCS_Service_Account
                for target in $TARGET
                    do
                        cd ${WORKSPACE}/$target
                        /usr/bin/terraform init
                        /usr/bin/terraform plan
                    done
                  '''
              }
            } // steps
        } // stage

        stage("Terraform apply") {
            when { expression { env.GIT_BRANCH == 'main' } }

            steps {
             withCredentials([file(credentialsId: 'GCS-Service-Account', variable: 'GCS_Service_Account')]) {
                sh '''
                export GOOGLE_APPLICATION_CREDENTIALS=$GCS_Service_Account
                for target in $TARGET
                    do
                        cd ${WORKSPACE}/$target
                        /usr/bin/terraform init
                        /usr/bin/terraform apply -auto-approve
                    done
                  '''
              }
            } // steps
        } // stage
    } // EOL stages
  post {
    always {
        cleanWs()
        }
  } // eol post
}
