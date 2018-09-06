function far() {
  ag -0 -l $1 | xargs -0 perl -pi'' -e "s/$1/$2/g"
}

far "$1" "$2"
