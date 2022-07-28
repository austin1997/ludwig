import sys
import os

rootdir = sys.argv[1]

proc_size_results = {}
problem_size_set = set()

for file in os.listdir(rootdir):
    d = os.path.join(rootdir, file)
    if os.path.isdir(d):
        proc = int(file)
        size_results = {}
        for f in os.listdir(d):
            d2 = os.path.join(d, f)
            if os.path.isdir(d2):
                problem_size = str(f)
                problem_size_set.add(problem_size)
                results = []
                for file in os.listdir(d2):
                    if file.endswith(".out"):
                        with open(os.path.join(d2, file), 'r') as result_file:
                            for line in result_file.readlines():
                                if "phi halos:" in line:
                                    results.append(line.split()[4])        
                                    break
                size_results[problem_size] = results
        proc_size_results[proc] = size_results

print(proc_size_results)
sorted_items = sorted(proc_size_results.items(), key=lambda x:x[0])
for size in problem_size_set:
    print("size = {0}".format(size))
    for item in sorted_items:
        print(item[1][size])
