# Manual de Usuario para el Repositorio .DotFiles

Este manual está diseñado para los usuarios que instalen y utilicen los archivos de configuración del repositorio `.DotFiles`. Aquí encontrarás instrucciones detalladas para la instalación, configuración y uso de cada herramienta incluida.

---

## 1. ¿Qué son los Dotfiles?

Los "dotfiles" son archivos de configuración que empiezan con un punto (`.`) y están ubicados en el directorio de usuario (`~`). Son utilizados por varias aplicaciones para guardar preferencias y configuraciones personalizadas.

Este repositorio proporciona configuraciones optimizadas para mejorar la experiencia de usuario en la terminal y en herramientas de desarrollo como:

- **Bash** (`.bashrc`)
- **Zsh** (`.zshrc`)
- **Vim** (`.vimrc`)
- **Neovim** (`.config/nvim/init.vim`)
- **tmux** (`.tmux.conf`)
- **Git** (`.gitconfig`)
- **Alacritty** (`.alacritty.yml`)
- **Scripts personalizados** (`scripts/`)
- **Instalador automático** (`install.sh`)
- **Configuraciones específicas para herramientas como fzf, ranger, bat, exa, y lazygit**
- **Configuración para la terminal Fish (**``**)**
- **GitHub Copilot CLI**

El objetivo es facilitar y optimizar el flujo de trabajo en la terminal.

---

## 2. Instalación

### 2.1 Clonar el repositorio

Para instalar estos dotfiles en su sistema, abra la terminal y ejecute:

```bash
cd ~  # Navegar al directorio de usuario
git clone https://github.com/Programador753/.DotFiles.git ~/.dotfiles
```

### 2.2 Crear enlaces simbólicos

Para aplicar las configuraciones sin mover los archivos manualmente, ejecute:

```bash
cd ~/.dotfiles
./install.sh
```

Este script creará enlaces simbólicos (`ln -s`) que apuntarán a los archivos dentro del repositorio, permitiendo modificaciones sin necesidad de copiarlos manualmente.

### 2.3 Recargar la configuración

Después de la instalación, recargue la configuración ejecutando:

```bash
source ~/.bashrc
source ~/.zshrc
source ~/.config/fish/config.fish
```

Para otras herramientas como Vim, Git, tmux, Neovim y Zsh, reinicie la sesión de la terminal o cierre y vuelva a abrir las aplicaciones.

---

## 3. Uso de las Herramientas Configuradas

### 3.1 **GitHub Copilot CLI**

GitHub Copilot CLI permite generar y modificar código utilizando IA directamente desde la terminal.

#### Instalación:

Si no está instalado, puede instalarlo con:

```bash
npm install -g @githubnext/github-copilot-cli
```

#### Configuración:

Para configurar Copilot CLI, ejecute:

```bash
gh auth login
```

Asegúrese de iniciar sesión con su cuenta de GitHub.

#### Comandos principales:

- `??` → Explicación de un comando.
- `gh copilot suggest "Crear un script en Bash para hacer copias de seguridad"`
- `gh copilot explain "ls -lah"` → Explica el comando.
- `gh copilot autocomplete` → Completa comandos en la terminal.

### 3.2 **Bash (**``**)**

Incluye:

- Alias útiles (accesos rápidos a comandos comunes)
- Variables de entorno
- Personalización del prompt con colores y formato mejorado

#### Alias incluidos:

```bash
alias ll='ls -la'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias v='nvim'
alias lg='lazygit'
alias lt='ls --tree'
```

Para modificar los alias, edite `.bashrc` con:

```bash
nano ~/.bashrc
```

Después de modificarlo, aplique los cambios con:

```bash
source ~/.bashrc
```

### 3.3 **Zsh (**``**)**

Si usa Zsh en lugar de Bash, este archivo contiene:

- Alias
- Temas y plugins (Oh-My-Zsh, powerlevel10k)
- Configuración avanzada de autocompletado

#### Plugins incluidos en Zsh:

- `zsh-autosuggestions`: Autocompletado inteligente basado en historial.
- `zsh-syntax-highlighting`: Resaltado de sintaxis en la terminal.

Para aplicar cambios, ejecute:

```bash
source ~/.zshrc
```

### 3.4 **Fish (**``**)**

Fish es una shell alternativa con autocompletado avanzado.

Ejecutar Fish:

```bash
fish
```

Alias personalizados en Fish:

```bash
alias ll 'exa -lah'
alias gs 'git status'
```

### 3.5 **Vim y Neovim (**``** y **``**)**

Optimiza Vim y Neovim con:

- Resaltado de sintaxis
- Numeración de líneas
- Plugins gestionados con `vim-plug`
- Configuración de atajos de teclado

### 3.6 **tmux (**``**)**

Optimiza tmux para gestionar múltiples sesiones en la terminal.

#### Atajos de teclado en tmux:

- `Ctrl + b, "` → División horizontal
- `Ctrl + b, %` → División vertical
- `Ctrl + b, n` → Siguiente ventana
- `Ctrl + b, p` → Ventana anterior
- `Ctrl + b, d` → Desacoplar sesión

Para aplicar cambios en la configuración, ejecute:

```bash
tmux source-file ~/.tmux.conf
```

---

