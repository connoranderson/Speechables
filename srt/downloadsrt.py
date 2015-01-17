# http://keepsubs.com/

import mechanize

# Test Obama URL.
file = open('url.py', 'r')
InputUrl = file.read();

url='http://keepsubs.com/?url='

for c in InputUrl:
	if c == ':': 
		url+='%3A'
	elif c == '/':
		url+='%2F'
	elif c == '?':
		url+='%3F'
	else:
		url+=c

print url



br = mechanize.Browser()
br.open(url)

i = 0
for link in br.links():
	if i == 3:
		br.retrieve(link.url,'content.srt')[0]
	i+=1

