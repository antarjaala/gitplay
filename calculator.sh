#!/bin/bash

# Check if two arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: $0 <number1> <number2>"
    exit 1
fi

num1=$1
num2=$2

# Display operations menu
echo "Select operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Modulus"

# Read user choice
read -p "Enter your choice (1-5): " choice

# Perform calculation based on user choice
case $choice in
    1)
        result=$(echo "$num1 + $num2" | bc)
        echo "Result: $num1 + $num2 = $result"
        ;;
    2)
        result=$(echo "$num1 - $num2" | bc)
        echo "Result: $num1 - $num2 = $result"
        ;;
    3)
        result=$(echo "$num1 * $num2" | bc)
        echo "Result: $num1 * $num2 = $result"
        ;;
    4)
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero is not allowed."
        else
            result=$(echo "scale=2; $num1 / $num2" | bc)
            echo "Result: $num1 / $num2 = $result"
        fi
        ;;
    5)
        result=$(echo "$num1 % $num2" | bc)
        echo "Result: $num1 % $num2 = $result"
        ;;
    *)
        echo "Invalid choice. Please select between 1 and 5."
        ;;
esac