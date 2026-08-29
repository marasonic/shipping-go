.PHONY: build setup check-go init-go

build:
	go build -o api .

setup: check-go init-go

check-go:
	@required_version=$$(awk '$$1 == "go" { print $$2; exit }' go.mod); \
	if ! command -v go >/dev/null 2>&1; then \
		echo "Go is required. Install Go $$required_version."; \
		exit 1; \
	fi; \
	current_version=$$(go version | awk '{print $$3}' | sed 's/^go//'); \
	if [ "$$(printf '%s\n' "$$required_version" "$$current_version" | sort -V | tail -n1)" != "$$current_version" ]; then \
		echo "Go $$required_version or newer is required; found Go $$current_version."; \
		exit 1; \
	fi; \
	echo "Go $$current_version is supported."

init-go:
	@grep -qxF 'export PATH=$$PATH:/usr/local/go/bin' ~/.bashrc 2>/dev/null || \
		echo 'export PATH=$$PATH:/usr/local/go/bin' >> ~/.bashrc
	@grep -qxF 'export PATH=$$PATH:$$(HOME)/go/bin' ~/.bashrc 2>/dev/null || \
		echo 'export PATH=$$PATH:$$(HOME)/go/bin' >> ~/.bashrc
