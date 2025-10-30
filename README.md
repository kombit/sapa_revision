# sapa_revision


I dette repository ligger kildekoden til SAPAs Revisionsrapport (Power BI) og tilhørende vejledning.

> [Hent nyeste Revisionsrapport](https://github.com/kombit/sapa_revision/releases/latest/download/zip.zip)

## Releases

I dette afsnit beskrives hvordan en ny release af Revisionsrapporten og tilhørende vejledning udgives.

1. Klon repository

__Ny version af dokument__

1. Installér Microsoft Word og Pandoc
2. Kør `documents.bat` for at danne `.docx` og `.pdf` dokumenter i `/output`

__Ny version af rapport__

1. Åbn `.pbib`
2. Eksportér Power BI skabelon (`.pbit`) til mappen `/output`

__Udgivelse__

1. Opret versions tag under releases i format `2.2.0`
2. Komprimer indhold af `/output` til `zip.zip` og upload til release
3. Udgiv release med release title som matcher versions tag