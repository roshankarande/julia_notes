Multiple cusors -> Cntrl + Alt + Arrow Up,Down        OR Alt + Click

Cntrl + left arrow to go a word beginning .. right to go at right
Cntrl + Shift + Left arrow to select a word left .. right to select a word right
shift + left to select a letter to left

cntrl + backspace =  to delete the entire word

cntrl + ` = switch between terminal and editor

Cntrl + Tab = To switch to previous tab

Cntrl + P = search for a particular file or folder

Select one word by placing your cursor at one end of the word. Hold down the "Ctrl" key and the "Shift"
key. Press the right arrow key to select the word to the right, or press the left arrow key to select the word
to the left.

Select one character at a time by holding down the "Shift" key and and using either arrow key (right or
left). Select an entire line of text by holding down the "Shift" key and pressing "End", if you are at the
beginning of the line, or "Home" if you are at the end of the line.

## Julia

Cntrl + Enter -> Execute selection or current line in REPL
Cntrl + Shift + R -> Execute File in Repl


## GIT

```julia
git log --reverse --oneline
```

## Terminal

https://www.hanselman.com/blog/how-to-make-a-pretty-prompt-in-windows-terminal-with-powerline-nerd-fonts-cascadia-code-wsl-and-ohmyposh  ---->
https://www.youtube.com/watch?v=lu__oGZVT98

## Add Julia to wsl

```julia
# Download julia and then 
# extract it using
tar -xvzf julia-1.7.1-linux-x86_64.tar.gz
sudo mv julia-1.7.1/ /opt/
sudo ln -s /opt/julia-1.7.1/bin/julia /usr/local/bin/julia

```


## WSL optimization
```
notepad "$env:USERPROFILE\.wslconfig"
Step Three:
This is the most important step in this project, so please follow carefully

The following parameters define their corresponding resources:

CPU = > cores dedicated to WSL
Memory = > RAM allocated to WSL
AutoMount = > Mount your default NTFS drive to your subsystem
Boot => defines your booting options for services
Kernel = > Custom kernel for linux
LocalhostForwarding = > for port-forwarding your applications running on localhost
```

cd /mnt/c/Users/heyia/Desktop/julia/project/1/code/data/compare