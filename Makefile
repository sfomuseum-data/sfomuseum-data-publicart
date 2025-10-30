CWD=$(shell pwd)

# https://github.com/whosonfirst/go-whosonfirst-exportify#wof-as-featurecollection
AS_FEATURECOLLECTION=$(shell which wof-as-featurecollection)

current:
	mkdir -p work
	$(AS_FEATURECOLLECTION) \
		-iterator-uri 'repo://?include=properties.mz:is_current=1' \
		$(CWD) > work/publicart.geojson

scrub:
	find . -type f -name '*~' | xargs rm
	find data -type d -empty -delete
