# ESS Report template
Most of what you need to start writing a report with ESS branding.
You should also have a copy of the ESS class, and style files, plus a working LaTeX distribution, make, and Snakemake.

Provide content into `report.tex` (or don't!) then build a PDF report with

```bash
make
```

### Warning:
The make process will configure your cloned git repository to use the hook scripts located in `.githooks`.
You should ensure that the file or files present there only perform tasks which you approve *before*
running `make` for the first time or making any changes with `git`.

### Note:
If you decide to rename the main TeX file from `report.tex` you must also update the variable
`REPORT` in the `Snakemake` file.
