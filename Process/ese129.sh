# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : shellscript
# - the challenge checks for a specific process at the other end of stdin : cat
# - the challenge checks for a specific process at the other end of stdout : cat
# - the challenge will force the parent process to solve a number of arithmetic problems : 50
# - the challenge will use the following arithmetic operations in its arithmetic problems : +*&^%|
# - the complexity (in terms of nested expressions) of the arithmetic problems : 5

cat < t2 | /challenge/embryoio_level129 | cat > t1 &
python ese125.py