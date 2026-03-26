#!/bin/bash

# Simple Interest Calculator

echo "=== Simple Interest Calculator ==="

# Input
read -p "Enter Principal amount (P): " principal
read -p "Enter Rate of Interest (R) in %: " rate
read -p "Enter Time period (T) in years: " time

# Validation (basic)
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
  echo "Error: All inputs are required."
  exit 1
fi

# Check if numeric (basic check)
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $principal =~ $re && $rate =~ $re && $time =~ $re ]]; then
  echo "Error: Please enter valid numeric values."
  exit 1
fi

# Calculation (using bc for floating point)
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Output
echo "-------------------------------"
echo "Principal: $principal"
echo "Rate: $rate %"
echo "Time: $time years"
echo "Simple Interest: $simple_interest"
echo "-------------------------------"
