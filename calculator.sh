#!/bin/bash
clear

display_intro(){
  echo "-------------------------------------"
  echo "------- Welcome to Calculator -------"
  echo "-------------------------------------"

  echo -e "[a] Addition\n[b] Subtraction\n[c] Multiplication\n[d] Division\n"
}

calculate(){
  read -p "Enter your choice of calculation: " choice
  case $choice in
    [aA])
          read -p "Enter first number: " num1
          read -p "Enter second number: " num2
          result=$((num1 + num2))
          echo -e "\n--> The result for your choice is: $result"
          ;;
    [bB])
          read -p "Enter first number: " num1
          read -p "Enter second number: " num2
          result=$((num1 - num2))
          echo -e "\n--> The result for your choice is: $result"
          ;;
    [cC])
          read -p "Enter first number: " num1
          read -p "Enter second number: " num2
          result=$((num1 * num2))
          echo -e "\n--> The result for your choice is: $result"
          ;;
    [dD])
          read -p "Enter first number: " num1
          read -p "Enter second number: " num2
          if [[ $num2 -eq 0 ]]; then
              echo -e "\n--> Error: Division by zero is not allowed."
          else
              result=$((num1 / num2))
              echo -e "\n--> The result for your choice is: $result"
          fi
          ;;
    *)
        echo -e "\nInvalid choice"
        ;;
  esac
}

# Call the functions
display_intro
calculate
