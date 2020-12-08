import os
import sys

if __name__ == "__main__":
    load1 = f",load ../s48.scm\n"
    load2 = f",load ../test.scm\n"
    with open("testbank.scm", encoding='ascii', mode='r') as file_in:
        i = 1
        lines = file_in.readlines()

        try:
            if sys.argv[1] == '-all':
                #make tests in one file
                filename = f"Testing/bank.scm"
                with open(filename, encoding='ascii', mode='w') as new_file:
                    new_file.write(load1)
                    new_file.write(load2)
                    for line in lines:
                        line = line.rstrip() # convert to string
                        if line == '' or line[0] == ';': # if line is empty, throw away
                            continue
                        else:
                            testline = f"""(test "Test{i}" '{line})\n"""
                            print(f"\nWriting to {filename}:\n{testline}")
                            new_file.write(testline)
                            i += 1
        except:
            for line in lines:
                line = line.rstrip() # convert to string
                testline = f"""(test "Test{i}" '{line})\n"""
                filename = f"Testing/Test{i}.scm"
                if line == '' or line[0] == ';': # if line is empty, throw away
                    continue
                else:
                    with open(filename, encoding='ascii', mode='w') as new_file:
                        print(f"\nWriting to {filename}:\n{load1}{load2}{testline}")
                        new_file.write(load1)
                        new_file.write(load2)
                        new_file.write(testline)
                    i += 1