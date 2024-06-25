#Proto files directory
PROTO_DIR = proto

#Generated go files directory
GEN_GO_DIR = ./gen/go

#Proto files to compile
PROTO_FILES = $(PROTO_DIR)/sso/sso.proto

#Define proto command with all necessary options
PROTOC_CMD = protoc -I proto $(PROTO_FILES) \
			--go_out=$(GEN_GO_DIR) \
			--go_opt=paths=source_relative \
			--go-grpc_out=$(GEN_GO_DIR) \
			--go-grpc_opt=paths=source_relative

all: build

build:
	mkdir $(GEN_GO_DIR)
	$(PROTOC_CMD)

clean:
	rm -rf $(GEN_GO_DIR)/