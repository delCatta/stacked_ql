web: deploy

deploy:
	flutter build web
	cd build/web && python3 -m http.server 8000
	open http://localhost:8000

clean: 
	flutter clean