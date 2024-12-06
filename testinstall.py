import torch

x = torch.rand(5, 3)
print(f"rand(5,3) = {x}")

try:
    print("CUDA/ROCm AVAILABLE: ", torch.cuda.is_available())
    if torch.cuda.is_available() and torch.version.hip:
        print("  DETECTED HIP AVAILABLE")
    elif torch.cuda.is_available() and torch.version.cuda:
        print("  DETECTED CUDA AVAILABLE")
    print("CUDA DEVICE: ", torch.cuda.current_device())
    print("CUDA DEV NAME: ", torch.cuda.get_device_name(0))
except Exception as err:
    print(f"CUDA/ROCm NOT AVAILABLE: {err}")