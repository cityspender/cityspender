#!/usr/bin/env python

import csv
import json
import unicodedata
import string

# define valid characters for use later on in removing invalids
valid_chars = string.lowercase + string.uppercase + string.digits + """|!'\\"#$%&/()=?^*_:;>+,.-<\n \t"""
all_chars = "".join(map( chr, range(256)) )
comp_valid_chars = "".join( set(all_chars).difference(valid_chars) )

# define a csv reader for the pct data
pctReader = csv.reader(open('../../data/purchase_card_transactions_20101208.csv', 'rb'), delimiter=',', quotechar='|')

# define the output array (to be converted to json)
output = []

# loop over rows and append to the output array
for row in pctReader:
	#print row
	
	# clean the data
	merchant = row[0].translate(all_chars, comp_valid_chars)
	amount = row[1].translate(all_chars, comp_valid_chars)
	date = row[2].translate(all_chars, comp_valid_chars)

	print merchant + ', ' +  amount + ', ' + date
		
	output.append({ "merchant": merchant, "amount": amount, "date": date })

# dump to json	
jsonOutput = json.dumps(output)

#print jsonOutput

# store the json to disk
filename = '../../data/purchase_card_transactions_20101208.json'
FILE = open(filename,"w")
FILE.write(jsonOutput)
FILE.close()




