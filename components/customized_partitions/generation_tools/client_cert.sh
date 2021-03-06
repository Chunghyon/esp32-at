#!/bin/bash

PARTITION_NAME=$1
TARGET_FOLDER=$2
TOOL_PATH=$PROJECT_PATH/tools/AtPKI.py

RAW_DATA_FOLDER=$PROJECT_PATH/components/customized_partitions/raw_data/client_cert

RAW_DATA_FILE=$(ls $RAW_DATA_FOLDER/*.pem $RAW_DATA_FOLDER/*.der $RAW_DATA_FOLDER/*.cer $RAW_DATA_FOLDER/*.crt 2>/dev/null | awk '{print $1}')

echo "generating client_cert.bin: python $TOOL_PATH generate_bin -b $TARGET_FOLDER/$PARTITION_NAME cert $RAW_DATA_FILE"

python $TOOL_PATH generate_bin -b $TARGET_FOLDER/$PARTITION_NAME.bin cert $RAW_DATA_FILE
