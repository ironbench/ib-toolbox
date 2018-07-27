/* ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
  ---------------------------------------------------------------------------------- */

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

        stage("Spec Tests") {
          sh "chef exec rspec"
        }

        stage("Kitchen Test") {
          sh "kitchen test integration-ib-toolbox"
        }

        stage("Build Container") {
          sh "packer build packer_docker.json"
        }
      }
    }
  } catch (e) {
    currentBuild.result = "FAILED"
    throw e
  }
}
