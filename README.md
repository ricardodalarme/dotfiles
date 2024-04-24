# Dotfiles (customização de aplicativos) pessoal

Costomizações simples do ZShell e TMUX utilizadas na lida diaŕia em abiente linux.

## Instalação

Clonar o repositório e executar o comando abaixo.
```bash
./deploy
```

O script de instação executa os seguintes passos pra você:

1. Testa a disponibilidade dos seguintes aplicativos
   - zsh
   - tmux
   - xcopy (usado para transferir conteúdos copiados para a área de transfereência do ambiente gráfico)
2. Instala o que estiver pendente utilizando o gerenciador de pacotes disponível;
3. Confirma se o zsh é seu aplicativo de shell padrão e define isso pra vc;
4. Faz cópias de backup dos arquivos que estão presentes e serão substituídos no processo de instalação.

# Sumário das principais definições

## Estrutura de funcionamento

Os _dotfiles_ padrão (`.zshrc`, etc) carregam as definições de dentro do repositório, Assim as mudaças são incorporadas e sincronizadas em todas as máquinas que utilizam este esquema.

No lançamento de uma nova shell, a primeira coisa executada é o `zshrc_manager.sh`. Assim que inicia, ele atualiza o diretório dotfiles e carrega as customizações.

## [Zsh](https://en.wikipedia.org/wiki/Z_shell)

* `cd` foi redefinido para `cd` + `ls`. Sempre que você entra em um dado diretório, o conteúdo daquele diretório é listado,

### Prompt 

A linha de prompt, de tendência minimalista e discretamente colorida, segue a estrutura:

```
[plugin, plugin, ...]: 
```

Cada plugion considera sua localização e o que você está fazendo. 
Each plugin is sensitive to where you are and what you're doing, they reveal themselves when it's contextually relevant. Plugins include:

* `hostname`: sempre presente, o nome da máquina em que o shell está rodando;
* `PWD plugin`: sempre presente, apresenta sua localização no sistema de arquivos;
* `Status code plugin`: aparece sempre que um programa retorna um resultado diferente de zero e apresenta o valor numérico retornado;
* `Git plugin`: aparece quando você está em um repositório git. Apresenta o nome do branch e quantos arquivos sofreram modificação;
* `Sudo plugin`: aparece quando vc pode executar comando de superusuário sem necessitar autenticar;
* `Time plugin`: aparece quando um programa leva mais de 1s para concluir. Apresenta quanto tempo levou;
* `PID plugin`: aparece quando vc manda uma tarefa para segundo plano e apresenta o PID desta tarefa.

### Combinações de tecla
| Atalho     | O que faz |
|------------|-----------|
| Ctrl-A*    | Vai para o início da linha |
| Ctrl-G     | Executa ``git add -A; git commit -v && git push`` |
| Ctrl-H     | Executa ``cd ~/`` |
| Ctrl-K*    | Apaga desde o cursor até o final da linha (copia conteúdo em buffer) |
| Ctrl-L     | Executa ``ls``. |
| Ctrl-O     | Equivalente à tecla ``Enter``. |
| Ctrl-S     | Adiciona ``sudo`` ap início da linha. |
| Ctrl-Y*    | Cola o conteúdo do buffer imediatamente antes do cursor. |
_*: conforme ocorre no bash_

### Plugins

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Searches your history while you type and provides suggestions.
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/ad522a091429ba180c930f84b2a023b40de4dbcc): Provides fish style syntax highlighting for zsh.
* [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3): Borrowed things like tab completion, fixing ls, tmux's vi-mode plugin.

## [Tmux](https://en.wikipedia.org/wiki/Tmux)

* Ctrl-B has been remapped to the backtick character (&#96;). If you want to type the actual backtick character (&#96;) itself, just hit the key twice.
* `%` has been remapped to `v`.
* Copy buffer is coppied to xclip.
* Status bar tells you date, time, user, and hostname. Especially useful with nested ssh sessions. 
