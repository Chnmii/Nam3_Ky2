//monoalphabetic substitution cipher (ma hoa chu don)

#include <bits/stdc++.h>
using namespace std;

string MSC_encrypt(string M, string K) {
    string C = "";  // khai báo 1 chuoi rong
    for (auto &c : M) {   // chay lan luot tung ký tu có trong M (hoi: c duoc gan nhung gia tri nao)
        C += K[c - 65];   // 65: mã ascii cua A, (hoi: vi sao phai tru di 65) 
        // c-65: tìm vi tri co trong khóa K, sau so thi them vao chuoi C
    }
    return C;
}

string MSC_decrypt(string C, string K) {
    string M = ""; 
    for (auto &c : C) {
        M += K.find(c) + 65; // tim xem trong khó K co ky tu c
        // +65: vi de no thanh bang ma ascii
    }
    return M;
}

int main() {
    string M = "LIKEFATHERLIKESO";
    string K = "LYFGMKNERXJPQIVATOHSZDBUCW";
    string C = MSC_encrypt(M, K);
    cout << "C = " << C << "\n";
    cout << "M = " << MSC_decrypt(C, K);
    return 0;
}
