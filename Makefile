OTT_FILES = orig_syn.ott
OTT_TEX   = orig.tex
OTT_OPTS  = -tex_show_meta false
TARGET    = orig-full

$(TARGET).pdf: $(TARGET).tex $(OTT_TEX)
	latexmk -pdf $<

$(TARGET).tex: $(TARGET).mng $(OTT_FILES)
	ott $(OTT_OPTS) -tex_filter $< $@ $(OTT_FILES)

$(OTT_TEX): $(OTT_FILES)
	ott -tex_wrap false $(OTT_OPTS) -o $@ $^

.PHONY: clean
clean:
	rm -f $(TARGET).pdf $(TARGET).tex $(OTT_TEX) *.aux *.fdb_latexmk *.log
