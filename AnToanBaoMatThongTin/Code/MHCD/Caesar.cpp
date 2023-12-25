#include <bits/stdc++.h>
using namespace std;

string caesar(string M, int K) 
{
    string C = "";
    for (auto c : M) 
	{
        C += (c - 65 + K) % 26 + 65;
    }
    return C;
}

int main() 
{
    string M = "ABADBEGINNINGMAK";
    int K = 18;
    cout << caesar(M, K) << endl;
}
