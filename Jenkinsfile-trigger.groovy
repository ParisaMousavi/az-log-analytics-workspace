@Library('interhyp-cicd') _

def jobPath = JOB_NAME.replaceFirst(/\\/+[^\\/]+\\/[^\\/]+$/, '')

properties([disableConcurrentBuilds(), buildDiscarder(logRotator(numToKeepStr: '30', daysToKeepStr: '30'))])

performOnNode('services') {
    stage("trigger create release job") {
        build job: "${jobPath}/create-release", wait: true
    }
}
