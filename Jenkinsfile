SECRETS = [
  [path: 'secret/eGA/tools/sonarqube', secretValues: [[vaultKey: 'github_token', envVar: 'GITHUB_OAUTH_TOKEN']]],
  [path: 'secret/eGA/tools/ios/apple-developer', secretValues: [[vaultKey: 'github_url', envVar: 'GITHUB_URL']]],
]

pipeline {
  agent {
    label "ios-parallel"
  }
  options {
    skipDefaultCheckout()
    ansiColor("xterm")
  }
  environment {
    SWIFTSERVERPORT = "${Math.abs(new Random().nextInt(20000) + 20000)}"
    LC_ALL = 'en_US.UTF-8'
    LANG = 'en_US.UTF-8'
  }
  stages {
    stage("Checkout 📥") {
      steps {
        cleanWs()
        commonCheckout()
      }
    }

    stage("Create Simulator 🦠") {
      steps {
        createSimulatoriOS([type: "iPhone 11", os: "iOS14.1"])
      }
    }

    stage("Bundler 💎") {
      steps {
        lock("ruby-gems-${env.NODE_NAME}") {
          sh """#!/bin/bash -l
            bundle config set --local path "~/ruby"`ruby --version | sed 's/ruby \\([0-9\\.]*\\).*/\\1/'`"gems"
            bundle install
          """
        }
      }
    }

    stage("CovPassCommon 🛠") {
      when {
        not {
          anyOf {
            branch 'master'
            branch 'release/*'
          }
        }
      }
      steps {
        script {
          withVault(SECRETS) {
            sh """#!/bin/bash -l
              bundle exec fastlane buildAndTestLane --swift_server_port ${SWIFTSERVERPORT} device:${IOSSIMULATORSNAME} root_path:Source/CovPassCommon path:Sources,Tests scheme:CovPassCommon coverage:0.0
            """
          }
        }
      }
    }

    stage("CovPassUI 🏞") {
      when {
        not {
          anyOf {
            branch 'master'
            branch 'release/*'
          }
        }
      }
      steps {
        script {
          withVault(SECRETS) {
            sh """#!/bin/bash -l
              bundle exec fastlane buildAndTestLane --swift_server_port ${SWIFTSERVERPORT} device:${IOSSIMULATORSNAME} root_path:Source/CovPassUI path:Sources,Tests scheme:CovPassUI coverage:0.0
            """
          }
        }
      }
    }

    stage("CovPassCheckApp ✅") {
      when {
        not {
          anyOf {
            branch 'master'
            branch 'release/*'
          }
        }
      }
      steps {
        script {
          withVault(SECRETS) {
            sh """#!/bin/bash -l
              bundle exec fastlane buildAndTestLane --swift_server_port ${SWIFTSERVERPORT} device:${IOSSIMULATORSNAME} root_path:Source/CovPassCheckApp path:Source,Tests scheme:CovPassCheckApp coverage:0.0
            """
          }
        }
      }
    }

    stage("CovPassApp 🎫") {
      when {
        not {
          anyOf {
            branch 'master'
            branch 'release/*'
          }
        }
      }
      steps {
        script {
          withVault(SECRETS) {
            sh """#!/bin/bash -l
              bundle exec fastlane buildAndTestLane --swift_server_port ${SWIFTSERVERPORT} device:${IOSSIMULATORSNAME} root_path:Source/CovPassApp path:Source,Tests scheme:CovPassApp coverage:0.0
            """
          }
        }
      }
    }
  }

  post {
    cleanup {
      deleteSimulatoriOS()
      cleanWs(cleanWhenFailure: false)
    }
  }
}
