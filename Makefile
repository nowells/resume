.PHONY: help markdown docx pdf

default:
	make markdown docx

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  markdown   to make standalone Markdown file"
	@echo "  pdf 		to make standalone PDF file"
	@echo "  docx 		to make standalone Word Document file"

markdown:
	pandoc -f html -t gfm -o README.md resume.html
	pandoc -f html -t gfm -o resume.md resume.html
	@echo
	@echo "Build finished. The Markdown resume is at resume.md"

pdf:
	pandoc -f html -t pdf -o resume.pdf resume.html
	@echo
	@echo "Build finished. The PDF resume is at resume.pdf"

docx:
	pandoc -f html -t docx -o resume.docx resume.html
	@echo
	@echo "Build finished. The Word Document resume is at resume.docx"
