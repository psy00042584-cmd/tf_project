# 버전 -> 향후 계속 카피 사용
terraform {
  required_version = ">=1.10"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}
# 공급자
# 리전 정보만 기재, 변수를 통해서 세팅도 가능
provider "aws" {
  # region = "ap-northeast-2"
  # 리전 값을 변수로 지정
  region = var.region
}