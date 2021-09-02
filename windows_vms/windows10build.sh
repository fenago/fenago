# https://support.opennebula.pro/hc/en-us/articles/360042898271-How-to-Build-an-Image-for-Windows-Virtual-Machines


onedatastore list
# Make sure -d points to the right Datastore
oneimage create -d 108 --name "ONE Windows Context ISO" --path one-context.iso --type CDROM
oneimage create -d 108 --name "Virtio Windows Drivers ISO" --path ./virtio-win.iso --type CDROM
oneimage create -d 108 --name "Windows 10 ISO" --path ./win10.iso --type CDROM
oneimage create -d 108 --name "Windows 10" --type DATABLOCK --size 45G --persistent
oneimage list

#Make sure it points to the right NIC
onetemplate create template.txt
onetemplate list

onetemplate instantiate "Windows 10 Installation"

echo "WAIT UNTIL WINDOWS INSTALLS before running the next script"
