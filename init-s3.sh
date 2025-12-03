#!/bin/bash
echo "localstack 서버 선택..."
aws configure set default.region us-east-1
echo "버킷 생성..."
aws --endpoint-url=http://localhost:4566 s3 mb s3://images --no-sign-request
echo "버킷이미지 업로드..."
aws --endpoint-url=http://localhost:4566 s3 cp /data/img s3://images/img --recursive --no-sign-request
