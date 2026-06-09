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

​```bash
chmod +x check_server.sh
./check_server.sh
​```

## 실행 환경

- Rocky Linux / Ubuntu 등 리눅스 환경
- bash shell

