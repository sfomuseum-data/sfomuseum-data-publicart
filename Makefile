CWD=$(shell pwd)

# https://github.com/whosonfirst/wof-cli
WOF_CLI=$(shell which wof)

# https://github.com/sfomuseum/go-geojson-show
SHOW=$(shell which show)

current:
	mkdir -p work
	$(WOF_CLI) emit \
		-iterator-uri 'repo://?include=properties.mz:is_current=1' \
		-writer-uri 'featurecollection://?writer=stdout://' \
		$(CWD) > work/publicart-latest.geojson

all:
	mkdir -p work
	$(WOF_CLI) emit \
		-iterator-uri 'repo://' \
		-writer-uri 'featurecollection://?writer=stdout://' \
		$(CWD) > work/publicart-all.geojson

show:
	$(SHOW) \
		-point-style '{"color":"red","custom":{"color_map":{"key":{"-1":{"color":"#ccc","opacity":1},"0":{"color":"#000","opacity":1},"1":{"color":"white","opacity":1}},"property":"mz:is_current"},"fill_map":{"key":{"1":{"color":"orange","opacity":0.5},"2":{"color":"blue","opacity":0.5},"3":{"color":"green","opacity":0.5}},"property":"sfo:level"},"x_pane_map":{"key":{"*":"not_current","1":"is_current"},"property":"mz:is_current"}},"fillColor":"orange","radius":10}' \
		-label wof:name \
		-label sfo:level \
		-label mz:is_current \
		-label edtf:inception \
		-label edtf:cessation \
		-pane is_current=1000 \
		-pane not_current=500 \
		$(DATA)

scrub:
	find . -type f -name '*~' | xargs rm
	find data -type d -empty -delete
