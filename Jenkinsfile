@Library('snippets') _

pipeline {

	agent any

	parameters {
		string(name: 'branchName', defaultValue:'master')
	}

	stages {
		stage("Git checkout") {
			git url: git@tree.mn:autoopt-hadoop/AnalyticsAlerts.git, branch: ${params.branchName}
		}
	
		stage('Docker') {
	
			docker.withRegistry("https://harbor-adc.internal.media.net", "data-engineering_adc_bot") {
				def dockerfile = "Dockerfile"
				def customImage = docker.build("data-engineering/analyticsalerts:latest", "-f ${dockerfile} .")
				customImage.push()
			}
		}
	}

}

