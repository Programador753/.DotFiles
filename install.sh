#!/usr/bin/env bash
sudo apt update

# Instalar GitHub CLI (gh) y github-copilot-cli
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Instalar la extensión github-copilot-cli
gh extension install github/copilot-cli || echo "Error: github-copilot-cli no pudo ser instalado"

# Instalar fzf
if ! command -v fzf &> /dev/null; then
    echo "Instalando fzf..."
    sudo apt install fzf -y
    echo 'export FZF_BASE=/usr/share/fzf' >> ~/.zshrc
else
    echo "fzf ya está instalado"
fi

# Crear archivo .aliases si no existe
if [ ! -f "$HOME/.aliases" ]; then
    echo "Creando archivo .aliases..."
    touch $HOME/.aliases
else
    echo "El archivo .aliases ya existe"
fi

# Instalar thefuck
if ! command -v thefuck &> /dev/null; then
    echo "Instalando thefuck..."
    sudo apt install thefuck -y
else
    echo "thefuck ya está instalado"
fi

# Instalar zoxide
if ! command -v zoxide &> /dev/null; then
    echo "Instalando zoxide..."
    sudo apt install zoxide -y
else
    echo "zoxide ya está instalado"
fi

# Instalar nvm
if ! command -v nvm &> /dev/null; then
    echo "Instalando nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
else
    echo "nvm ya está instalado"
fi

# Instalar bat
if ! command -v bat &> /dev/null; then
    echo "Instalando bat..."
    sudo apt-get install -y bat
else
    echo "bat ya está instalado"
fi

#!/usr/bin/env bash
sudo apt update
# esto seguro que funciona
sudo apt install curl -y
curl https://bootstrap.pypa.io/get-pip.py -o $HOME/get-pip.py  
sudo python3 $HOME/get-pip.py 
pip3 install ansible
pip3 install ansible-base
sudo apt install ansible -y
if [ -z "$CODESPACE_NAME" ]; then 
  ansible-playbook ./Vagrant/localhost-deploy.yml --ask-become-pass
else
  ansible-playbook ./Vagrant/minimal-deploy.yml
fi

