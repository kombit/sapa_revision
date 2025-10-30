# sapa_revision


I dette repository ligger kildekoden til SAPAs Revisionsrapport (Power BI) og tilhørende vejledning.

> [Hent nyeste Revisionsrapport (Power BI)](https://github.com/kombit/sapa_revision/releases/latest/download/Revisionsrapport.pbit)

> [Hent nyeste Vejledning til Revisionsrapport (PDF)](https://github.com/kombit/sapa_revision/releases/latest/download/Vejledning%20til%20Revisionsrapport.pdf)

> [Hent nyeste Vejledning til Revisionsrapport (Microsoft Word)](https://github.com/kombit/sapa_revision/releases/latest/download/Vejledning%20til%20Revisionsrapport.docx)

## Releases

I dette afsnit beskrives hvordan en ny release af Revisionsrapporten og tilhørende vejledning udgives.

1. Klon repository

__Ny version af rapport__

1. Åbn .pbib
2. Eksportér fra Power BI til `.pbit`

__Ny version af dokument__

1. Installér Microsoft Word og Pandoc
2. Kør `documents.bat` for at danne `.docx` og `.pdf` dokumenter

__Udgivelse__

1. Opret versions tag under releases
2. Upload `.pbit`, `.docx` og `.pdf`
3. Udgiv release med versions tag