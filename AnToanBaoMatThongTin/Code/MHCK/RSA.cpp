#include <bits/stdc++.h>
using namespace std;
#define int long long

// ha bac
int power(int a, int m, int n) {
    int b = 1;
    a %= n;
    while (m > 0) {
        if (m & 1) {
            b = (b * a) % n;
        }
        m >>= 1;
        a = (a * a) % n;
    }
    return b;
}

int phi(int n) {
    int res = n;
    for (int i = 2; i * i <= n; ++i) {
        if (n % i == 0) {
            while(n % i == 0) {
                n /= i;
            }
            res -= res / i;
        }
    }
    return n > 1 ? res - res / n : res;
}
// Euclid mo rong Q A1 A2 B1 B2 : b^-1 mod m
int ExtendedEuclid(int b, int m) {
    int A1 = 0, A2 = m, B1 = 1, B2 = b;
    while(B2 != 0 && B2 != 1) {
        int Q = A2 / B2;
        int T1 = A1 - Q * B1, T2 = A2 - Q * B2;
        A1 = B1, A2 = B2;
        B1 = T1, B2 = T2;
    }
    if (B2 == 0) {
        return -1;
    }
    return ((B1 % m) + m) % m;	// Ket qua sau bang tra ve 2 th am va duong
}

main() {
    int p = 37, q = 53, e = 47, M = 41;
    int n = p * q;

    // Khoa cong khai cua An
    cout << "Khoa cong khai cua An: " << endl;
    cout << "n = p * q = " << p << " * " << q << " = " << n << endl; 
    cout << "PU = {e, n} = {" << e << ", " << n << "}" << endl;
    cout << endl; 

    // Cach An tao khoa rieng PR = {d, n}
    int phi_n = phi(n);
    int d = ExtendedEuclid(e, phi_n);   /// = e^-1 mod phi_n
    cout << "Cach An tao khoa rieng: " << endl;
    cout << "phi(n) = phi(" << n << ") = " << phi_n << endl; 
    cout << "d = e^(-1) mod (phi(n)) = " << e << "^(-1) mod " << phi_n << " = " << d << endl;
    cout << "PR = {d, n} = {" << d << ", " << n << "}" << endl;
    cout << endl; 

    // Cach An tao bang ma hoa thong diep
    int C = power(M, d, n);
    cout << "Cach An tao ban ma hoa thong diep: " << endl;
    cout << "C = M^d mod n = " << M << "^" << d << " mod " << n << " = " << C << endl;
    cout << endl;

    // Ba giai ma ban ma C: M' = 
    int M_2 = power(C, e, n); 
    cout << "Cach Ba giai ma C: " << endl;
    cout << "M' = C^e mod n = " << C << "^" << e << " mod " << n << " = " << M_2 << endl;
    return 0;
}
