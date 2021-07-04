start:
	docker-compose	up	-d
	docker-compose	exec	web	rake	unicorn:start
stop:
	docker-compose	down
create_sample:
	docker-compose	exec	web	rake	db:drop
	docker-compose	exec	web	rake	db:create_index
	docker-compose	exec	web	rake	rake ss:create_site data='{ name: "demo", host: "www", domains: "localhost:3000" }'
	docker-compose	exec	web	rake	rake db:seed name=demo site=www
go_web:
	docker-compose	exec	web	bash
