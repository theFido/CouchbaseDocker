echo "Starting Couchbase"
ip addr
/etc/init.d/couchbase-server start
sleep 20
cd /opt/couchbase/bin
./couchbase-cli cluster-init -u Admin -p admin12345 -c 127.0.0.1:8091 --cluster-init-ramsize=500
./couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=default --bucket-type=couchbase --bucket-port=11211 --bucket-ramsize=100 --bucket-replica=1 -u Admin -p admin12345

ip addr
echo "Starting N1QL"

/opt/n1ql/cbq-dp4/cbq-engine -datastore=http://localhost:8091