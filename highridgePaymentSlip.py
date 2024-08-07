# using python
# Import the random libraries for use in generating random data
import random

# Dynamically generate the workers data
num_workers = random.randint(400,1000)
workers = []

# Generate the list of workers with random salaries
for i in range(num_workers):
    worker = {
        "name": f"Worker_{i+1}",
        "gender": random.choice(["Male", "Female"]),
        "salary": random.randint(3000, 40000)
    }
    workers.append(worker)

# Assign the workers level based on salary and gender
def assign_worker_level(salary, gender):
    if salary > 10000 and salary < 20000:
        return "A1"
    elif salary > 7500 and salary < 30000 and gender == 'Female':
        return "A5-F"
    else:
        return "unassigned"

# for loop to generate payment slip for all workers
for worker in workers:
    try:
        salary = worker['salary']
        gender = worker['gender']
        employee_level = assign_worker_level(salary, gender)
        print(f"{worker['name']} - Gender: {gender} - Salary: ${salary} - Employee Level: {employee_level}")
    except Exception as e:
        print(f"Error processing {worker['name']}: {e}")
