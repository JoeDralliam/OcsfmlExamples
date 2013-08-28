OCAMLBUILD=ocamlbuild -use-ocamlfind
OCAMLBUILD_DIR=$(shell ocamlbuild -where)

all:byte native

clean:
	$(OCAMLBUILD) -clean

byte:
	$(OCAMLBUILD) -lflag -custom Examples/clock.byte
	$(OCAMLBUILD) -lflag -custom Examples/pong.byte
	$(OCAMLBUILD) -lflag -custom Examples/shader.byte
	$(OCAMLBUILD) -lflag -custom Examples/sockets.byte
	$(OCAMLBUILD) -lflag -custom Examples/audio.byte
	$(OCAMLBUILD) -lflag -custom Examples/graphicClock.byte

native:
	$(OCAMLBUILD) Examples/clock.native
	$(OCAMLBUILD) Examples/pong.native
	$(OCAMLBUILD) Examples/shader.native 
	$(OCAMLBUILD) Examples/sockets.native 
	$(OCAMLBUILD) Examples/audio.native 
	$(OCAMLBUILD) Examples/graphicClock.native
