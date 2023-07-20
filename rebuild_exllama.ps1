# We are resetting every submodule to their head prior
# to updating them to avoid any merge conflicts.
git submodule foreach --recursive git reset --hard

git submodule update --remote --merge --force

conda activate exllama

pip install --pre --requirement ./requirements.txt
