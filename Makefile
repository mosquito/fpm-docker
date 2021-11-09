
all: bionic focal hirsute impish

focal:
	docker build -t fpm:focal --force-rm --compress -f Dockerfile.focal .

bionic:
	docker build -t fpm:bionic --force-rm --compress -f Dockerfile.bionic .

hirsute:
	docker build -t fpm:hirsute --force-rm --compress -f Dockerfile.hirsute .

impish:
	docker build -t fpm:impish --force-rm --compress -f Dockerfile.impish .

upload:
	for i in bionic focal hirsute impish; \
		do docker tag fpm:$$i mosquito/fpm:$$i; \
		   docker push mosquito/fpm:$$i; \
	done
