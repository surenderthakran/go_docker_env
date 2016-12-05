GO_PROJECT_NAME := my_go_project

install:
	@echo Running make install...
	@pwd
	@mkdir -p $(GOPATH)/bin $(GOPATH)/pkg
	@go install $(GO_PROJECT_NAME)

run:
	@echo Running make run...
	@pwd
	@$(GOPATH)/bin/$(GO_PROJECT_NAME)
