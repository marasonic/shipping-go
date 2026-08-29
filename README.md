# Hello API

## Dependencies

- Go 1.24.5 or newer

## Setup

Run the setup target to verify the installed Go version and initialize your
shell environment:

```bash
make setup
```

The required Go version is defined in `go.mod`. If Go is not installed, or the
installed version is older than required, install or upgrade Go before running
the setup target.

Start a new shell, or reload the current shell, after setup:

```bash
source ~/.bashrc
```

## Release Milestones

### V0 (1 day)
- [ ] Onboarding Documentation
- [ ] Simple API Response (hello world!)
- [ ] Unit tests
- [ ] Running somewhere other than the dev machine

### V1 (7 days)
- [ ] Create translation endpoint
- [ ] Store translations in short term storage
- [ ] Call existing service for translation
- [ ] Move towards long-term storage