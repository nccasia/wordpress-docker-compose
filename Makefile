start:
	docker-compose up -d --build

healthcheck:
	docker-compose run --rm healthcheck

down:
	docker-compose down

install: start healthcheck

configure:
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --rm wp-auto-config

autoinstall: start
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --rm wp-auto-config

clean: down
	@echo "💥 Removing related folders/files..."
	@rm -rf  mysql/* wordpress/*

reset: clean

snaps:
	 aws s3 ls s3://${AWS_S3_BUCKET_NAME} --recursive --human-readable --summarize

pull:
	aws s3 cp s3://${AWS_S3_BUCKET_NAME}/$(file) test2.txt

backup:
	docker exec wordpress_backup backup

restore:
	docker run -d --name backup_restore -v offen_data:/backup_restore alpine
	docker cp <location_of_your_unpacked_backup> backup_restore:/backup_restore
	docker stop backup_restore && docker rm backup_restore
