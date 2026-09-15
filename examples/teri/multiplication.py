import torch

device = torch.accelerator.current_accelerator().type if torch.accelerator.is_available() else "cpu"
print(f"Using {device} device")

mat_1 = torch.tensor([[1, 2, 3],
                      [4, 3, 8],
                      [1, 7, 2]],
                      dtype=torch.float32)
mat_1 = mat_1.to(device=device)

mat_2 = torch.tensor([[2, 4, 1],
                      [1, 3, 6],
                      [2, 6, 5]],
                      dtype=torch.float32)
mat_2 = mat_2.to(device=device)

mat_3 = torch.mm(mat_1, mat_2, out=None)

print(mat_3.cpu())