GO_PROJECT_NAME := my_go_project

# Go rules
go_format:
	@echo "\n....Formatting $(GO_PROJECT_NAME)'s go files...."
	gofmt -w $(GOPATH)/src/$(GO_PROJECT_NAME)

go_prep_install:
	@echo "\n....Preparing installation environment for $(GO_PROJECT_NAME)...."
	mkdir -p $(GOPATH)/bin $(GOPATH)/pkg
	go get github.com/cespare/reflex
	curl https://glide.sh/get | sh

go_dep_install:
	@echo "\n....Installing dependencies for $(GO_PROJECT_NAME)...."
	cd $(GOPATH)/src/$(GO_PROJECT_NAME) && glide install

go_install:
	@echo "\n....Compiling $(GO_PROJECT_NAME)...."
	go install $(GO_PROJECT_NAME)

go_test:
	@echo "\n....Running tests for $(GO_PROJECT_NAME)...."
	go test ./src/$(GO_PROJECT_NAME)/...

go_run:
	@echo "\n....Running $(GO_PROJECT_NAME)...."
	$(GOPATH)/bin/$(GO_PROJECT_NAME)


# Project rules
install:
	$(MAKE) go_prep_install
	$(MAKE) go_dep_install
	$(MAKE) go_install

run:
ifeq ($(CODE_ENV), dev)
	# Reinstalling dependencies because the project folder is being mounted from
	# host, this removes vendor folder from inside the container.
	cd $(GOPATH)/src/$(GO_PROJECT_NAME) && glide install
	reflex -s -g 'src/$(GO_PROJECT_NAME)/*.go' make restart
else
	$(MAKE) go_run
endif

restart:
	@$(MAKE) go_format
	@$(MAKE) go_install
	@$(MAKE) go_test
	@$(MAKE) go_run

.PHONY: go_format go_prep_install go_dep_install go_install go_run install run restart
