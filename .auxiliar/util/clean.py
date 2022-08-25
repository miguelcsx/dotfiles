import argparse
import requests
import os


def process_file(input_file, output_file):
    # Read the input file
    with open(input_file, "r") as file:
        lines = file.readlines()

    # Step 1: Remove lines containing '__pycache__'
    filtered_lines = [line for line in lines if "__pycache__" not in line]

    # Step 2: Filter lines to only include those with the format skims/skims/lib_sast/root/<folder code>
    filtered_lines = [
        line for line in filtered_lines if len(line.strip().split("/")) == 5
    ]

    # Step 3: Check the URL status for each folder code and language
    valid_lines = []
    # Extract the language from the file name
    language = input_file.split("_")[0]
    for line in filtered_lines:
        parts = line.strip().split("/")
        folder_code = parts[-1]
        url = f"https://docs.fluidattacks.com/criteria/fixes/{language}/{folder_code[1:]}"
        response = requests.get(url)
        print(f"{url}: {response}")

        if response.status_code == 200:
            valid_lines.append(line)

    # Write the valid lines back to the file
    with open(output_file, "w") as file:
        file.writelines(valid_lines)


def main():
    parser = argparse.ArgumentParser(
        description="Process a file and clean it based on specified criteria."
    )
    parser.add_argument(
        "input_file", type=str, help="The input file to be processed"
    )
    parser.add_argument(
        "output_file", type=str, help="The output file to write the results to"
    )

    args = parser.parse_args()

    process_file(args.input_file, args.output_file)


if __name__ == "__main__":
    main()
