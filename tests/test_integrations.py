from pathlib import Path


def test_required_project_files_exist():
    required_files = [
        "README.md",
        "docs/architecture.md",
        "azure/sentinel/query.kql",
        "aws/cloudtrail/setup.sh",
        "google/chronicle/detection.yaral",
        "scripts/setup.sh",
    ]

    missing = [
        file_path
        for file_path in required_files
        if not Path(file_path).is_file()
    ]

    assert not missing, f"Missing project files: {missing}"
