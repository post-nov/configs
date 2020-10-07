# Anne Pro 2 bluetooth configuration

## Source
https://www.reddit.com/r/AnnePro/comments/61ww3x/does_the_bluetooth_wireless_work_with_linux/

## Steps
- Open terminal and type in "sudo apt-get install blueman bluez bluetooth" (minus quotation marks). You will need your sudo password. Note I removed "bluez-utils" from what the website references as it's no longer needed because it's part of "bluez"

- Once successful, then type "sudo /etc/init.d/bluetooth start"

- Once done, you should now be able to type "Blue" in a search bar and see something like Blueman, Bluetooth Adapters. Mine was "Bluetooth Manager". Launch it.

- Put the Anne Pro into bluetooth mode using Fn+B

- Click on "Scan" or "Search" in the Bluetooth Devices application and it should find it. Click "Pair"

- Enter the six digit pairing code on the Anne Pro and it should go back to the normal Fn+B pairing mode with the flashing + sign.

- At this point, you can either hit Escape to exit and start using the keyboard or better yet, save the config as a "Quicksave" for faster pairing in future. To do that, press either 1, 2, 3 or 4 to save it to one of those slots. It should turn green to confirm it's saved.

- Now you can hit escape and start using your Anne Pro!
