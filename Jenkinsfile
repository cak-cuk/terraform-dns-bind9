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
    keyname = credentials('rndc_key_name')
    keysecret = credentials('rndc_key_secret')
    keyalgorithm = credentials('rndc_key_algorithm')
    server = credentials('rndc_key_server')
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
              withCredentials([string(credentialsId: 'rndc_key_secret', variable: 'keysecret'), string(credentialsId: 'rndc_key_algorithm', variable: 'keyalgorithm'), string(credentialsId: 'rndc_key_server', variable: 'keyserver'), string(credentialsId: 'rndc_key_name', variable: 'keyname')]) {
    // some block
                sh '''
                cd ${WORKSPACE}/production
                /usr/bin/terraform init \
                  -var 'keyname${keyname}' \
                  -var 'keysecret=$(keysecret)' \
                  -var 'keyalgorithm=$(keyalgorithm)' \
                  -var 'server=$(server)'
                /usr/bin/terraform fmt -check
                /usr/bin/terraform plan \
                  -var 'keyname${keyname}' \
                  -var 'keysecret=$(keysecret)' \
                  -var 'keyalgorithm=$(keyalgorithm)' \
                  -var 'server=$(server)'
                  '''
              }
            } // steps
        } // stage

        stage("Terraform apply") {
            when { expression { env.GIT_BRANCH == 'main' } }

            steps {
              withCredentials([string(credentialsId: 'rndc_key_secret', variable: 'TF_VAR_keysecret'), string(credentialsId: 'rndc_key_algorithm', variable: 'TF_VAR_keyalgorithm'), string(credentialsId: 'rndc_key_server', variable: 'TF_VAR_keyserver'), string(credentialsId: 'rndc_key_name', variable: 'TF_VAR_keyname')]) {
    // some block
                sh '''
                cd ${WORKSPACE}/production
                /usr/bin/terraform apply -auto-approve \
                  -var 'keyname${keyname}' \
                  -var 'keysecret=$(keysecret)' \
                  -var 'keyalgorithm=$(keyalgorithm)' \
                  -var 'server=$(server)'
                  '''
              }
            } // steps
        } // stage
    } // EOL stages
}
