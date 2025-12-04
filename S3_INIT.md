# AWS S3 핵심 정리

## 1. S3란?
**Amazon Simple Storage Service**  
파일(이미지, 문서, 영상 등)을 저장하는 **객체 스토리지(Object Storage)** 서비스.

- 서버 관리 필요 없음
- 용량 제한 거의 없음
- URL 기반 접근 가능

---

## 2. 주요 구성 요소

### Bucket
- 파일을 저장하는 최상위 단위
- S3 내에서 버킷 이름은 전역(unique)

### Object
- 실제 저장되는 파일
- 객체에는 Key(경로)가 존재  
  예: `profile/user1/dog.png`

### Key
- Object의 전체 경로 문자열
- 폴더처럼 보이지만 실제로는 단순 문자열

---

## 3. 접근 방식

### Public Access
- URL로 누구나 접근 가능
- 정적 이미지 제공 시 사용

### Private Access
- AWS S3 기본값은 private
- URL 접근 불가
- 권한 또는 Presigned URL 필요

---

## 4. Presigned URL
특정 Object에 대해 **일시적으로 접근을 허용하는 URL**.

- 서버가 직접 서명(Signature)을 포함해 생성
- 유효 시간 후 자동 만료
- Private 파일을 노출할 때 필수


## Mac 도커 설치
## Window 도커 설치


### awscli-local mac 설치
- homebrew 설치 : /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
- awscli-lacal 설치 : brew install awscli

### awscli-local Window 설치(리눅스)
- 리눅스 접속 :ubuntu
- pip install awscli


# 이미지 서버를 위한 로컬 s3

##  seaweedfs s3 도커 설치

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


## LocalStack s3 사용 선택 (유료 사용자만 이미지가 도커에 유지됨)

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
