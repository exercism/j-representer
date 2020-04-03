.PHONY : build-image run-example clean cleaner

IMAGE:= exercism/j-representer
INDIR:= /opt/representer/test/nc-pass/
OUTDIR:= /opt/representer/
SLUG:= nucleotide-count

build-image :
	docker build -t $(IMAGE) .

run-example : clean build-image
	docker run -it $(IMAGE) ./bin/run.sh $(SLUG) $(INDIR) $(OUTDIR)

clean :
	find . -name "*~" -exec rm {} \;

cleaner : clean
	docker image rm --force $(IMAGE)
