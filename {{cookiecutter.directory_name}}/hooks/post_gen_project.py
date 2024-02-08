import shutil
import subprocess
from os.path import join

# Run your script
subprocess.run([join("hooks", "pre_commit_hooks.sh")], check=True)

# Delete the hooks directory
shutil.rmtree("hooks")
