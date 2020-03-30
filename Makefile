all: build

build:
	docker build -t circlemud:3.1 .

start:
	docker run -d --rm -v circlemud-data:/circle-3.1/lib --name circlemud -p 4000:4000 circlemud:3.1

stop:
	docker kill circlemud

clean:
	docker kill circlemud
	docker volume rm circlemud-data
