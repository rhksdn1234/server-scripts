#!/bin/bash

# ===========================================
# 서버 상태 점검 스크립트
# 작성자: rhksdn1234
# ===========================================

echo "========================================"
echo " 서버 상태 점검 - $(hostname)"
echo " 점검 시각: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================"

echo ""
echo "[1] 디스크 사용량"

# 경고 기준값 (퍼센트). 이 값을 넘으면 경고를 표시한다.
THRESHOLD=80

# df 결과에서 실제 디스크 줄만 골라 한 줄씩 검사
df -h --output=source,pcent,target | grep -vE 'tmpfs|udev|Filesystem' | while read source usage target
do
    # usage 값에서 % 기호를 떼어내 숫자만 추출 (예: "23%" -> "23")
    usage_num=$(echo "$usage" | tr -d '%')

    if [ "$usage_num" -ge "$THRESHOLD" ]; then
        echo "  [경고] $target ($source) 사용량 ${usage}  >> 임계치 ${THRESHOLD}% 초과!"
    else
        echo "  [정상] $target ($source) 사용량 ${usage}"
    fi
done
echo ""
echo "[2] 메모리 사용량"
free -h

echo ""
echo "[3] CPU 부하 (load average)"
uptime

echo ""
echo "[4] 상위 메모리 사용 프로세스 TOP 5"
ps aux --sort=-%mem | head -n 6

echo ""
echo "========================================"
echo " 점검 완료"
echo "========================================"
