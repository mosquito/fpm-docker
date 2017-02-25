
all: debian7 centos7

debian7:
	docker build -t fpm:debian7 --force-rm --compress -f Dockerfile.debian7 .

centos7:
	docker build -t fpm:centos7 --force-rm --compress -f Dockerfile.centos7 .
