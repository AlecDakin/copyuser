#! /bin/bash

# Create the new user with the same groups and shell:
sudo useradd -m -s /bin/bash -G "$(id -nG olduser | cut -d' ' -f2- | tr ' ' ',')" newuser
sudo passwd newuser

## Things this doesn't copy:
## Sudo rights: these come from the wheel group on Arch-based systems, so they are covered. A user-specific entry in /etc/sudoers.d/ would need repeating.
## Settings and files: if you want olduser's desktop settings, copy them selectively rather than the whole home directory, for example:

sudo cp -a /home/olduser/.config /home/newuser/
sudo chown -R newuser:newuser /home/newuser/.config
