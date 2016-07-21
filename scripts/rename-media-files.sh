rename -vf 's/ /_/g' *.*
rename -vf 's/-/_/g' *.*
rename -v 's/_-_/-/g' *.*
rename -vf 's/ +/ /g' *.*
rename -vf 's/_+/_/g' *.*
rename -vf 's/-+/-/g' *.*
rename -vf 'y/A-Z/a-z/' *.*
rename -v 's/\(//g' *.*
rename -v 's/\)//g' *.*
rename -v 's/(kidz_bop)-(.+)\.(.+)/$2-$1\.$3/' *.*
