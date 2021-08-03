start:
	docker-compose	up	-d
	docker-compose	exec	web	rake	unicorn:start
del:
	docker-compose	down
stop:
	docker-compose	exec	web	rake	unicorn:stop
	docker-compose stop
create_sample:
	docker-compose	exec	web	rake	db:drop
	docker-compose	exec	web	rake	db:create_indexes
	docker-compose	exec	web	rake	ss:create_site data='{ name: "demo", host: "www", domains: "localhost:3000" }'
	docker-compose	exec	web	rake	db:seed name=demo site=www
	docker-compose  exec  web rake  unicorn:stop
	docker-compose  exec  web rake  unicorn:start
uni_restart:
	 docker-compose  exec  web rake  unicorn:stop
	 docker-compose  exec  web rake  unicorn:start

go_web:
	docker-compose	exec	web	bash
go_nginx:
	docker-compose	exec	nginx	bash
