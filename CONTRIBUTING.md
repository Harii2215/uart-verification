# Contributing to uart-verification

Thank you for your interest in contributing to this UART verification project!

## Getting Started

1. **Fork** the repository
2. **Clone** your fork: `git clone https://github.com/YOUR_USERNAME/uart-verification.git`
3. **Create a branch** for your feature: `git checkout -b feature/your-feature-name`

## Development Setup

### Prerequisites
- QuestaSim / ModelSim / VCS / Xcelium (class-based verification support required)
- SystemVerilog knowledge
- Git

### Running Tests

```bash
cd sim
make run
```

## Making Changes

### Code Style
- Follow SystemVerilog naming conventions
- Use meaningful variable and signal names
- Add comments for complex logic
- Keep testbench code modular and reusable

### Documentation
- Update README.md if adding new features
- Document new parameters or configuration options
- Include waveform signal descriptions for new signals

### Testing
- Verify your changes with the existing testbench
- Add test cases for new functionality
- Ensure all previous tests still pass

## Commit Guidelines

- Use clear, descriptive commit messages
- Reference issues where applicable: `Fixes #123`
- Use conventional commits: `feat:`, `fix:`, `docs:`, `test:`, etc.

Example:
```bash
git commit -m "feat: add data width configuration parameter"
```

## Pull Request Process

1. **Push** your branch to your fork
2. **Create a Pull Request** with a clear title and description
3. **Reference** any related issues
4. **Wait for review** and address feedback
5. **Ensure all tests pass** before merging

## Reporting Issues

- Check existing issues to avoid duplicates
- Provide a clear description of the problem
- Include the simulator used (QuestaSim, VCS, etc.)
- Share error messages and waveform details if applicable

## Code of Conduct

Be respectful and constructive in all interactions. This is a learning-friendly project!

## Questions?

Feel free to open an issue for any questions or discussions.

Thank you for contributing! 🎉
