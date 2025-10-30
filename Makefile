CWD=$(shell pwd)

# https://github.com/whosonfirst/wof-cli
WOF_CLI=$(shell which wof)

current:
	mkdir -p work
	$(WOF_CLI) emit \
		-iterator-uri 'repo://?include=properties.mz:is_current=1' \
		-writer-uri 'featurecollection://?writer=stdout://' \
		$(CWD) > work/publicart-latest.geojson

scrub:
	find . -type f -name '*~' | xargs rm
	find data -type d -empty -delete
