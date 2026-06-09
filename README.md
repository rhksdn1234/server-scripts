# server-scripts

리눅스 서버 운영에 사용하는 자동화 스크립트 모음입니다.
인프라 운영 중 반복되는 작업을 스크립트로 정리하여 관리합니다.

## 스크립트 목록

### check_server.sh

서버의 핵심 상태를 한 번에 점검하는 스크립트입니다.

**점검 항목**
- 디스크 사용량
- 메모리 사용량
- CPU 부하 (load average)
- 메모리 사용량 상위 프로세스 TOP 5

**사용 방법**

​```
chmod +x check_server.sh &&
./check_server.sh
​```

## 실행 환경

- Rocky Linux / Ubuntu 등 리눅스 환경
- bash shell

### check_services.sh

지정한 핵심 서비스들이 정상 작동 중인지 점검하는 스크립트입니다.

**점검 방식**
- `systemctl is-active`로 각 서비스의 작동 여부를 확인
- 정상 작동 시 `[정상]`, 중지/미설치 시 `[경고]` 표시

**점검 대상 (기본값)**
- sshd
- mariadb
- NetworkManager

> 점검 대상은 스크립트 상단의 `SERVICES` 배열에서 자유롭게 추가/수정할 수 있습니다.

**사용 방법**

​```bash
chmod +x check_services.sh
./check_services.sh
​```
