.PHONY: generate-api-client
openapi.json:
	curl http://localhost:8000/main_server/api/v1/openapi.json > openapi.json

generate: openapi.json
	docker run --rm -v "$(shell pwd):/local" -w /local openapitools/openapi-generator-cli generate \
	    -i openapi.json \
	    -g ruby \
	    -p gemAuthor=bmlt-enabled \
	    -p gemAuthorEmail=admin@bmlt.app \
	    -p gemDescription="BMLT Admin API Client" \
	    -p gemHomepage="https://bmlt.app" \
	    -p gemLicense=MIT \
	    -p gemName=BmltClient \
	    -p moduleName=BmltClient \
	    -p gemVersion=1.0.1 \
		--git-repo-id=bmlt-root-server-ruby-client \
		--git-user-id=bmlt-enabled \
	    -o .

clean:
	rm -f openapi.json
