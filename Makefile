
all: debian7 debian8 centos7 ubuntu

debian7:
	docker build -t fpm:debian7 --force-rm --compress --squash -f Dockerfile.debian7 .

debian8:
	docker build -t fpm:debian8 --force-rm --compress --squash -f Dockerfile.debian8 .

centos7:
	docker build -t fpm:centos7 --force-rm --compress --squash -f Dockerfile.centos7 .

ubuntu:
	docker build -t fpm:ubuntu --force-rm --compress --squash -f Dockerfile.ubuntu .

upload:
	for i in debian7 debian8 centos7 ubuntu; \
		do docker tag fpm:$$i mosquito/fpm:$$i; \
		   docker push mosquito/fpm:$$i; \
	done
