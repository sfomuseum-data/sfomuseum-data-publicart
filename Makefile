CWD=$(shell pwd)

# https://github.com/whosonfirst/go-whosonfirst-exportify#wof-as-featurecollection
AS_FEATURECOLLECTION=$(shell which wof-as-featurecollection)

# Dump current public artworks to a GeoJSON FeatureCollection
current:
	$(AS_FEATURECOLLECTION) -iterator-uri 'repo://?include=properties.mz:is_current=1' $(CWD) > work/publicart.geojson

