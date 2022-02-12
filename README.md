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

Hope you enjoy it, I did it because I couldn't find anything on this website that works, so I decided to make this script by myself  
Have a good day !
