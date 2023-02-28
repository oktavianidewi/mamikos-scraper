# Readme

1. Install Google Chrome Binary

```
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
# Update our system
sudo apt-get -y update
# Install Chrome
sudo apt-get -y install google-chrome-stable

```
2. Afterwards, you need to install Chromedriver. Chromedriver version must be lower than Google Chrome binary version.

```
CHROMEDRIVER_VERSION=108.0.5359.71
wget -N https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip -P ~/
unzip ~/chromedriver_linux64.zip -d ~/
# Remove zip file
rm ~/chromedriver_linux64.zip
# Move driver to bin location
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
# Give it rights
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver
```

3. Therefore we have to specify the parent url to run the webscraper and the output file (csv). 

```
python3 etl/question3.py --url="https://mamikos.com/kost-promo-ngebut/semua%20kota?from=home%20discount" --csv="data-args.csv"

```

The scraper runs in non-headless version, so there will be an automate chrome pops out during the scraping time.

Next iteration will improve it to run in the background and wrapped everything with docker, if I have more time to explore.