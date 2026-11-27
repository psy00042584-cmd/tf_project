# 각종 정보를 출력하는 용도. 통상적으로 인프라 구성후 결과물 값을 출력하는 용도로 활용
# 1. vpc 정보 출력
output "default_vpc_id" {
  description = "서울 리전의 기본 vpc의 id"
  value = data.aws_vpc.default.id
}
# 2. subnet 정보 출력
output "default_subnets_ids" {
  description = "서울 리전의 기본 vpc의 속한 서브넷들의 id 리스트"
  value = data.aws_subnets.default
}
# 3. AMI 아이디 출력
output "aws_ami_amazon_linux_id" {
  description = "아마존 리눅스 ami id"
  value = data.aws_ami.amazon_linux.id
}