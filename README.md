# cloudflare ddns update
Here you can find the code I made with the cloudflare API to automatically update my IP address on the website I self-host

You have to complete these items for the script to work : 
* __email__ : the email address of your account
* __global_key__ : The global key of your account, it can be found on https://dash.cloudflare.com/profile/api-tokens
* __Zone_ID__ It is shown at the bottom of the preview tab. Whether you have 1 or more sites, you must fill in this field
* __Domain_Name__ : Your domain name, without any subdomain. F.e : google.com (not ~~www.google.com~~)
* __proxy__ : If your domain name is proxied by cloudflare, put <ins>true</ins>, else, put <ins>false</ins>
* __type__ : Your DNS Type. Default is A if you redirect it to an IPv4 address. F.e : <ins>192.168.15.19</ins>

-----

You can use this script on every linux that supports `curl` and `jq` packages. <br>
You can install them using (for Ubuntu / Debian based OS) : `apt install -y curl jq`

I personnaly put the script in the `/usr/local/sbin` directory, and make a crontab on it with this line :  
`*/5 * * * * /usr/local/sbin/cloudflare-ddns-update.sh > /dev/null 2>&1`  

It will check every 5 minutes if the public IP is correct, and if not, it will change it on your cloudflare control panel.  

The `> /dev/null 2>&1` is to redirect the errors and the output of the program to nowhere, to avoid the display of errors in a log file. (Normally, you shouldn't get any errors)  

To add the upper line to the crontab, you only have to type `sudo crontab -e` in a terminal, and past the line (with changing the directory of your script if you didn't put it in `/usr/local/sbin`)

-----

Hope you enjoy it, I did it because I couldn't find anything on this website that works, so I decided to make this script by myself  
Have a good day !
