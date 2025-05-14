__all__ = ["show_info", "empy_acc_cache"]

from typing import List

import torch
from wasabi import msg


def show_info(param_names: List, param_values: List):
    msg.info("Running with following parameters:")
    msg.table([param_values], header=param_names, divider=True, fg_colors=["green" for _ in range(len(param_names))])

def empty_acc_cache(device: torch.device) -> None:
    """
    If using an accelerator, empty cache for the given device.
    """
    if device.type == "cuda":
        torch.cuda.empty_cache()
    elif device.type == "mps":
        torch.mps.empty_cache()
