susefirewall2-to-firewalld
==========================

Introduction
------------

This is a simple bash script aiming to provide a basic migration path from
SuSEfirewall2 to FirewallD. However, as SuSEfirewall2 offers a great amount of
flexibility, the script may fail or refuse to migrate certain rules. This is on
purpose since migrating every possible iptables rule would make the script rather
complex and it would also lead to a complicated and unmaintained FirewallD
configuration. This script will try to migrate at least the _well-known_ zones
and services but it may fail to do anything more sophisticated than that.
If you think a critical functionality is missing please open a bug report but you
should bear in mind that this script is not an accurate translator between
SuSEfirewall2 and firewalld configurations.

Since the sole purpose of this script is to provide a starting point for the
SuSEfirewall2 to FirewallD migration, it's likely the outcome to not be
100% indentical to what you had with SuSEfirewall2 and some user intervention
may be necessary to achieve the desired results.

Usage
-----

The script accepts the following options:
```
-c     Commit changes. The script will make changes to the system so
       make sure you only use this option if you are really happy with the proposed
       changes. This *will* reset your current FirewallD configuration so make sure you
       make backups!

-d     Debug output. Super noisy. Use it to file bug reports but be careful to mask
       sensitive information.

-q     No output. Errors will not be printed either!
-v     Verbose mode. It will print warnings and other informative messages.
```

Calling the script without any option is the safest option
since it will only output what it will do without committing any changes.
The only 'invasive' change in your system would be to start/stop/restart
firewalld and SuSEfirewall2 services which may affect your network connectivity
and lock yourself out of your system. *DO NOT* run this script on systems you can
only access via network services (eg ssh). Make sure you backup your iptables
rules before you proceed.

You should also be aware that if you omit the '-c' option then certain commands
may look a bit odd to you (or you may spot duplicate commands). That's mostly
normal because the execution flow depends on certain firewalld commands which
will not be executed unless you tell the script to do so.

Bug reports
-----------
- https://github.com/opensuse/susefirewall2-to-firewalld
- https://bugzilla.opensuse.org
