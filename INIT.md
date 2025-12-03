# Init 프로젝트를 시작 전 설치해야할 것들 

## Mac 도커 설치
## Window 도커 설치

## 아마존 S3 bucket 을 위해 LocalStack 설치

### awscli-local mac 설치
- homebrew 설치 : /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
-  awscli-lacal 설치 : brew install awscli

### awscli-local Window 설치(리눅스)
- 리눅스 접속 :ubuntu
- pip install awscli


## seaweedfs

### 도커 실행
docker run -d --name seaweedfs \
-p 8333:8333 \
-p 8334:8334 \
-v $(pwd)/weed-data:/data \
chrislusf/seaweedfs server -s3 -dir=/data

### 버킷 설정
aws configure --profile weed

    AWS Access Key ID [None]: test
    AWS Secret Access Key [None]: test
    Default region name [None]: us-east-1
    Default output format [None]: json
### 버킷 생성
aws --endpoint-url=http://localhost:8333 s3 mb s3://images --profile weed
### 이미지 업로드
aws --endpoint-url=http://localhost:8333 \
s3 cp ./src/main/resources/static/src/img \
s3://images/img --recursive --profile weed

### 이미지 확인
http://localhost:8333/images/img/dog.png

####################################################

### LocalStack 도커 설치
docker run -d --name localstack \
-p 4566:4566 \
-e SERVICES=s3 \
-e PERSISTENCE=1 \
-e S3_PROVIDER=filesystem \
-e DEFAULT_REGION=us-east-1 \
-v ./localstack-data:/var/lib/localstack \
-v ./src/main/resources/static/src/img:/data/img \
-v ./init-s3.sh:/etc/localstack/init/ready.d/init-s3.sh \
localstack/localstack:2.1

### localstack s3 컨테이너 로그 확인
- docker logs localstack
-
### 올라간 이미지 확인
- http://localhost:4566/images/img/dog.png
