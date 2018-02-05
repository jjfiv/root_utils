import pexpect

with open('user.db') as fp:
  for line in fp:
    [user, passwd] = line.strip().split(':')
    #print(user,passwd)
    child = pexpect.spawn('su - %s' % (user))
    idx = child.expect([pexpect.TIMEOUT, 'Password:'])
    if idx == 0: # timeout
        print("TIMEOUT: ",user)
        continue
    elif idx == 1:
        # found password
        child.sendline(passwd)
        result = child.expect([pexpect.TIMEOUT, 'su: Authentication failure', 'Welcome to unixcourse.ddns.net'])
        if result == 0:
            print("TIMEOUT: ",user)
            continue
        elif result == 1:
            # pass:
            continue
        elif result == 2:
            print("FAIL:", user)
            continue

    else:
        print("BAD THINGS?")

