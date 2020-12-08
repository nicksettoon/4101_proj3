# 4101_proj3
implements more scheme functions


This is indeed another late submission. However, I hope the left of dedication, thought, and time I've put in have shown in the code I am submitting.
Apparently I did not have to rewrite all the builtin functions, however, once I did, pretty much everything was just copy and paste from ini.scm since the builtins now work with our rational data structure.


I did not get around to finishing (w). It is located in the cbl.scm
Importing ini.scm last is all that is necessary to use my functions.


ALL TESTS IN testbank.scm (for the most part) SHOULD OUTPUT #t


I don't understand why, but I'm now receiving a "/bin/bash^M: bad interpreter: No such file or directory" error when attempting to run the settoon_runtests3 or runtests3 scripts. I can't seem to get them to work correctly. Regardless, the mktests.py should be creating all the test files correctly and they should be ready to run through the script should you figure out how to get the script to run.


Please let me know if I need to help figure these issues out. Again, I'm terribly sorry for the late submission. I won't make excuses.


There are several make targets available. In addition runtests has been altered slightly to make things easier for me to do faster testing when combined with vscode's tasks



runbank: runs the settoon_runtests3 script with the -all argument


runfiles: runs the settoon_runtests3 script with the -all argument


runtests: simply runs the runtests3 script with arguments recieved from the make target


./runtests3 $(ARG)

	ARG can be [-init|-all]

		-init : runs everything in init.scm. This was my testing file.

		-all : calls the "testbank" make target which makes a file in ./Testing/ called bank.scm and feeds all the lines from that file into scheme

		no arguments to this make target runs the script as normal, calling the testfiles script first in order to turn each line from testbank.scm into a separate file with the form: (test "Testid" line_from_testbank.scm)



testbank: clears the code base for another call to mktests.py, then calls it.

	make cbank

	make crep

	python3 ./Testing/mktests.py -all


testfiles: clears the code base for another call to mktests.py, then calls it to create n separate test files

	make cfiles
	
	make crep

	python3 ./Testing/mktests.py


cbank: clears the bank.scm file

	rm -f ./Testing/bank.scm


cfiles: removes all separate testing files made by mktests.py
	rm -f ./Testing/Test*


crep: clears the reports created by runtests script
	rm -f ./testreport.txt
	rm -f ./report.txt
	rm -f ./Testing/testreport.txt
	rm -f ./Testing/report.txt


clean: squeaky
	make cbank
	make cfiles
	make crep