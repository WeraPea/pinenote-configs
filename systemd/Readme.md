Backlight should be turned off before suspend and be returned back to normal after wake.

This systemd unit uses ```light``` to do exactly that.

## Installation

* Copy to

	/etc/systemd/system/

* Reload systemd unit files

 	sudo systemctl daemon-reload

* Activate the unit

	sudo systemctl enable beforesuspend.service aftersuspend.service
