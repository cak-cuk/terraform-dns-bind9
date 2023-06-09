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
      REPOS = 'cakcuk/ansible'
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
              withCredentials([
                string(credentialsId: 'rndc_key_secret', variable: 'TF_VAR_key_secret'),
                string(credentialsId: 'rndc_key_algorithm', variable: 'TF_VAR_key_algorithm'),
		            string(credentialsId: 'rndc_key_name', variable: 'TF_VAR_key_name'),
                string(credentialsId: 'rndc_key_server', variable: 'TF_VAR_server'),
              ]) {
                  sh '''
		  cd ${WORKSPACE}/production
                  /usr/bin/terraform init
                  /usr/bin/terraform fmt
                  /usr/bin/terraform plan
                  '''
                } // creds
            } // steps
        } // stage

        stage("Terraform apply") {
            when { expression { env.GIT_BRANCH != 'main' } }

            steps {
              withCredentials([
                string(credentialsId: 'rndc_key_secret', variable: 'TF_VAR_key_secret'),
                string(credentialsId: 'rndc_key_algorithm', variable: 'TF_VAR_key_algorithm'),
		            string(credentialsId: 'rndc_key_name', variable: 'TF_VAR_key_name'),
                string(credentialsId: 'rndc_key_server', variable: 'TF_VAR_server'),
              ]) {
                  sh '''
		  cd ${WORKSPACE}/production
                  /usr/bin/terraform apply -auto-approve
                  '''
                } // creds
            } // steps
        } // stage
    } // EOL stages
}
