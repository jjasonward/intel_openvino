#!/bin/bash

ISAMPLES=$HOME/inference_engine_samples/intel64/Release
MODELS=/opt/intel/computer_vision_sdk/deployment_tools/intel_models
MFACE=face-detection-retail-0004/FP32/face-detection-retail-0004.xml
MAG=age-gender-recognition-retail-0013/FP32/age-gender-recognition-retail-0013.xml
MHP=head-pose-estimation-adas-0001/FP32/head-pose-estimation-adas-0001.xml
MEM=emotions-recognition-retail-0003/FP32/emotions-recognition-retail-0003.xml

RUNFACE1="./interactive_face_detection_sample -m $MODELS/$MFACE"
RUNFACE2="./interactive_face_detection_sample -m $MODELS/$MFACE -m_ag $MODELS/$MAG"
RUNFACE3="./interactive_face_detection_sample -m $MODELS/$MFACE -m_ag $MODELS/$MAG -m_hp $MODELS/$MHP"
RUNFACE4="./interactive_face_detection_sample -m $MODELS/$MFACE -m_ag $MODELS/$MAG -m_hp $MODELS/$MHP -m_em $MODELS/$MEM"
