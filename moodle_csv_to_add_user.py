import sys, csv, random, os

dictionary = []
with open('/usr/share/dict/words') as fp:
    for line in fp:
        if '"' in line or "'" in line:
            continue
        dictionary.append(line.strip())

rows = []
with open(sys.argv[1]) as fp:
    tsv = csv.reader(fp)
    headers = next(tsv)
    for cols in tsv:
        data = {}
        for k,v in zip(headers, cols):
            data[k] = v
        rows.append(data)

for item in rows:
    email = item['Email address']
    # skip my entry:
    if email.startswith("jjfoley@"):
        continue
    num = int(item['ID number'])
    username = email.split('@')[0]
    #if os.path.exists("/home/%s" % (username)):
        #continue

    four_words = ' '.join(random.sample(dictionary, 4))
    print('./add_user.sh %s %d "%s"' % (username, num, four_words))



