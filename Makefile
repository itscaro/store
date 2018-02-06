.PHONY: build
build:
	go run app.go store.json
	go run app.go store-armhf.json
	go run app.go store-arm64.json

.PHONY: generate-md
generate-md:
	git config --global user.email "ci@openfaas.com"
  	git config --global user.name "CI"
	git checkout -b gh-pages
	git add *.md
	git commit --message "Update MD files: Travis Build ${TRAVIS_BUILD_NUMBER}"
	git remote add origin https://${GITHUB_TOKEN}@github.com/itcaro/store.git
	git push --quiet --set-upstream origin gh-pages
