from glob import glob
TEX_FILE = glob('*.tex')
REPORT = 'report'
ARTIFACT = f"{REPORT}.pdf"

rule all:
  input: ARTIFACT

rule enable_git_hooks:
  params: "generated"
  input: "{params}/checkpoint"
  output: touch("{params}/commit.check") 
  shell: "git config --local include.path ../.gitconfig"

rule make_generated:
  output: touch("generated/checkpoint")
  params: "generated"
  run: "from pathlib import Path; Path('{params}').mkdir()"

rule latex:
    input:
        "generated/revision.tex",
        texfiles=TEX_FILE
    output: ARTIFACT
    shell: f"latexmk -lualatex -shell-escape {REPORT}"

rule revision:
  params: "generated"
  input:
      "{params}/checkpoint",
      "{params}/commit.check",
      texfiles=TEX_FILE
  output: "{params}/revision.tex"
  script: "scripts/revision.py"

rule clean:
  input:
    "generated/revision.tex",
  shell:
    "rm {input}"

