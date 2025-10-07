#!/usr/bin/env bash

cat <<'EOF'

Try out `vt`!

1) Run "vt create test$RANDOM" to create a new val
2) cd into the directory, e.g. cd testXXXX
3) Go to the new val! Run "vt browse --no-browser", copy the URL, visit the website
4) Open vim, and add a main.http.ts with:
   export default () => new Response("Hi!") 
5) Run "vt push"
6) Tada!

EOF

echo "(The API key here is for a dummy Val Town account!)"

export PATH="/home/appuser/.deno/bin:$PATH" 
vt --help

echo -n "vt create test$(shuf -i 1000-9999 -n 1)"
bash
