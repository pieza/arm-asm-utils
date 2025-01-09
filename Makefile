CC=arm-linux-gnueabihf-gcc
QEMU=qemu-arm
GDB=gdb-multiarch
CFLAGS=-nostdlib -static
TARGET=myfile
SRC=$(TARGET).s
PORT=4242
GDB_CMDS=gdb_commands

all: build run

build:
        $(CC) -o $(TARGET) $(SRC) $(CFLAGS)

run: build
        $(QEMU) -g $(PORT) ./$(TARGET)

debug:
        @echo "file ./$(TARGET)" > $(GDB_CMDS)
        @echo "target remote localhost:$(PORT)" >> $(GDB_CMDS)
        @echo "lay next" >> $(GDB_CMDS)
        @echo "lay next" >> $(GDB_CMDS)
        @echo "lay next" >> $(GDB_CMDS)
        @echo "lay next" >> $(GDB_CMDS)
        $(GDB) -x $(GDB_CMDS)

clean:
        rm -f $(TARGET)
