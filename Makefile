CWD=$(shell pwd)

# https://github.com/whosonfirst/go-whosonfirst-exportify#wof-as-featurecollection
AS_FEATURECOLLECTION=$(shell which wof-as-featurecollection)

level0:
	@make current LEVEL=0

level1:
	@make current LEVEL=1

level2:
	@make current LEVEL=2

level3:
	@make current LEVEL=3

level4:
	@make current LEVEL=4

current:
	mkdir -p work
	$(AS_FEATURECOLLECTION) -iterator-uri 'repo://?include=properties.mz:is_current=1&include=properties.sfo:level=$(LEVEL)' $(CWD) > work/publicart-level$(LEVEL).geojson

scrub:
	find . -type f -name '*~' | xargs rm
