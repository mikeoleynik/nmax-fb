[![Build Status](https://travis-ci.org/mikeoleynik/nmax-fb.svg?branch=master)](https://travis-ci.org/mikeoleynik/nmax-fb)

## Nmax

Библиотека, которая находит n самых больших целых чисел, встретившихся в полученных текстовых данных.

### Установка
```
git clone git@github.com:mikeoleynik/nmax-fb.git
cd nmax-fb
bundle install
gem build nmax.gemspec
gem install nmax-0.1.0.gem
```

### Usage
`cat /path/to/text/file.txt | nmax 5`