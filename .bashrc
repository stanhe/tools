if [ -n "$INSIDE_EMACS" ]; then
    export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
fi
#echo "$(date +"%Y-%m-%d %T %N") Init .bashrc start! "
alias function='func(){
#================= alias function start =====================
gitCreatePreStatus(){
	sPath=$PWD/.git/hooks
	if [[ -e "$sPath" && ! -e "$sPath/pre-status.sh" ]]
	then
	echo "#!/bin/bash" > $sPath/pre-status.sh;
	echo "Create pre-status in .git/hooks";
	fi
};
# add git command pre-status
git(){ 
       gPath=$PWD/.git/hooks/pre-status.sh
       if [[ $# -ge 1 && "$1" == "status" && -e "$gPath" ]]
       then
       command . $gPath
       fi
       command git "$@";
};
my_test(){ 
	echo "my test";
};
test1(){
	echo "test1";
};
# checkout new branch for current and submodules.
checkoutSub(){
	echo "Create $1 ...";
	gck -b $1 && gsf gck -b $1;
	echo "===end===";
};
# delete current and submodules branch.
deleteBranch(){
	echo "Delete $1 ...";
	gb -d $1 && gsf gb -d $1;
	echo "===end===";
}; 
# checkout current and submodules to master
checkoutMaster(){
	echo "Checkout all modules to master...";
	gckm && gsf gckm;
	echo "===end===";
};

#================= alias function  end  =====================
};func'

#================= custom alias =====================
alias q='exit'
alias test='my_test'
alias t1='test1'
alias la='ls -lsah'
alias gaa='git add .'
alias gii='git init'
alias gst='git status'
alias gsh='git stash'
alias gd='git diff'
alias gb='git branch'
alias gbs='gb && gsf gb'
alias gdc='git diff --cached'
alias gp='git push'
alias gf='git pull'
alias gcmsg='git commit -m'
alias gcps='gitCreatePreStatus'
alias gl='git lg'
alias gck='git checkout'
alias gckm='git checkout master'
alias gcks='checkoutSub'
alias gbds='deleteBranch'
alias gcksm='checkoutMaster'
#alias gcksm='gckm && gsf gckm'
alias gsf='git submodule foreach '
alias gsu='git submodule update '
alias gff='gf && gsf gf'
alias gci='git commit' 
alias grh='git reset --hard ' 
alias ggrep='git grep -n ' 
alias p2m='adb push ./log mnt/sdcard/log && adb push ./db_kt.sqlite mnt/sdcard/ktsmart/db/db_kt.sqlite'
alias dfm='adb shell rm mnt/sdcard/log && adb shell rm -rf mnt/sdcard/ktsmart/db'
alias adbi='adb shell input text' # action input
alias adbh='adb shell input keyevent 3' # action home
alias adbb='adb shell input keyevent 4' # action back
alias adbn='adb shell input keyevent 61' # action next
alias adbe='adb shell input keyevent 66' # action enter
alias adbd='adb shell input keyevent 67' # action delete
alias adbwd='adb shell svc wifi disable' # disable wifi
alias adbwe='adb shell svc wifi enable' # enable wifi
alias adbfd='adb shell settings put global airplane_mode_on 0' # close airplane mode
alias adbfe='adb shell settings put global airplane_mode_on 1' # open airplane mode
alias adbne='adbwe && adbfd' # enable net
alias adbnd='adbwd && adbfe' # disable net
alias adbp='adb pull mnt/sdcard/KtSmart' # pull to sdcard
alias adbr='adb reboot' # reboot machine
alias adbl='adb shell ls' # ls
alias adbc='adb shell sqlite3 sdcard/ktsmart/db/db_kt.sqlite && .table'
alias adbg='adb shell ps | grep '
alias adbk='adb shell kill '
alias adbbc='adb shell am broadcast -a ' # eg: adb shell am broadcast -a com.android.test --es test_string “this is test string” --ei test_int 100 --ez test_boolean true
alias adbsa='adb shell am start -n ' # start activity pkg/.activity
alias alg='adb logcat | grep --color=auto ' #adb logcat grep file

function
#echo "$(date +"%Y-%m-%d %T %N") Init .bashrc end! "
