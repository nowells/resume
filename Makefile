.PHONY: help markdown docx pdf txt

default:
	make markdown docx pdf txt git

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  markdown   to make standalone Markdown file"
	@echo "  pdf 		to make standalone PDF file"
	@echo "  docx 		to make standalone Word Document file"
	@echo "  txt 		to make standalone TXT file"

markdown:
	pandoc -f html -t markdown_github -o README.md index.html
	@echo
	@echo "Build finished. The Markdown resume is at resume.md"

pdf:
	./bin/pdf.js
	@echo
	@echo "Build finished. The PDF resume is at resume.pdf"

docx:
	pandoc -f html -t docx -o resume.docx index.html
	@echo
	@echo "Build finished. The Word Document resume is at resume.docx"

txt:
	pandoc -f html -t markdown_github -o resume.txt index.html
	@echo
	@echo "Build finished. The TXT resume is at resume.docx"

git:
	git add resume.* README.md
