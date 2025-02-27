#include <iostream>
#include <string>

using namespace std;

string replaceWord(const string &input, const string &wordToReplace, const string &replacement) {
    string result = input;
    size_t pos = 0;

    while ((pos = result.find(wordToReplace, pos)) != string::npos) {
        result.replace(pos, wordToReplace.length(), replacement);
        pos += replacement.length();
    }

    return result;
}

int main() {
    string input;
    cout << "Enter the text: ";
    getline(cin, input);

    string output = replaceWord(input, "charusat", "university");

    cout << "Modified text: " << output << endl;

    return 0;
}
