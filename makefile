runfiles:
	./settoon_runtests3

runbank:
	./settoon_runtests3 -all

runtests:
	./settoon_runtests3 $(ARG)

testbank:
	make cbank
	make crep
	python3 ./Testing/mktests.py -all

testfiles:
	make cfiles
	make crep
	python3 ./Testing/mktests.py

cbank:
	rm -f ./Testing/bank.scm

cfiles:
	rm -f ./Testing/Test*

crep:
	rm -f ./testreport.txt
	rm -f ./report.txt
	rm -f ./Testing/testreport.txt
	rm -f ./Testing/report.txt

clean:
	make cbank
	make cfiles
	make crep

chmod:
	chmod 777 ./runtests3
	chmod 777 ./settoon_runtests3