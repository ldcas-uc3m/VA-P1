# Práctica 1: CNNs para la clasificación de imágenes
By Ignacio Arnaiz Tierraseca & Luis Daniel Casais Mezquida  
Visión Artificial 23/24  
Bachelor's Degree in Computer Science and Engineering  
Universidad Carlos III de Madrid


## Installation and execution
This requires Python 3.10.

1. Create a Python virtual enviroment in the `.venv` folder.
    ```bash
    python3 -m venv ./.venv
    ```
2. Activate the virtual enviroment
   - Linux:
        ```bash
        source .venv/bin/activate
        ```
    - Windows (PowerShell):
        ```powershell
        & .\.venv\Scripts\Activate.ps1
        ```
3. Install the dependencies
   ```
   pip install -r requirements.txt
   ```
4. If you have an Nvidia GPU and don't want the training to take ages, install [CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit) on your machine.  
   You'll also have to setup CUDA support for pytorch on your system. Check the [instructions on PyTorch's website](https://pytorch.org/get-started/locally/).
5. Download the data to the `data` folder:
   - [`db1.zip`](https://drive.google.com/file/d/1en19SOHlipCUgWRkJIGgiYcRl-zpCeDp/view?usp=sharing)
   - [`db2.zip`](https://drive.google.com/file/d/1a3a3lNpEFGTxMSCRN0uMMwH6_XBAPAXg/view?usp=drive_link)


### Running on VsCode