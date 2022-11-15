/interface/bridge/add name=dockers
/ip/address/add address=172.17.0.254/24 interface=dockers

/interface/veth/add name=veth1 address=172.17.0.1/24 gateway=172.17.0.254
/interface/bridge/port add bridge=dockers interface=veth1

#/container/stop  [ find where tag=elicro/ifconfig.io:latest]
#/container/remove  [ find where tag=elicro/ifconfig.io:latest]

/container config
set registry-url=https://registry-1.docker.io tmpdir=disk1/pull

/container envs
add key=PORT name=ifconfig value=80
add key=GIN_MODE name=ifconfig value=release

/container add dns=172.17.0.254 envlist=ifconfig interface=veth1 logging=yes root-dir=disk1/test remote-image=elicro/ifconfig.io:latest start-on-boot=yes

#/container/start [ find where tag=elicro/ifconfig.io:latest]
