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
              withCredentials([string(credentialsId: 'rndc_key_secret', variable: 'TF_VAR_keysecret'), string(credentialsId: 'rndc_key_algorithm', variable: 'TF_VAR_keyalgorithm'), string(credentialsId: 'rndc_key_server', variable: 'TF_VAR_keyserver'), string(credentialsId: 'rndc_key_name', variable: 'TF_VAR_keyname')]) {
    // some block
                sh '''
                export env.TF_VAR_keysecret= env.RNDC_KEY_SECRET
                export env.TF_VAR_keyalgorithm = env.RNDC_KEY_ALGORITHM
                export env.TF_VAR_keyname = env.RNDC_KEY_NAME
                export env.TF_VARserver = env.RNDC_KEY_SERVER
                cd ${WORKSPACE}/production
                /usr/bin/terraform init
                /usr/bin/terraform fmt
                /usr/bin/terraform plan
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
                export env.TF_VAR_keysecret= env.RNDC_KEY_SECRET
                export env.TF_VAR_keyalgorithm = env.RNDC_KEY_ALGORITHM
                export env.TF_VAR_keyname = env.RNDC_KEY_NAME
                export env.TF_VARserver = env.RNDC_KEY_SERVER
                cd ${WORKSPACE}/production
                /usr/bin/terraform apply -auto-approve
                  '''
              }
            } // steps
        } // stage
    } // EOL stages
}
