#/bin/sh
if [ $# -eq 0 ]; then
    echo "FAIL> No arguments supplied"
    echo "!! Please give me the paht of kotlin file you want to compile and run."
    exit 0
fi

filename=$1

function getDate() {
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    echo ${DATE}
}

if [ -f "$filename" ]; then
    echo "$(getDate) OK> Target file : \"${filename}\""
else
    echo "$(getDate) koltin file is not existed. Please check it and try again."
fi

echo "$(getDate) Ready to compile kotlin file \"${filename}\""
jarFileName=$(echo $filename | sed 's/\.kt/.jar/g')

trap ' [ -f "$jarFileName" ] && rm -rf "${jarFileName}" ;\
	printf "exiting process ...\n"; exit 0' INT

function compileApp() {
    if [ -f "$jarFileName" ]; then
        rm -rf "${jarFileName}"
    fi

    echo "$(getDate) Compiling kotlin file ${filename}"
    say "Building ..."
    kotlinc "${filename}" -include-runtime -d "${jarFileName}"
    if [ $? -eq 0 ]; then
        echo "$(getDate) OK> Compliing kotlin file ^_^b"
        runApp
    else
        echo "$(getDate) FAIL> Compliing kotlin file T_T"
    fi

    notify $buildResult
}

function runApp() {
    echo "$(getDate) Run the application ${jarFileName}"
    echo "$(getDate) <START> ==================================================="
    echo ""
    java -jar "${jarFileName}"
    echo ""
    echo "$(getDate) <END> =====================================================\n"
    echo ""
}

function notify() {
    echo "$(getDate) Notify !!!"
    title="Build Pass!"

    if [ -f "$jarFileName" ]; then
        title="Build Success!!"
        say "Build Pass"
        msg="OK> kotline app build Success"
    else
        title="Build Fail!!"
        say "Build failed"
        msg="FAIL> kotlin app build failed !"
    fi

    osascript -e "display notification \"${msg}\" with title \"${title}\" subtitle \"$filename\""
}

compileApp

fswatch -0 "$filename" | while read -d "" event; do
    clear
    compileApp
done

exit 0
