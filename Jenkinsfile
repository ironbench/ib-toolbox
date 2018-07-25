node("jenkins-worker") {
  try {
    step([$class: 'WsCleanup'])
    wrap([$class: 'AnsiColorBuildWrapper']) {
      timestamps {
        stage("Checkout") {
          checkout scm
        }

        stage("Lint") {
          sh "foodcritic -f correctness ."
          sh "rubocop -r cookstyle ."
        }

        stage("Spec") {
          sh "chef exec rspec"
        }
      }
    }
  } catch (e) {
    currentBuild.result = "FAILED"
    throw e
  }
}
