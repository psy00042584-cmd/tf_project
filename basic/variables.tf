# tf 구성시 사용할 변수를 정의
# 1. 인프라가 구성될 기본 리전 값을 변수로 정의
variable "region"{
    # 서울 리전
    default = "ap-northeast-2"
}

# 1. 인프라가 구성될 기본 리전 값을 변수로 정의
variable "instance_type"{
    default = "t3.micro"
}

# 3. pem파일등 키 이름
variable "key_name" {
    default = "ai-cp2-09-key"
}