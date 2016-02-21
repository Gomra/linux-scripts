#!/bin/bash

sudo patch /usr/share/themes/elementary/gtk-2.0/gtkrc < ~/btsync/private/linux/scripts/gtk_scrollbar.patch
sudo patch /usr/share/themes/elementary/gtk-3.0/gtk-widgets.css < ~/btsync/private/linux/scripts/gtk-3-widgets-css.patch

exit 0
