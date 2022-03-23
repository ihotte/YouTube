
ARCH:=$(shell uname -s)
ARGS:=

COMMA:=,
EMPTY:=
SPACE:=$(EMPTY) $(EMPTY)

ifeq ($(ARCH), Darwin)
  export ORIG_PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
  ARGS+= --proxy socks5://127.0.0.1:7890
else
  export ORIG_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
endif

export PATH=$(CURDIR)/.bin:$(ORIG_PATH)


vid:=AEcaaqAwHsI

yt:=.bin/yt-dlp --config-location yt-dlp.conf $(ARGS)

include $(CURDIR)/manifest/$(vid).mk
fid:=$(subst $(SPACE),$(COMMA),$(fid))


i:
	[ -d "./download/$(vid)/" ] || mkdir "./download/$(vid)/"
	$(yt) -F $(vid) |tee "./download/$(vid)/manifest.md"

f:
	$(yt) --get-filename $(vid)
	$(yt) --get-filename -f $(fid) $(vid)

d:
	$(yt) -k -f $(fid) $(vid)


