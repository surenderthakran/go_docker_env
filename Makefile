GO_PROJECT_NAME := my_go_project

# Go rules
go_format:
	gofmt -w $(GOPATH)/src/$(GO_PROJECT_NAME)

go_clean:
	rm -rf $(GOPATH)/bin/*
	# TODO(surenderthakran): decide if we need to clean pkg/ also

go_install:
	go install $(GO_PROJECT_NAME)

go_run:
	$(GOPATH)/bin/$(GO_PROJECT_NAME)

# Project rules
install:
	mkdir -p $(GOPATH)/bin $(GOPATH)/pkg
	$(MAKE) go_install

run:
	$(MAKE) go_run

restart:
	$(MAKE) go_format
	$(MAKE) go_clean
	$(MAKE) go_install
	$(MAKE) go_run

.PHONY: go_format go_clean go_install go_run install run
