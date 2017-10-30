build:
	@docker-compose build
	@docker-compose pull proxy
run:
	@./setlocation.sh
	@docker-compose pull
	@docker-compose up -d nginx data master proxy
stop:
	@docker-compose down
clean:	stop
	@docker-compose rm master nginx proxy
clean-data: clean
	@docker-compose rm -v data
clean-images:
	@docker-compose images
