GO_PROJECT_NAME := my_go_project

# Go rules
go_format:
	gofmt -w $(GOPATH)/src/$(GO_PROJECT_NAME)

go_prep_install:
	mkdir -p $(GOPATH)/bin $(GOPATH)/pkg
	go get github.com/cespare/reflex

go_install:
	go install $(GO_PROJECT_NAME)

go_run:
	$(GOPATH)/bin/$(GO_PROJECT_NAME)

# Project rules
install:
	$(MAKE) go_prep_install
	$(MAKE) go_install

run:
ifeq ($(CODE_ENV), dev)
	./bin/reflex -s -g 'src/my_go_project/*.go' make restart
else
	$(MAKE) go_run
endif

restart:
	$(MAKE) go_format
	$(MAKE) go_install
	$(MAKE) go_run

.PHONY: go_format go_prep_install go_install go_run install run restart
