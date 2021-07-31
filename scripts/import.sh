set -e

hledger print -f ./2021.journal  -o expenses.csv 支出
hledger bal -f ./2021.journal  -E -V --flat -o balance.csv -N 资产

sed -i 's/ CNY//' balance.csv
sed -i 's/ USD//' balance.csv

sed -i '1d' balance.csv
sed -i '1d' expenses.csv

cat scripts/import.sql | sqlite3 accounting.sqlite3

chmod 0400 ./id_rsa
scp -o StrictHostKeyChecking=no -i ./id_rsa ./accounting.sqlite3 root@<xxx>:/root/data/accounting.sqlite3