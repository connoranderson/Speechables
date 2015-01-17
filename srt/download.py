# http://keepsubs.com/

import mechanize

# Test Obama URL.
InputUrl = "https://www.youtube.com/watch?v=P79E0-3LeW8"

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




# for form in br.forms():
#     print form.name
#     print form

# br.select_form(nr=0)

# br.submit()
# br.response.read()

