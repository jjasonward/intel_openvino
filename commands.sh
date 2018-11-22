#!/bin/bash

ISAMPLES=$HOME/inference_engine_samples/intel64/Release

MODELS=/opt/intel/computer_vision_sdk/deployment_tools/intel_models

PREC="FP32"

MFACE="face-detection-retail-0004"
MFACE="$MFACE/$PREC/$MFACE.xml"

MAG="age-gender-recognition-retail-0013"
MAG="$MAG/$PREC/$MAG.xml"

MHP="head-pose-estimation-adas-0001"
MHP="$MHP/$PREC/$MHP.xml"

MEM="emotions-recognition-retail-0003"
MEM="$MEM/$PREC/$MEM.xml"

MLM="facial-landmarks-35-adas-0001"
MLM="$MLM/$PREC/$MLM.xml"

# For OpenVINO version 2018.3:
#FD="./interactive_face_detection_sample"
# For OpenVINO version 2018.4:
FD="./interactive_face_detection_demo"

RUNFACE1="$FD -m $MODELS/$MFACE"
RUNFACE2="$FD -m $MODELS/$MFACE -m_ag $MODELS/$MAG"
RUNFACE3="$FD -m $MODELS/$MFACE -m_ag $MODELS/$MAG -m_hp $MODELS/$MHP"
RUNFACE4="$FD -m $MODELS/$MFACE -m_ag $MODELS/$MAG -m_hp $MODELS/$MHP -m_em $MODELS/$MEM"

# For OpenVINO version 2018.4:
RUNFACE5="$FD -m $MODELS/$MFACE -m_ag $MODELS/$MAG -m_hp $MODELS/$MHP -m_em $MODELS/$MEM -m_lm $MODELS/$MLM"
