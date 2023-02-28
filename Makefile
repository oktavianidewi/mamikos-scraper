install-google-chrome:
	sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add && \
	sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
	sudo apt-get -y update && \
	sudo apt-get -y install google-chrome-stable

install-chrome-binary:
	CHROMEDRIVER_VERSION=108.0.5359.71 && \
	wget -N https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip -P ~/
	unzip ~/chromedriver_linux64.zip -d ~/
	rm ~/chromedriver_linux64.zip
	sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
	sudo chown root:root /usr/local/bin/chromedriver
	sudo chmod 0755 /usr/local/bin/chromedriver

start-scraping: 
	python3 scraper.py --url="https://mamikos.com/kost-promo-ngebut/semua%20kota?from=home%20discount" --csv="data-args.csv"