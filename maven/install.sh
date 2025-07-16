

BASEDIR=$(dirname $0)
cd $BASEDIR
for dirname in `find . -type d`; do
    if [[ "$dirname" == "." ]]; then
	continue
    fi
    
    jar_file=`ls $dirname/*.jar`
    pom_file=`ls $dirname/*.pom`
    echo "install $jar_file with pom $pom_file"
    mvn install:install-file -Dfile=$jar_file -DpomFile=$pom_file
done
