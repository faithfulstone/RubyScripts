# Open the source file in read mode
source_file = File.open("readfile.txt", "r")

# Read the contents of the source file
contents = source_file.read

# Close the source file
source_file.close

# Open the destination file in append mode
destination_file = File.open("output.txt", "a")

# Append the contents to the destination file
destination_file.write(contents)

# Close the destination file
destination_file.close