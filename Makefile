DESTDIR=

all:

pkgdocdir=/usr/share/doc/packages/susefirewall2-to-firewalld

install:
	install -d -m 755 $(DESTDIR)/usr/sbin
	install -m 755 susefirewall2-to-firewalld $(DESTDIR)/usr/sbin

install_doc:
	install -d -m 755 $(DESTDIR)$(pkgdocdir)
	install -m 644 COPYING $(DESTDIR)$(pkgdocdir)/
	install -m 644 ChangeLog $(DESTDIR)$(pkgdocdir)/
	install -m 644 README.md $(DESTDIR)$(pkgdocdir)/

package:
	@./obs/mkxz

.PHONY: clean package install install_doc all
