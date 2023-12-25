#include <iostream>
#include <string>

using namespace std;

// H�m m� h�a van ban su dung mat m� Vigenere
string vigenere_encrypt(string message, string key) {
    string result = "";
    int j = 0;
    for (int i = 0; i < message.length(); i++) {
        if (isalpha(message[i])) //ktra xem ky tu co trong bang chu cai khong
		{
            // T�nh to�n chu so cua k� tu trong bang chu c�i
            char c = isupper(message[i]) ? 'A' : 'a'; // kiem tra xem co o dang chu hoa 
            int mi = message[i] - c;
            int ki = key[j % key.length()] - c;
            int ci = (mi + ki) % 26 + c;
            result += ci;
            j++;
        } 
		else 
		{
            result += message[i];
        }
    }
    return result;
}


int main() {
    string message, key;

    // Nhap van ban can m� h�a
    cout << "Nhap van ban can ma hoa: ";
    getline(cin, message);

    // Nhap kh�a de m� h�a
    cout << "Nhap khoa de ma hoa: ";
    getline(cin, key);

    // M� h�a v� giai m� van ban
    string encrypted_message = vigenere_encrypt(message, key);

    // In ket qua ra m�n h�nh
    cout << "Van ban duoc ma hoa: " << encrypted_message << endl;

    return 0;
}
