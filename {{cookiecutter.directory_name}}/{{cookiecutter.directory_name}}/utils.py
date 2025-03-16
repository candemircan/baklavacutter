__all__ = ["show_info"]

from typing import List

from wasabi import msg


def show_info(param_names: List, param_values: List):
    msg.info("Running with following parameters:")
    msg.table([param_values], header=param_names, divider=True, fg_colors=["green" for _ in range(len(param_names))])
