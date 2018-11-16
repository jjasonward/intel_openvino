#!/bin/bash

echo '----setupvars----'
cd
source /opt/intel/computer_vision_sdk/bin/setupvars.sh

echo '----install_prerequisites----'
cd /opt/intel/computer_vision_sdk/deployment_tools/model_optimizer/install_prerequisites
pwd
sudo -E ./install_prerequisites.sh

echo '----compilation and demo----'
cd /opt/intel/computer_vision_sdk/deployment_tools/demo/
pwd
./demo_squeezenet_download_convert_run.sh

echo '----examples----'
cd
cd inference_engine_samples/intel64/Release/
pwd
ls -lah --color=auto
