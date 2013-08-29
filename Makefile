OCAMLBUILD=ocamlbuild -use-ocamlfind
OCAMLBUILD_DIR=$(shell ocamlbuild -where)

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

native:
	$(OCAMLBUILD) Examples/clock.native
	$(OCAMLBUILD) Examples/pong.native
	$(OCAMLBUILD) Examples/shader.native 
	$(OCAMLBUILD) Examples/sockets.native 
	$(OCAMLBUILD) Examples/audio.native 
	$(OCAMLBUILD) Examples/graphicClock.native
