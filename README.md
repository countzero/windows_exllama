# Learning ExLlama

This is a playground to explore the [ExLlama](https://github.com/turboderp/exllama) project in a Windows environment.

## Installation

### 1. Install Prerequisites

Download and install the latest versions:

* [CMake](https://cmake.org/download/)
* [Cuda](https://developer.nvidia.com/cuda-downloads)
* [Git Large File Storage](https://git-lfs.com)
* [Git](https://git-scm.com/download)
* [Miniconda](https://conda.io/projects/conda/en/stable/user-guide/install)
* [Visual Studio 2022 - Community](https://visualstudio.microsoft.com/downloads/)

**Hint:** When installing Visual Studio 2022 it is sufficent to just install the `Build Tools for Visual Studio 2022` package. Also make sure that `Desktop development with C++` is enabled in the installer.

### 2. Clone the repository from GitHub

Clone the repository to a nice place on your machine via:

```Shell
git clone --recurse-submodules git@github.com:countzero/windows_exllama.git
```

### 3. Update the exllama submodule to the latest version (optional)
This repository can reference an outdated version of the exllama repository. To update the submodule to the latest version execute the following.

```Shell
git submodule update --remote --merge
```

Then add, commit and push the changes to make the update available for others.

```Shell
git add --all; git commit -am "Update exllama submodule to latest commit"; git push
```

**Hint:** This is optional because the build script will pull the latest version.

### 4. Create a new Conda environment

Create a new Conda environment for this project with a specific version of Python:

```Shell
conda create --name exllama python=3.10
```

### 5. Initialize Conda for shell interaction

To make Conda available in you current shell execute the following:

```Shell
conda init
```

**Hint:** You can always revert this via `conda init --reverse`.

### 6. Execute the build script

```PowerShell
./rebuild_exllama.ps1
```

### 7. Download a large language model

Download a large language model (LLM) with weights in the GPTQ format into the `./models` directory. You can for example download the [vicuna-7b-v1.3](https://huggingface.co/lmsys/vicuna-7b-v1.3) model in a quantized GPTQ format via:

```Shell
git clone https://huggingface.co/TheBloke/vicuna-7B-v1.3-GPTQ ./models/vicuna-7B-v1.3-GPTQ
```

**Hint:** See the [🤗 Open LLM Leaderboard](https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard) for best in class open source LLMs.

## Usage

### Chat

Activate the conda environment to make the dependencies available via:

```Shell
conda activate exllama
```

Execute the following to chat with a GPTQ formatted model:

```PowerShell
python ./vendor/exllama/example_chatbot.py `
    --directory "./models/vicuna-7B-v1.3-GPTQ" `
    --prompt "./prompts/chatbot.txt" `
    --botname "Vicuña" `
    --username "User" `
    --length 2048 `
    --no_newline
```

### Benchmark

Activate the conda environment to make the dependencies available via:

```Shell
conda activate exllama
```

Execute the following to benchmark your system:

```PowerShell
python ./vendor/exllama/test_benchmark_inference.py `
    --directory "./models/vicuna-7B-v1.3-GPTQ" `
    --perf
```

### Measure model perplexity

Activate the conda environment to make the dependencies available via:

```Shell
conda activate exllama
```

Execute the following to measure the perplexity of the GPTQ formatted model:

```PowerShell
python ./vendor/exllama/test_benchmark_inference.py `
    --directory "./models/vicuna-7B-v1.3-GPTQ" `
    --perplexity `
    --perplexity_dataset "./vendor/exllama/datasets/wikitext2_val_sample.jsonl"
```
