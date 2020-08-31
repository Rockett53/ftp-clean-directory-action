# ftp-delete-action
Automate deleting files & directories on your ftp server using this GitHub action.

This action is inspired by https://github.com/StephanThierry/ftp-delete-action/ which is used to clean only files of a directory.  

The example below uses GitHub secrets to generate the parameters you don't want to have visible in your repo: https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets  

## Example usage

```
name: Deploy via ftp
on: push
jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repo
      uses: actions/checkout@v2

#   ... INSTALL / RESTORE / BUILD ...  

    - name: Clean FTP Directory
      uses: Rockett53/ftp-clean-directory-action@releases/v5
      with:
        host: ${{ secrets.FTP_SERVER }}
        user: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
        workingDir: "/public_html"
        ignoreSSL: "1"

#   ... THE REST OF YOUR DEPLOYMENT ...  

```

## Input parameters

Input parameter | Description | Required | Example
--- | --- | --- | ---
host | FTP server name | Yes | ftp.domain.com
user | FTP username | Yes | ftpUser
password | FTP password | Yes | secureFtpPassword
workingDir | Working directory (Use "." if you want the server default and not "/") | No, default=/ | `/public_html`
ignoreSSL | Ignore invalid TLS/SSL certificate (1=ignore)  | No, default=0 | 1
