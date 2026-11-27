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
L provider.tf
L main.tf
L variables.tf
L outputs.tf
L terraform.tfvars
L .gitignore
```