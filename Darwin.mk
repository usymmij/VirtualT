# ===============================================
# macOS build settings (Apple Silicon / Intel)
#
# Builds natively for the host architecture using
# the system clang and an FLTK found via fltk-config
# (e.g. Homebrew's "brew install fltk" or a source
# build installed to /usr/local).
#
# To build an Apple Silicon binary, FLTK must itself be
# universal or Apple Silicon; then run:
#     make ARCHFLAGS="-arch arm64"
# To build a universal binary, FLTK must itself be
# universal; then run:
#     make ARCHFLAGS="-arch arm64 -arch x86_64"
# ===============================================

ARCHFLAGS	?=

CFLAGS		+=	-D__unix__ $(ARCHFLAGS)
CPPFLAGS	+=	-D__unix__ $(ARCHFLAGS) -std=gnu++11

# Use libc++ and FLTK's own static link line; no X11 on macOS.
LIBFILES	=	$(shell $(FLTKCONFIG) --use-images --ldstaticflags) -lc++
LDFLAGS		+=	$(ARCHFLAGS)

#post:
#	/usr/local/bin/fltk-config --post virtualt
