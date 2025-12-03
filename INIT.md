# Init 프로젝트를 시작 전 설치해야할 것들 

## Mac 도커 설치
## Window 도커 설치

## 아마존 S3 bucket 을 위해 LocalStack 설치

- docker run -d --name localstack \
  -p 4566:4566 \
  -e SERVICES=s3 \
  -e DEBUG=1 \
  localstack/localstack

- ./localstack-data # Init 프로젝트를 시작 전 설치해야할 것들

## Mac 도커 설치
## Window 도커 설치


## 아마존 S3 bucket 을 위해 LocalStack 설치

- docker run -d --name localstack \
  -p 4566:4566 \
  -e SERVICES=s3 \
  -v ./init-s3.sh:/etc/localstack/init/ready.d/init-s3.sh \
  -v ./src/main/resources/static/src/img/img.png:/data \
  localstack/localstack
  
## awscli-local mac 설치
- homebrew 설치 : /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
-  awscli-lacal 설치 : brew install awscli

## awscli-local Window 설치(리눅스)
- 리눅스 접속 :ubuntu
- pip install awscli

### 서버위치 지정
- aws configure set default.region us-east-1 
- 
### 버킷 생성 (자격증명 없이)
- aws --endpoint-url=http://localhost:4566 s3 mb s3://images --no-sign-request
### 버킷에 이미지폴더 올리기 (자격증명 없이)
- aws --endpoint-url=http://localhost:4566 s3 cp ./src/main/resources/static/src/img s3://images/img/ --recursive --no-sign-request
- aws --endpoint-url=http://localhost:4566 s3 cp [윈도우는 폴더의 절대경로] s3://images/img/ --recursive --no-sign-request
### 버킷에 이미지하나 올리기 (자격증명 없이)
- aws --endpoint-url=http://localhost:4566 s3 cp ./src/main/resources/static/src/img/img.png s3://images/img.png --no-sign-request
- aws --endpoint-url=http://localhost:4566 s3 cp [윈도우는 파일의 절대경로] s3://images/img.png --no-sign-request
### 올라간 이미지 확인 
- http://localhost:4566/images/img/dog.png

