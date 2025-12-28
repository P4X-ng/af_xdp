# CI/CD Workflows Documentation

This document describes the automated workflows configured for this repository.

## Amazon Q Code Review Workflow

**File:** `.github/workflows/auto-amazonq-review.yml`

### Overview

The Amazon Q Code Review workflow provides automated code quality and security analysis. It runs after GitHub Copilot agent workflows complete and creates comprehensive review reports.

### Features

#### Code Structure Analysis
- Analyzes source files across multiple languages (Python, JavaScript, TypeScript, Java, Go, C, C++, and more)
- Counts and reports on total files analyzed
- Identifies C/C++ code for specialized security analysis

#### Security Considerations
- **Credential Scanning**: Detects potential hardcoded secrets, passwords, API keys, and tokens
- **Unsafe C Functions**: Identifies potentially dangerous C functions that can lead to buffer overflows:
  - `strcpy`, `strcat`, `sprintf`, `gets`, `scanf`
  - Recommends safer alternatives (e.g., `strncpy`, `snprintf`)
- **Memory Management**: Tracks memory allocations and frees to identify potential leaks
  - Detects `malloc`, `calloc`, `realloc`, `posix_memalign`
  - Counts corresponding `free` calls
  - Alerts on allocation/free mismatches

#### Performance Analysis
- Loop detection and counting for optimization opportunities
- Global variable usage analysis for thread safety considerations

#### Architecture and Design
- Documentation coverage (README files)
- Modular design assessment (header files in C/C++)

### Triggers

The workflow is triggered by:
1. Completion of GitHub Copilot agent workflows:
   - Periodic Code Cleanliness Review
   - Comprehensive Test Review with Playwright
   - Code Functionality and Documentation Review
   - Org-wide Copilot Playwright Test, Review, Auto-fix, PR, Merge
   - Complete CI/CD Agent Review Pipeline
2. Manual workflow dispatch

### Output

The workflow creates:
1. **GitHub Issue**: A detailed code review issue with findings and action items
2. **Workflow Artifacts**: Report files stored for 90 days
   - `amazonq-report.md`: Full review report
   - `amazonq-prep.md`: Preparation and context information

### Issue Management

- The workflow checks for existing Amazon Q review issues from the last 7 days
- If found, it adds a comment with updated findings instead of creating a new issue
- Issues are labeled with: `amazon-q`, `automated`, `code-review`, `needs-review`

### Future Enhancements

This workflow is designed to integrate with Amazon Q Developer when available:
- AWS credentials configuration (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
- Amazon Q Developer CLI integration
- Amazon CodeWhisperer security scanning
- Custom review rules based on AWS best practices

## Integration with GitHub Copilot

The Amazon Q workflow complements GitHub Copilot agent reviews by providing:
- Additional security analysis
- AWS best practices recommendations
- Performance optimization suggestions
- Enterprise architecture patterns assessment

## Action Items for Teams

When an Amazon Q review issue is created:

1. **Review Findings**: Examine all identified issues and warnings
2. **Prioritize**: Sort issues by severity (Security > Performance > Architecture)
3. **Security First**: Address any security warnings immediately:
   - Replace unsafe C functions
   - Remove hardcoded credentials
   - Fix memory management issues
4. **Performance**: Optimize identified bottlenecks
5. **Documentation**: Update based on recommendations
6. **Follow-up**: Close the issue once all high-priority items are addressed

## Customization

To customize the workflow for your needs:

1. **Add Language Support**: Update the `find` command to include additional file extensions
2. **Adjust Security Patterns**: Modify `SECRET_PATTERNS` to match your credential naming conventions
3. **Add Custom Checks**: Insert additional grep patterns for project-specific concerns
4. **Tune Thresholds**: Adjust when warnings are triggered based on your code complexity

## Example Output

```markdown
#### Code Structure Analysis
- Total source files analyzed: 32
- C/C++ source files found: 32
- Performing security analysis for C/C++ code...

#### Security Considerations
- Credential scanning: 0 potential hardcoded secrets found
- Unsafe C functions: 0 instances of potentially unsafe functions
- Memory management: 8 allocations found, 8 free calls found

#### Performance Optimization Opportunities
- Loop usage: 212 loops found - review for optimization opportunities

#### Architecture and Design Patterns
- Documentation: 9 README files found
- Modular design: 0 header files for code organization
```

## Related Workflows

- `auto-copilot-code-cleanliness-review.yml`: Code structure and organization review
- `auto-copilot-test-review-playwright.yml`: Test quality and Playwright usage review
- `auto-copilot-functionality-docs-review.yml`: Documentation completeness review
- `auto-complete-cicd-review.yml`: Complete CI/CD pipeline review

## Support

For issues or questions about this workflow:
1. Check workflow run logs in the Actions tab
2. Review the generated artifacts for detailed information
3. Open an issue with the `workflow` label for assistance
