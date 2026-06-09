#!/bin/bash

# ===========================================
# 서비스 상태 점검 스크립트
# 작성자: rhksdn1234
# 지정한 서비스들이 정상 작동 중인지 확인한다.
# ===========================================

# 점검할 서비스 목록 (환경에 맞게 추가/수정)
SERVICES=("sshd" "mariadb" "NetworkManager")

echo "========================================"
echo " 서비스 상태 점검 - $(hostname)"
echo " 점검 시각: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================"
echo ""

# 서비스 하나의 상태를 확인하는 함수
check_one_service() {
    local svc="$1"

    if systemctl is-active --quiet "$svc"; then
        echo "  [정상] $svc 작동 중"
    else
        echo "  [경고] $svc 중지됨 또는 미설치!"
    fi
}

# 목록의 모든 서비스를 하나씩 점검
for service in "${SERVICES[@]}"
do
    check_one_service "$service"
done

echo ""
echo "========================================"
echo " 점검 완료"
echo "========================================"
