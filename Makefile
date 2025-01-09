CC=arm-linux-gnueabihf-gcc
QEMU=qemu-arm
GDB=gdb-multiarch
CFLAGS=-nostdlib -static
TARGET=myfirst
SRC=$(TARGET).s
PORT=4242
BUILD_DIR=build
GDB_CMDS=$(BUILD_DIR)/gdb_commands

all: build run

build:
	@mkdir -p $(BUILD_DIR)
	$(CC) -o $(BUILD_DIR)/$(TARGET) $(SRC) $(CFLAGS)

run: build
	$(QEMU) -g $(PORT) ./$(BUILD_DIR)/$(TARGET)

debug: 
	@echo "file ./$(BUILD_DIR)/$(TARGET)" > $(GDB_CMDS)
	@echo "target remote localhost:$(PORT)" >> $(GDB_CMDS)
	@echo "lay next" >> $(GDB_CMDS)
	@echo "lay next" >> $(GDB_CMDS)
	@echo "lay next" >> $(GDB_CMDS)
	@echo "lay next" >> $(GDB_CMDS)
	$(GDB) -x $(GDB_CMDS)

clean:
	rm -rf $(BUILD_DIR)
