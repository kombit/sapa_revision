@echo off
setlocal enabledelayedexpansion

REM Create the output directory if it doesn't exist
if not exist "output" (
    mkdir "output"
)

REM Loop over subdirectories in documents
for /d %%D in ("documents\*") do (
    set "subdir=%%~nxD"
    set "mdfile="
    set "refdoc="

    REM Find first .md file
    for %%M in ("%%D\*.md") do (
        if not defined mdfile (
            set "mdfile=%%~nxM"
        )
    )

    REM Find first .docx file for reference
    for %%R in ("%%D\*.docx") do (
        if not defined refdoc (
            set "refdoc=%%~nxR"
        )
    )

    REM Convert .md to .docx using pandoc
    if defined mdfile if defined refdoc (
        pushd "%%D"
        echo Converting !mdfile! using !refdoc!
        pandoc ^
            -i "!mdfile!" ^
            -o "..\..\output\!subdir!.docx" ^
            --reference-doc="!refdoc!" ^
            --standalone
        popd
    ) else (
        echo Skipping %%D - missing .md or .docx
    )
)

REM Convert all .docx files in output to .pdf using PowerShell
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$word_app = New-Object -ComObject Word.Application; $word_app.Visible = $false; " ^
    "foreach ($docx in Get-ChildItem -Path 'output' -Filter *.docx) { " ^
    "  $abs_docx_path = $docx.FullName; " ^
    "  $pdf_path = [System.IO.Path]::ChangeExtension($abs_docx_path, 'pdf'); " ^
    "  try { " ^
    "    $document = $word_app.Documents.Open($abs_docx_path); " ^
    "    if ($document -ne $null) { " ^
    "      $document.SaveAs($pdf_path, 17); " ^
    "      $document.Close(); " ^
    "      Write-Host 'Converted:' $pdf_path; " ^
    "    } else { Write-Host 'Failed to open:' $abs_docx_path } " ^
    "  } catch { Write-Host 'Error converting:' $abs_docx_path; Write-Host $_.Exception.Message } " ^
    "} " ^
    "$word_app.Quit()"