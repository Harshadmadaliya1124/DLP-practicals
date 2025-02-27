#include <iostream>
#include <cctype>
using namespace std;

void extractNumbers(const string &input) {
    string num = "";
    for (char ch : input) {
        if (isdigit(ch)) {
            num += ch;
        } else if (!num.empty()) {
            cout << num << endl;
            num = "";
        }
    }
    if (!num.empty()) {
        cout << num << endl;
    }
}

int main() {
    string input;
    cout << "Enter the string: ";
    getline(cin, input);

    extractNumbers(input);
    return 0;
}
