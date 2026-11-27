# 개요
- 기본 구성
- EC2 구성
- 문법

# 구조
## 기본 구성
- *.tf: 테라폼파일
- * : 이름 제한 x => 서비스 혹은 기능 혹은 커스텀 의미부여 가능
- *.tfvars: 테라폼 변수 -> 외부에서 세팅하는 기본값

```
/basic
L provider.tf       : 버전, 공급자정보 기술
L terraform.tfvars
L main.tf
L variables.tf      : 테라폼 변수
L outputs.tf
L .gitignore
```

## 인프라 구성 핵심 절차
- 인프라 코드가 있는 위치로 이동 (단, 옵션부여로 경로지정 가능)
```
cd basic
```
- step1 : 테라폼 초기화
```
terraform.init
- 결과물 체크
- .terraform/~ : 공급자 플러그인, 바이너리, 모듈, 정보 등 생성
- .terraform.lock.hcl: 프로바이더 모듈의 지정한 버전, 해시값 잠금 관리 -> 안정적 관리, 자동생성시 체킹용도
```
- step2 : 문법 검사(체킹)
```
terraform validate
```
- step3 : 실행계획 확인(플래닝, 시뮬레이션)
```
terraform plan
```
- step4 : 테라폼 적용 (실제 생성)
```
terraform apply
```
- step5 : 테라폼 삭제
```
terraform destroy
```