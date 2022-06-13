#include <iostream>
#include <algorithm>
#include <memory.h>
#include <string>

using namespace std;

static auto __ = []
{
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    return 0;
}();

string a, b;
int dp[102][102];

void init()
{
    a = " " + a, b = " " + b;
    memset(dp, 0, sizeof(dp));
}

void solve()
{
    for (auto i = 1U; i < a.size(); ++i) for (auto j = 1U; j < b.size(); ++j)
    {
        if (a[i] == b[j]) dp[i][j] = dp[i - 1][j - 1] + 1;
        else dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
    }
    cout << dp[a.size() - 1][b.size() - 1] << '\n';
}

int main()
{
    while (cin >> a >> b) init(), solve();
}