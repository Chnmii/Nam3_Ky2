#include <bits/stdc++.h>
using namespace std;
#define int long long

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

main() {
    int n;
    cout << "Nhap n: ";
    cin >> n;
    cout << "phi(" << n << ") = " << phi(n);
    return 0;
}
