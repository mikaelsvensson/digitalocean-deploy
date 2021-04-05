# Check if unzip is already installed
which unzip
if [ $? -ne 0 ]; then
    # No, unzip is not installed. Install it now.
    apt -y -qq install unzip

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "aws-cli-v2.zip"
    unzip aws-cli-v2.zip
    ./aws/install
fi