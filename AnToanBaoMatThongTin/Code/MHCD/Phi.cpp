#include <iostream>
using namespace std;

int euler_phi(int n) {
    int phi = n;
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            phi -= phi / p;
            while (n % p == 0) {
                n /= p;
            }
        }
    }
    if (n > 1) {
        phi -= phi / n;
    }
    return phi;
}

int main() {
    int n;
    cout << "Nhap n: ";
    cin >> n;
    cout << "Phi(n) = " << euler_phi(n) << endl;
    return 0;
}
