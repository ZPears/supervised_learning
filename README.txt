The code for generating my data can be run with the following steps:

1. Download the repo containing the relevant code and data from // Github URL
2. (Optional) Type `virtualenv env` to start a new virtual environment in the repo directory (with path to your python3 version if necessary).
3. `source env/bin/activate` to start the virtual environment.
4. Run `pip install -r requirements.txt` to install all the relevant python packages.
5. If you need to regenerate the modified datasets used in the analysis, you can run `data/data_munging.R` (you will need to modify the `setwd` call on the first line to your local path to the data directory).
6. From the top level of the repo, run `python run_experiment.py --all --threads=-1`
7. Wait several days...
8. All the data and plots from the 4 different runs (of 5 models each) will appear in a new output directory.
