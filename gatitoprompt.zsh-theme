# ~/.oh-my-zsh/themes/gatitoprompt.zsh-theme

# Función para detectar rama Git + emoji
function __git_branch_info() {
  local branch=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [[ -n "$branch" ]]; then
    local icon=""
    case "$branch" in
      main) icon="🌿 😺" ;;
      develop) icon="🌱 😸" ;;
      feature/*) icon="🪴 😺" ;;
      hotfix/*) icon="🍂 😿" ;;
      bugfix/*) icon="🐞 🙀" ;;
      *) icon="🌿 🐱" ;;
    esac
    echo "$icon ${branch}"
  fi
}

# Función para detectar lenguaje + versión
function __language_info() {
  if [[ -f "pom.xml" ]]; then
    echo "☕ $(java -version 2>&1 | head -n 1 | cut -d'"' -f2)"
  elif [[ -f "package.json" ]]; then
    echo "📜 v$(node -v 2>/dev/null)"
  elif [[ -f "tsconfig.json" ]]; then
    echo "🔷 v$(node -v 2>/dev/null)"
  elif [[ -f "requirements.txt" || -f *.py ]]; then
    echo "🐍 v$(python3 --version 2>&1 | cut -d' ' -f2)"
  fi
}

# Prompt principal
PROMPT='$(echo "\n%F{250}%~%f $(__git_branch_info) $(__language_info)\n🐈 ")'

# Sin RPrompt
RPROMPT=''
