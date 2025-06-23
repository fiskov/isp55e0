TARGET = isp55e0
SRCS = isp55e0.c
OBJS = $(SRCS:.c=.o)

CC ?= gcc
WITH_USB ?= 1

ifeq ($(WITH_USB), 1)
LDLIBS = -lusb-1.0
endif

CFLAGS = -O2 -Wall -Werror
CFLAGS += -DWITH_USB=${WITH_USB}

.PHONY: all clean chips

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(CFLAGS) $(LDLIBS)
	@printf "  USB-support=${WITH_USB}\n"

.c.o:
	$(CC) $(CFLAGS)  -c $< -o $@

chips:
	./parse_wcfg.py > chips.h

clean:
	rm -f isp55e0 *.o
