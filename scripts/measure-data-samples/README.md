# Record samples size calculator script

Use the script main.py to estimate the size of data samples that will be used
to publish to the kinesis data stream, to use this script follow these steps

> This guide tells you how to use this script with virtual env, but you can use the script by installing the dependencies using the requirements.txt file on your own global environment

1. In this directory create a virtual environment by running `python3 -m venv .env`
2. Activate the environment by running `source .env/bin/activate`
3. Install the dependencies by running `pip3 install -r requirements.txt`
4. The script is meat to work with `.json` files, put the same of the data you expect to send to kinesis under the `record-samples` with the format you expect it to be delivered to the stream and run `python3 main.py` and it will print the name of the file followed by the size in Human readable format like the example below

```
python3 main.py

./record-samples/sample-2.json 315B
./record-samples/sample-1.json 719B
```

> Note: if the directory `record-samples` doesn't exist create in this directory
