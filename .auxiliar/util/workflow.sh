#!/bin/bash

open_file_in_vscode() {
  local filepath=$1
  mkdir -p "$(dirname "$filepath")"
  code "$filepath"
  echo "Opened file in VSCode: $filepath"
}

execute_command() {
  local command=$1
  eval "$command"
  echo "Executed command: $command"
}

while true; do
  echo ""
  echo "Select the next step in your workflow:"
  echo "1. Create the test file"
  echo "2. Create the approved test file"
  echo "3. Create the method"
  echo "4. Create the shield SHIELD_BLOCKING"
  echo "5. Add the finding to the graph"
  echo "6. Add the metadata to the model"
  echo "7. In case of symbolic evaluation"
  echo "8. Execute the test"
  echo "9. Add translations"
  echo "10. Exit"

  read -p "Enter the number of the step: " choice

  case $choice in
    1)
      open_file_in_vscode ".auxiliar/skims/test/test.php"
      ;;
    2)
      read -p "Enter the code: " code
      read -p "Enter the test name: " test_name
      filepath="skims/test/data/lib_root/${code}/${test_name}.php"
      open_file_in_vscode "$filepath"
      ;;
    3)
      read -p "Enter the code: " code
      filepath="skims/skims/lib_sast/root/${code}/php.py"
      open_file_in_vscode "$filepath"
      ;;
    4)
      read -p "Enter the code: " code
      filepath="skims/skims/lib_sast/root/${code}/__init__.py"
      open_file_in_vscode "$filepath"
      ;;
    5)
      filepath="skims/skims/lib_sast/root/__init__.py"
      open_file_in_vscode "$filepath"
      ;;
    6)
      filepath="skims/skims/model/core.py"
      open_file_in_vscode "$filepath"
      ;;
    7)
      echo "7.1 Create the symbolic evaluation method"
      echo "7.2 Add the symbolic evaluation method to the evaluator"
      echo "7.3 Add the finding to the evaluator"
      read -p "Enter the number of the sub-step: " sub_choice
      read -p "Enter the code: " code
      case $sub_choice in
        1)
          read -p "Enter the type: " type
          filepath="skims/skims/symbolic_eval/${code}/${type}/php.py"
          open_file_in_vscode "$filepath"
          ;;
        2)
          read -p "Enter the type: " type
          filepath="skims/skims/symbolic_eval/${code}/${type}/__init__.py"
          open_file_in_vscode "$filepath"
          ;;
        3)
          read -p "Enter the type: " type
          filepath="skims/skims/symbolic_eval/cases/${type}.py"
          open_file_in_vscode "$filepath"
          ;;
        *)
          echo "Invalid sub-step choice, please try again."
          ;;
      esac
      ;;
    8)
      read -p "Enter the code: " code
      command="./.auxiliar/makes/run.sh ${code}"
      execute_command "$command"
      ;;
    9)
      read -p "Enter the code: " code
      code_upper=$(echo "$code" | tr '[:lower:]' '[:upper:]')
      filepath="skims/static/translations/criteria/vulnerabilities/${code_upper}.yaml"
      open_file_in_vscode "$filepath"
      ;;
    10)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid choice, please try again."
      ;;
  esac
done
