#include <iostream>
#include <string>

using namespace std;

// Hàm mã hóa van ban su dung mat mã Vigenere
string vigenere_encrypt(string message, string key) {
    string result = "";
    int j = 0;
    for (int i = 0; i < message.length(); i++) {
        if (isalpha(message[i])) //ktra xem ky tu co trong bang chu cai khong
		{
            // Tính toán chu so cua ký tu trong bang chu cái
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

    // Nhap van ban can mã hóa
    cout << "Nhap van ban can ma hoa: ";
    getline(cin, message);

    // Nhap khóa de mã hóa
    cout << "Nhap khoa de ma hoa: ";
    getline(cin, key);

    // Mã hóa và giai mã van ban
    string encrypted_message = vigenere_encrypt(message, key);

    // In ket qua ra màn hình
    cout << "Van ban duoc ma hoa: " << encrypted_message << endl;

    return 0;
}
