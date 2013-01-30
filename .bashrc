function tabname {
  printf "\e]1;$1\a"
}
 
if [ x`type -t cd` == "xfunction" ]; then
  # previously wrapped cd
  eval $(type cd | grep -v 'cd is a function' | sed 's/^cd/original_cd/' | sed 's/^}/;}/' )
else
  # builtin
  eval "original_cd() { builtin cd \$*; }"
fi
 
cd() {
  original_cd "$*"
  tabname $(basename $(pwd))
}