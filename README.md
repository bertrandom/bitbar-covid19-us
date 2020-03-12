# bitbar-covid19-us
BitBar plugin to show Coronavirus COVID-19 cases in the U.S. in your menubar, refreshes once an hour

## Screenshot

![screenshot](/screenshot.png)

## Installation

Install [BitBar](https://github.com/matryer/bitbar)

Install [xsv](https://github.com/BurntSushi/xsv)

```
brew install xsv
```

Clone the COVID-19 Case data somewhere, e.g.

```
cd ~/code
git clone git@github.com:CSSEGISandData/COVID-19.git
```

Copy `covid19.1h.sh` to your BitBar plugins directory

Change the `COVID_DATA_DIR` at the top of `covid19.1h.sh` to point to the COVID-19 data directory, e.g.
`COVID_DATA_DIR="/Users/bert/code/COVID-19/"`