from os import path as osPath, listdir
from glob import glob
from hurry.filesize import size
from pathlib import Path

samples_dir = "./record-samples"

for file in listdir(samples_dir):
    if file.endswith(".json"):
        full_file = osPath.join(samples_dir, file)
        print(full_file, size(Path(full_file).stat().st_size))
