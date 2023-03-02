CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission 
if [[ -f  ListExamples.java ]]
    then 
        echo "ListExamples.java found"
    else 
        echo "need ListExamples.java"
    exit 1
fi

cd ..

cp TestListExamples.java student-submission/

cd ./student-submission
cp -f -r ../lib .

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > output.txt 

grep -r "Tests run:" output.txt
grep -r "test" output.txt
