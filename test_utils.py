from pathlib import Path
from KattisToGithub.src.solved_problem import SolvedProblem, ProblemStatus


def get_solved_problem() -> SolvedProblem:
    return SolvedProblem()

def get_problem_status(val: int) -> ProblemStatus:
    return ProblemStatus(val)

def call_write_to_file(sp: SolvedProblem, directory: str) -> None:
    sp.write_to_file(Path(directory))
