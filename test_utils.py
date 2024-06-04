from KattisToGithub.src.solved_problem import SolvedProblem, ProblemStatus


def get_solved_problem() -> SolvedProblem:
    return SolvedProblem()

def get_problem_status(val: int) -> ProblemStatus:
    return ProblemStatus(val)
