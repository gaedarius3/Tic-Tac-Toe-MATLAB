# MATLAB Vectorized Tic-Tac-Toe

A robust command-line implementation of the classic Tic-Tac-Toe (X and O) game engineered in MATLAB. The project focuses on efficient matrix manipulation, complete input sanitization, and fully vectorized win-condition evaluations.

---

## Technical Highlights

* **Vectorized Win Evaluation:** Replaces traditional nested loops with native, highly optimized MATLAB matrix operations:
  * Rows: `any(all(t == s, 2))`
  * Columns: `any(all(t == s, 1))`
  * Main Diagonal: `all(diag(t) == s)`
  * Anti-Diagonal: `all(diag(flipud(t)) == s)`
* **Input Sanitization & Boundary Checking:** Validates user inputs against matrix bounds ($1 \le \text{row, col} \le 3$), non-numeric entries, empty submissions, and cell occupancy before committing any move.
* **Modular Architecture:** Decouples core game state management, console board rendering, and victory determination into dedicated sub-functions.

---

## Game Preview

```text
--- Joc X și 0 ---

    1   2   3
  -------------
1 | X |   | O |
  -------------
2 |   | X |   |
  -------------
3 | O |   | X |
  -------------

FELICITĂRI! Jucătorul X a câștigat!
```

---

## Repository Structure

```text
matlab-tic-tac-toe/
├── x_si_0_final.m       # Main script containing game loop and helper sub-functions
└── README.md            # Technical documentation
```

---

## Getting Started

### Prerequisites
* MATLAB R2018a or newer (fully compatible with GNU Octave).

### Running the Game
1. **Clone the repository:**
   ```bash
   git clone https://github.com/gaedarius3/matlab-tic-tac-toe.git
   cd matlab-tic-tac-toe
   ```

2. **Run in MATLAB:**
   * Open MATLAB and set the current folder to the cloned repository.
   * In the Command Window, execute:
     ```matlab
     x_si_0_final
     ```

3. **Play:**
   * Enter row indices (`1-3`) and column indices (`1-3`) when prompted by the CLI.
