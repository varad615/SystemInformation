# System Information Using Perl

Note :- This application can only be run on unix system not on windows or any other system

## Features

- Get information about your system
- Generate pdf automatically
- Get more info option (runs hardinfo command)
- Fast and Easy to understand

## Languages

- perl


## Installation

### You need to install 3 pakages to run this file
- CPAN
- PDF::Create 
- System::Info

### Installing CPAN

```sh
sudo apt-get update -y
```
```sh
sudo apt-get install -y cpanminus
```

>Note :- `If there is some problem while installing the cpan module then run Sudo apt-get install build-essential`


Now install the other two module

PDF Creation Module
```sh
cpanm PDF::Create
```
System Information Module
```sh
cpanm System::Info
```

### Now run the Perl file

```sh
perl SystemInformation.pl
```
