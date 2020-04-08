
all: debian10 debian9 debian8 centos7 xenial bionic

debian8:
	docker build -t fpm:debian8 --force-rm --compress --squash -f Dockerfile.debian8 .

debian9:
	docker build -t fpm:debian9 --force-rm --compress --squash -f Dockerfile.debian9 .

debian10:
	docker build -t fpm:debian10 --force-rm --compress --squash -f Dockerfile.debian10 .

centos7:
	docker build -t fpm:centos7 --force-rm --compress --squash -f Dockerfile.centos7 .

xenial:
	docker build -t fpm:xenial --force-rm --compress --squash -f Dockerfile.xenial .

bionic:
	docker build -t fpm:bionic --force-rm --compress --squash -f Dockerfile.bionic .

upload:
	for i in debian8 debian9 debian10 centos7 xenial bionic; \
		do docker tag fpm:$$i mosquito/fpm:$$i; \
		   docker push mosquito/fpm:$$i; \
	done
