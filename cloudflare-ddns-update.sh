Actual_IP=$(curl -s https://ifconfig.me)

email="" # Your email of connexion to your cloudflare account
global_key="" # Can be found on https://dash.cloudflare.com/profile/api-tokens

Zone_ID="" # It is shown at the bottom of the preview tab
Domain_Name="" # Put the name of the domain you want to update the IP. It is normally on the right of the Type
proxy="" # If your website is proxied, put "true", else : "false"
type="A" # Your DNS Type. Default is A

Get_IP=$(curl -X GET "https://api.cloudflare.com/client/v4/zones/${Zone_ID}/dns_records?type=${type}&name=${Domain_Name}&proxied=${proxy}" \
     -H "X-Auth-Email: ${email}" \
     -H "X-Auth-Key: ${global_key}" \
     -H "Content-Type: application/json" | \
     jq -r .result[0].content)

if [ $Actual_IP = $Get_IP ]
then
	set -e
else
	Get_ID=$(curl -X GET "https://api.cloudflare.com/client/v4/zones/${Zone_ID}/dns_records?type=${type}&name=${Domain_Name}&proxied=${proxy}" \
     		-H "X-Auth-Email: ${email}" \
     		-H "X-Auth-Key: ${global_key}" \
     		-H "Content-Type: application/json" | \
     		jq -r .result[0].id)

	curl -X PUT "https://api.cloudflare.com/client/v4/zones/${Zone_ID}/dns_records/${Get_ID}" \
     		-H "X-Auth-Email: ${email}" \
     		-H "X-Auth-Key: ${global_key}" \
     		-H "Content-Type: application/json" \
     		--data "{\"type\":\"${type}\",\"name\":\"${Domain_Name}\",\"content\":\"$Actual_IP\",\"proxied\":${proxy}}"
fi
