# Import the random libraries for use in generating random data
# R has built-in random functions, so no need to import a library

# Dynamically generate the workers data
num_workers <- sample(400:1000, 1)
workers <- list()

# Generate the list of workers with random salaries
for (i in 1:num_workers) {
  worker <- list(
    name = paste0("Worker_", i),
    gender = sample(c("Male", "Female"), 1),
    salary = sample(3000:40000, 1)
  )
  workers[[i]] <- worker
}

# Assign the workers level based on salary and gender
assign_worker_level <- function(salary, gender) {
  if (salary > 10000 && salary < 20000) {
    return("A1")
  } else if (salary > 7500 && salary < 30000 && gender == 'Female') {
    return("A5-F")
  } else {
    return("unassigned")
  }
}

# for loop to generate payment slip for all workers
for (worker in workers) {
  tryCatch({
    salary <- worker$salary
    gender <- worker$gender
    employee_level <- assign_worker_level(salary, gender)
    cat(sprintf("%s - Gender: %s - Salary: $%d - Employee Level: %s\n", 
                worker$name, gender, salary, employee_level))
  }, error = function(e) {
    cat(sprintf("Error processing %s: %s\n", worker$name, e$message))
  })
}