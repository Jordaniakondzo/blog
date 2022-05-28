REPORT: to pdf: pandoc --filter pandoc-crossref --number-sections file.md -o report.pdf
	to docx: pandoc --filter pandoc-crossref  Report.md -o Report.docx 
Presentation: to pdf: pandoc --filter pandoc-crossref --pdf-engine=lualatex -t beamer --slide-level=2 --number-sections  Presentation.md -o Res.pdf 
	      to docx: pandoc --filter pandoc-crossref file.md -o file.docx
