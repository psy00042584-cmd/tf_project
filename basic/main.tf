#############################
# ec2 구성에 대한 모든 설정 선언
# data ~     :조회
# resource ~ :리소스 생성
#############################

# 1. VPC 구성(새로 생성 or [v]기존 사용)
#    vpc 이름과 상관없는 vpc 생성시 지정된 default에 영향을 받은 것임. 리전별로 1개만 존재함
data "aws_vpc" "default" {
  # 현재 존재하는 vpc 목록중에 default vpc 정보를 조회하라
  default = true
}

# 2. subnet 설정 or 구성 후 설정
#    현재 default vpc는 4개의 서브넷을 가지고있음 => 멀티 AZ 지원 관점에서 4가지 사용할 수 있음
#    멀티 AZ를 사용한다는 것은 예) 같은 서비스를 A동과 B동에 동일하게 구성해서 a동에 장애가 나면 B동이 대응하도록 구성
data "aws_subnets" "default" {
  filter {
    name = "vpc-id"
    # n개의 서브넷 정보가 조회되어서 []에 담긴다. 서브넷을 고유한 vpc의 id로 조회한 것임
    values = [data.aws_vpc.default.id]
  }
}

# 3. 보안그룹
resource "aws_security_group" "ai-cp2-09-sg" {
  # 기본 세부정보 ###########
  # 이름
  name = "ai-cp2-09-sg"
  # 설명-ASCCI 만 지원
  description = "ai-cp2-09 security group"
  # 보안 그룹이 속한 vpc 지정
  vpc_id = data.aws_vpc.default.id
  
  # 이나운드 규칙###########
  # 외부의 트레픽이 내부로 진입됨 -> 통과할 포트만 등록 -> 존재하는 만큼 추가함(규칙 추가)
  # 22, 80
  ingress {
    #프로토콜
    protocol = "tcp"
    # 포트
    from_port = 22  # 허용할 포트 범위의 시작번호
    to_port = 22    # 허용할 포트 범위의 끝 번호
    # CIDR 블록
    # classless Inter-Domain `Routing`: IP 주소, 네트워크 범위 표현
    # IP 주소의 범위 (네트워크 대역) 정의
    # IPv4 기준 0~255.0~255.0~255.0~255 => 각자리수별로 256개 설정 => 전체는 32비트 사용
    # 모든 IP의 가지수는 256*256*256*256개 가능함
    # ().().().()/<앞에서부터 고정되는 비트수>
    # 10.0.0.0/8 => 앞에서부터 8 비트는 고정 => 10.(0~255).(0~255).(0~255)
    # 10.20.0.0/16 => 앞에서부터 8 비트는 고정 => 20.10.(0~255).(0~255)
    # 0.0.0.0/0 => 모든 eodurvhr => 전세계 어디서든
    # n.n.n.n/n => 모든 eodurvhr => 오직 한개의 IP 내 거
    cidr_blocks =[ "222.108.125.33/32" ]
  }
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80

  }
  # 아웃바운드 규칙#############
  egress {

  }
}
# 4. EC2 생성을 위한 OS 이미지 정보 조회

# 5. EC2 생성 선언

# 6. 탄력적 IP 적용(1차 버전에서는 제외)