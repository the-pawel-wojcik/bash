# Send mail from the command line
## msmtp
Based on the tutorial by [Arnaud Rebillout](https://arnaudr.io/2020/08/24/send-emails-from-your-terminal-with-msmtp/).
### Usage
```bash
cat << EOF > message.txt
From: YOUR_LOGIN@gmail.com
To: SOMEONE_ELSE@SOMEWHERE_ELSE.com
Subject: Next Game Is on Sunday

8:30 am at the Emirates Stadium
EOF
msmtp -t < message.txt
```

### Dependencies
```bash
sudo apt install msmtp libsecret-tools
```

### Store the key with
```bash
secret-tool store\
    --label msmtp\
    host smtp.gmail.com\
    service smtp\
    user YOUR_LOGIN
```

## Mutt
msmtp does not support sending attachments. Attachments need mutt which is a
Multipurpose Internet Mail Extensions (MIME) mail client.

### Usage
```bash
mutt -s "Subject" recipient@domain.tld
```
Command like this would open an application that requires interaction. Opening
the interactive mode is suppressed if the mail body is passed from stdin.
```bash
cat << EOF > message_mutt.txt
Plain body of the text.

Best regards,
Paweł
EOF
mutt -s "Subject" recipient@domain.tld < message_mutt.txt
```
Adding blind carbon copy
```bash
mutt -s "Subject" -b user@mail.tld recipient@domain.tld < message_mutt.txt
```
Add attachments
```bash
mutt -s "Subject" -a "wisdom.pdf" -- recipient@domain.tld < message_mutt.txt
```
