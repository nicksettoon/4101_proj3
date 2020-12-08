import os
import sys

if __name__ == "__main__":
    with open("testbank.scm", encoding='ascii', mode='r') as file_in:
        i = 1
        lines = file_in.readlines()

        if sys.argv[1] == '-all':
            #make tests in one file
            with open(f"Testing/bank.scm", encoding='ascii', mode='w') as new_file:
                new_file.write(f",load ../test.scm\n")
                new_file.write(f",load ../s48.scm\n")
                for line in lines:
                    line = line.rstrip() # convert to string
                    if line == '' or line[0] == ';': # if line is empty, throw away
                        continue
                    else:
                        new_file.write(f"""(test "Test{i}" '{line})\n""")
                        i += 1
        else:
            for line in lines:
                line = line.rstrip() # convert to string
                if line == '' or line[0] == ';': # if line is empty, throw away
                    continue
                else:
                    with open(f"Testing/Test{i}.scm", encoding='ascii', mode='w') as new_file:
                        new_file.write(f",load ../test.scm\n")
                        new_file.write(f",load ../s48.scm\n")
                        new_file.write(f"""(test "Test{1}" '{line}\n""")
                    i += 1