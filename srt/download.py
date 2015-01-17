# http://keepsubs.com/

import mechanize

# Test Obama URL.
obamaUrl = "https://www.youtube.com/watch?v=Tk5Sps0z27A"

br = mechanize.Browser()
br.open("http://keepsubs.com/")
for f in br.forms():
    print f

br.select_form(nr=0)
br.form['DOWNLOAD'] = obamaUrl
br.submit()
br.response.read()