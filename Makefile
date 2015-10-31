OCAMLBUILD=ocamlbuild -use-ocamlfind
OCAMLBUILD_DIR=$(shell ocamlbuild -where)
PREFIX=/usr/local/share

all:byte native

clean:
	$(OCAMLBUILD) -clean

byte:
	$(OCAMLBUILD) Examples/clock.byte
	$(OCAMLBUILD) Examples/pong.byte
	$(OCAMLBUILD) Examples/shader.byte
	$(OCAMLBUILD) Examples/sockets.byte
	$(OCAMLBUILD) Examples/audio.byte
	$(OCAMLBUILD) Examples/graphicClock.byte
	$(OCAMLBUILD) Examples/sound_capture.byte

native:
	$(OCAMLBUILD) Examples/clock.native
	$(OCAMLBUILD) Examples/pong.native
	$(OCAMLBUILD) Examples/shader.native 
	$(OCAMLBUILD) Examples/sockets.native 
	$(OCAMLBUILD) Examples/audio.native 
	$(OCAMLBUILD) Examples/graphicClock.native
	$(OCAMLBUILD) Examples/sound_capture.native

install:
	mkdir -p ${PREFIX}/Ocsfml/Examples && \
  cp _build/Examples/*.native ${PREFIX}/Ocsfml/Examples && \
	cp _build/Examples/*.byte ${PREFIX}/Ocsfml/Examples && \
	cp -R resources ${PREFIX}/Ocsfml/Examples/resources
uninstall:
	rm -R ${PREFIX}/Ocsfml
