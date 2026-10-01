#!/usr/bin/env python3
from __future__ import annotations
import csv
import sys
from pathlib import Path


def validate(path: str) -> None:
    rows = list(csv.reader(Path(path).open(newline="", encoding="utf-8")))
    if not rows:
        raise ValueError("Empty CSV")
    header = rows[0]
    if len(header) < 3:
        raise ValueError("Need gene identifier plus at least two samples")
    if len(set(header[1:])) != len(header[1:]):
        raise ValueError("Duplicate sample names")
    genes = set()
    for line_no, row in enumerate(rows[1:], start=2):
        if len(row) != len(header):
            raise ValueError(f"Line {line_no}: column count mismatch")
        gene = row[0]
        if gene in genes:
            raise ValueError(f"Duplicate gene: {gene}")
        genes.add(gene)
        for value in row[1:]:
            number = float(value)
            if number < 0 or not number.is_integer():
                raise ValueError(f"Line {line_no}: counts must be non-negative integers")
    print(f"OK: {len(genes)} genes x {len(header)-1} samples")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: validate_count_matrix.py counts.csv")
    validate(sys.argv[1])
