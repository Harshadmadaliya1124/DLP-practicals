#include <iostream>
#include <fstream>
#include <sstream>
#include <algorithm>
#include <cctype>
#include <string>

using namespace std;

bool isIdentifier(const string &word) {
    return !word.empty() && isalpha(word[0]);
}

bool isLiteral(const string &word) {
    return !word.empty() && all_of(word.begin(), word.end(), ::isdigit);
}

int main() {
    ifstream file("inp.txt");
    if (!file) {
        cerr << "Error opening file!" << endl;
        return 1;
    }

    string word, line;
    int charCount = 0, wordCount = 0, lineCount = 0;
    int spaceCount = 0, tabCount = 0, specialCharCount = 0;
    int identifierCount = 0, literalCount = 0;

    while (getline(file, line)) {
        lineCount++;
        charCount += line.length();

        for (char ch : line) {
            if (isspace(ch)) {
                if (ch == ' ') spaceCount++;
                if (ch == '\t') tabCount++;
            } else if (!isalnum(ch)) {
                specialCharCount++;
            }
        }

        stringstream ss(line);
        while (ss >> word) {
            wordCount++;
            if (isIdentifier(word)) identifierCount++;
            if (isLiteral(word)) literalCount++;
        }
    }

    file.close();

    cout << "Characters: " << charCount << endl;
    cout << "Words: " << wordCount << endl;
    cout << "Lines: " << lineCount << endl;
    cout << "Whitespace (spaces): " << spaceCount << endl;
    cout << "Whitespace (tabs): " << tabCount << endl;
    cout << "Special Characters: " << specialCharCount << endl;
    cout << "Identifiers: " << identifierCount << endl;
    cout << "Literals: " << literalCount << endl;

    return 0;
}
