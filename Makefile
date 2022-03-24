
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


vid:=2n2qlwgR7-g

yt:=.bin/yt-dlp --config-location yt-dlp.conf $(ARGS)

$(shell touch $(CURDIR)/manifest/$(vid).mk)
include $(CURDIR)/manifest/$(vid).mk
fid:=$(subst $(SPACE),$(COMMA),$(fid))


i:
	[ -d "./download/$(vid)/" ] || mkdir "./download/$(vid)/"
	$(yt) -F $(vid) |tee "./download/$(vid)/$(vid).md"

f:
	$(yt) --get-filename $(vid)
	$(yt) --get-filename -f $(fid) $(vid)

d:
	$(yt) -k -f $(fid) $(vid)



push:
	git status && read
	git add .
	git commit -m "$(shell date)"
	git push

pull:
	git pull
