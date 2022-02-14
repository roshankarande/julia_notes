## Init

```powershell
git clone https://github.com/chipzoller/hugo-clarity.git roshankarande.github.io
cd roshankarande.github.io/exampleSite
hugo mod init roshankarande.github.io
cd ..
Copy-Item -Force -Recurse exampleSite/* .

#  Open config->config.toml file, replace theme = "hugo-clarity" with theme = "github.com/chipzoller/hugo-clarit
```

## Run

```powershell
hugo server
```