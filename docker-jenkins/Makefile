build:
	@docker-compose build
	@docker-compose pull proxy
run:
	@./setlocation.sh
	@docker-compose up -d nginx data master proxy
push:
	@docker-compose push
pull:
	@docker-compose pull
stop:
	@docker-compose stop
clean:	stop
	@docker-compose rm master nginx proxy
clean-data: clean
	@docker-compose rm -v data
wipe:
	@docker-compose down --rmi all
