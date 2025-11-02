server = server.py
build_dir = repo

# usage: make preview
preview:
	python $(server)

build:
	python $(server) build

# usage: make push m="commit message"
push:
	git add -A && \
	git commit -m "$(m)" && \
	git push origin main

# usage: make deploy m="commit message"
deploy:
	python $(server) build && \
	cd ../deploy && \
	git pull origin main && \
	cp -r ../$(build_dir)/build/* . && \
	cp -r ../$(build_dir)/.gitignore . && \
	git add -A && \
	git commit -m 'deploy: $(m)' && \
	git push origin main
