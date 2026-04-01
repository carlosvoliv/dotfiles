# ==============================================================================
# 🌿 GIT SHORTCUTS
# ==============================================================================

# Status e visualização
abbr -a gs 'git status'
abbr -a gss 'git status -sb' # status curto
abbr -a gl 'git log --oneline --graph --decorate --all'
abbr -a gd 'git diff'
abbr -a gds 'git diff --staged' # diff do staged

# Add e commit
abbr -a ga 'git add'
abbr -a gaa 'git add .'
abbr -a gc 'git commit'
abbr -a gcm 'git commit -m'
abbr -a gca 'git commit --amend'

# Push e pull
abbr -a gp 'git push'
abbr -a gpl 'git pull'
abbr -a gpf 'git push --force-with-lease'

# Branch
abbr -a gb 'git branch'
abbr -a gba 'git branch -a' # lista todas (inclusive remotas)
abbr -a gbd 'git branch -d'
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b' # cria e troca

# Stash
abbr -a gst 'git stash'
abbr -a gsp 'git stash pop'
abbr -a gsl 'git stash list'

# Reset
abbr -a grh 'git reset --hard'
abbr -a grs 'git reset --soft HEAD~1'

# LazyGit (se tiver instalado)
abbr -a lg lazygit
