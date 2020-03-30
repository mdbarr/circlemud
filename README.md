# circlemud
Circle MUD 3.1 Docker Image

## Building
```bash
docker build -t circle:3.1 .
```

## Running
```bash
docker run -d --rm -v circlemud-data:/circle-3.1/lib --name circlemud -p 4000:4000 circlemud:3.1
```

## Accessing Circle MUD
```bash
telnet localhost 4000
```
