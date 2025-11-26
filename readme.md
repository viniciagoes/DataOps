# DataOps Learning Repository

A personal repository dedicated to studying and implementing modern data operations, Change Data Capture (CDC), CI/CD pipelines, and related data engineering concepts.

## 🎯 Purpose

This repository serves as a hands-on learning platform to explore:

- **Data Operations (DataOps)** - Best practices for managing data workflows, quality, and governance
- **Change Data Capture (CDC)** - Techniques for capturing and processing data changes in real-time
- **CI/CD Pipelines** - Continuous integration and deployment strategies for data applications
- **Data Engineering Patterns** - Modern architectures and design patterns for data systems
- **ETL/ELT Workflows** - Building and optimizing data transformation pipelines
- **Data Quality & Testing** - Implementing robust data validation and monitoring

## ✅ Next steps (task list)

- [ ] Finish Setup

- [ ] Implement unitary tests for basic scripts

- [ ] Implement CDC

- [ ] Implement unitary tests for CDC

- [ ] Local dev setup
    - [ ] Validate and pin dependencies in requirements.txt
    - [ ] Provide example env file and secrets guidance

- [ ] Core implementations
    - [ ] Create a minimal end-to-end pipeline example in /pipelines/
    - [ ] Implement a basic CDC example in /cdc/ (log-based and query-based)
    - [ ] Add synthetic data generators in /data/generated/ with reproducible seeds

- [ ] Testing & quality
    - [ ] Add unit and integration tests in /tests/ for pipelines and CDC
    - [ ] Implement data quality checks and assertion utilities
    - [ ] Add linting (flake8/ruff) and formatters (black/isort)

- [ ] CI/CD & automation
    - [ ] Add GitHub Actions workflows: lint, test, build artifacts
    - [ ] Create a deployment workflow for containerized runs (optional)
    - [ ] Automate dataset regeneration and test-data refresh

- [ ] Observability & monitoring
    - [ ] Add basic pipeline health checks and logging structure
    - [ ] Integrate metrics / simple dashboards (Prometheus/Grafana examples)

- [ ] Documentation & learning materials
    - [ ] Add step-by-step tutorials for each topic (DataGen, CDC, Pipelines)
    - [ ] Maintain architecture diagrams and data flow examples in /docs/
    - [ ] Curate references and reading notes per topic

- [ ] Future & community
    - [ ] Define a roadmap with milestones and priorities
    - [ ] Solicit contributors and add first-timers issues
    - [ ] Plan demos or notebooks showcasing end-to-end flows

Suggested immediate priorities: repository hygiene, one working pipeline + CDC example, tests, and a CI workflow.

## 📊 Project Structure

```
.
├── readme.md
├── data/
│   ├── generated/          # Randomly generated datasets for testing
│   └── schemas/            # Data schemas and definitions
├── pipelines/              # ETL/ELT pipeline implementations
├── cdc/                    # Change Data Capture examples
├── ci-cd/                  # CI/CD configuration files
├── tests/                  # Data quality and pipeline tests
└── docs/                   # Learning notes and references
```

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- Docker (optional, for containerized workflows)
- Git

### Setup

```bash
git clone https://github.com/viniciagoes/DataOps.git
cd DataOps
pip install -r requirements.txt
```

## 📚 Topics Covered

### Data Generation
- Creating realistic random datasets for testing and development
- Generating synthetic data with controlled patterns and anomalies

### Change Data Capture (CDC)
- Log-based CDC implementations
- Query-based CDC approaches
- Event streaming patterns

### Pipeline Orchestration
- Building scalable data pipelines
- Managing data dependencies
- Error handling and retry mechanisms

### CI/CD for Data
- Automated pipeline testing
- Data quality checks in CI/CD
- Version control for data definitions

### Monitoring & Observability
- Pipeline health checks
- Data quality metrics
- Performance optimization

## 🛠️ Tools & Technologies

This repository explores implementations using:

- **Python** - Core data processing
- **SQL** - Data transformation and analysis
- **Docker** - Containerization
- **Git** - Version control
- **GitHub Actions** - CI/CD automation
- *(Other tools to be added as projects expand)*

## 📖 Learning Approach

Each topic includes:
- Practical code examples
- Working implementations with random generated data
- Tests and validation scripts
- Commented code for clarity


## 🔗 Resources & References

- [DataOps Best Practices](https://dataopsmanifesto.org/)
- [CDC Patterns and Techniques](https://en.wikipedia.org/wiki/Change_data_capture)
- [Data Engineering Wiki](https://dataengineering.wiki/)