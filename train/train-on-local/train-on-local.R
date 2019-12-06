# Copyright(c) Microsoft Corporation.
# Licensed under the MIT license.

library(azuremlsdk)

# Reminder: set working directory to current file location prior to running this script
setwd("~/azure-machine-learning-r/train/train-on-local")

ws <- load_workspace_from_config(path = "../../")

# Define estimator
est <- estimator(source_directory = ".",
                 entry_script = "train.R",
                 compute_target = "local")

# Initialize experiment
experiment_name <- "train-r-script-on-local"
exp <- experiment(ws, experiment_name)

# Submit job and display the run details
run <- submit_experiment(exp, est)
view_run_details(run)
wait_for_run_completion(run, show_output = TRUE)

# Get the run metrics
metrics <- get_run_metrics(run)
metrics
