# Prerequisities for Windows users

## 1. Terraform

Open a Powershell window **as Administrator** (right click on Powershell and select "Run as adminstrator") and execute `Set-ExecutionPolicy unrestricted`

To locate the version of PowerShell you are running execute the following command:

```
$ $PSVersionTable.PSVersion
```

If you are running PowerShell v2 execute the following command:

```
$ iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

If you are running PowerShell v3 or above execute the following command:

```
$ iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

Once Chocolatey is installed execute the following commands:

```
$ choco install terraform -y
$ choco install git.install -y
```

## 2. Pageant

Download and install Pageant (an SSH authentication agent) from [here](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

## 3. Clone the repo

Now clone the repo by executing `git clone https://github.com/apprenda/hands-on-with-kubernetes-workshop.git`

## 4. Digital Ocean account

You will also require an account on [https://www.digitalocean.com/](https://www.digitalocean.com/)
