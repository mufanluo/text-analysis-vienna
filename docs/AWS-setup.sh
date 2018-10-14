## step 1) login to console, sudo su, open R
## install packages from Setup
## for topic models, run: sudo apt-get install libgsl0-dev

# deleting users
for i in 0{1..9} {10..40}
do
	userdel -r ecpr$i
	userdel -r bigdata$i
done

# creating new users
for i in 0{1..9} {10..40}
do
	adduser --quiet --disabled-password --shell /bin/bash --home /home/vienna$i --gecos "User" vienna$i
	echo "vienna$i:password$i" | chpasswd
done


# copying files and changing permissions
for i in 0{1..9} {10..40}
do
	mkdir /home/vienna$i/code
	mkdir /home/vienna$i/data
	mkdir /home/vienna$i/credentials
	cp /home/rstudio/code/* /home/vienna$i/code/
	sudo chown vienna$i -R /home/vienna$i/
done	


