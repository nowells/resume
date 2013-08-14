.PHONY: help markdown docx pdf

default:
	make markdown docx html

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  markdown   to make standalone Markdown file"
	@echo "  pdf 		to make standalone PDF file"
	@echo "  docx 		to make standalone Word Document file"
	@echo "  html 		to make HTML file"

markdown:
	pandoc -f html -t markdown_github -o README.md index.html
	@echo
	@echo "Build finished. The Markdown resume is at resume.md"

pdf:
	pandoc -f html -t pdf -o resume.pdf index.html
	@echo
	@echo "Build finished. The PDF resume is at resume.pdf"

docx:
	pandoc -f html -t docx -o resume.docx index.html
	@echo
	@echo "Build finished. The Word Document resume is at resume.docx"
