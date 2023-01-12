rm /tmp/curl_result.txt

echo "server : $1"

size="1000000000"
taskset 0x1 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
taskset 0x1 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
taskset 0x2 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
taskset 0x2 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
taskset 0x4 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
taskset 0x4 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
taskset 0x8 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
taskset 0x8 curl --data-binary @-$size -m 30 -s  http://$1:8080/speedtest/upload.php -w "%{speed_upload}\n" >> /tmp/curl_result.txt &
sleep 20
echo ""
awk -f curl_result.awk /tmp/curl_result.txt
