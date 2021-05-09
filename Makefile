
main:
	make clean
	make build_curl
	make build_c
	make run

build_curl:
	@# formerly the API was at 'http://api.corpora.uni-leipzig.de/ws/cooccurrences/deu_news_2012_1M/cooccurrences/Schnitzel?limit=10'
	mkdir -p ./build/
	curl -X GET "https://api.wortschatz-leipzig.de/ws/cooccurrences/deu_news_2012_1M/cooccurrences/Schnitzel?limit=10" -H "accept: application/json" --libcurl ./build/abc.c

build_c:
	mkdir -p ./build/
	gcc ./build/abc.c -lcurl -o ./build/curl_binary

run:
	./build/curl_binary | python3 ./src/show.py 

clean:
	rm -rf ./build/

# in case the C compiler cannot find libcurl.
install:
	sudo apt-get install libcurl4-openssl-dev

