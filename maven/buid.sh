

BASEDIR=$(dirname $0)
cd $BASEDIR
for dirname in `find . -type d`; do
    if [[ "$dirname" == "." ]]; then
	continue
    fi
    
    cd $dirname
    jar_file=`ls *.jar`
    pom_file=`ls *.pom`
    echo "install $jar_file with pom $pom_file"
    mvn install:install-file -Dfile=$jar_file -DpomFile=$pom_file
    cd $BASEDIR
done
