
OCAMLMAKEFILE = OCamlMakefile

RESULT = mondrian

MAIN = src/Main.ml

ML_FILES = \
		src/utils/CLIParser.ml \
		src/utils/Option.ml \
		src/model/Base.ml \
		src/model/Bsp.ml \
		src/controller/Interact.ml \
		src/model/Check.ml \
		src/model/Generation.ml \
		src/model/solveur/sat_solver.ml \
		src/view/Exemple_bsp.ml \
		src/view/graphics/SLAC.ml \
		src/view/graphics/component/Background.ml \
		src/view/graphics/component/Button.ml \
		src/view/graphics/component/ButtonColor.ml \
		src/view/graphics/component/Cursor.ml \
		src/view/graphics/component/Popup.ml \
		src/view/graphics/component/Text.ml \
		src/view/graphics/component/FrameBSP.ml \
		src/view/graphics/GMessage.ml \
		src/view/graphics/GraphicsManager.ml \
		src/view/graphics/CampingScene.ml \

LIBS = graphics unix

MLI_FILES = $(ML_FILES:%.ml=%.mli)

SOURCES = $(MLI_FILES) $(ML_FILES) $(MAIN)

.PHONY: all
all: nc

.PHONY: help
help:
	@printf "Useful commands for this Makefile:\\n"
	@printf " - help : prints this message\\n"
	@printf " - mondrian : same as nc\\n"
	@printf " - exec : compiles and runs\\n"
	@printf " - bytecode (bc) : compiles in bytecode\\n"
	@printf " - nativecode (nc) : compiles in nativecode\\n"
	@printf " - cleanup : removes compiled files, keeps executables\\n"
	@printf " - clean : removes all compiled files\\n"
	@printf " - clean-all : removes all generated files (doc includes)\\n"
	@printf " - clean-doc : removes all docs files\\n"
	@printf " - fclean : same as clean-all\\n"
	@printf " - re : cleans all and recompiles\\n"

$(RESULT): nc

.PHONY: exec
exec: $(RESULT)
	./$(RESULT)

.PHONY: fclean
fclean: clean-all

.PHONY: re
re: fclean $(RESULT)

include $(OCAMLMAKEFILE)
