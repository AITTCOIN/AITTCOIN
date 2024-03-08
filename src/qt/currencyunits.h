// Copyright (c) 2011-2016 The Bitcoin Core developers
// Copyright (c) 2017-2021  The Ravncore developers
// Copyright (c) @2024 		The AITTCoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef AITTCOIN_QT_CURRENCYUNITS_H
#define AITTCOIN_QT_CURRENCYUNITS_H

#include <QString>
#include <array>

/** Currency unit definitions. Stores basic title and symbol for a fib swap asset,
 * as well as how many decimals to format the dispaly with.
*/
struct CurrencyUnitDetails
{
    const char* Header;
    const char* Ticker;
    float Scalar;
    int Decimals;
};

class CurrencyUnits
{
public:
    static std::array<CurrencyUnitDetails, 5> CurrencyOptions;

    static int count() {
        return CurrencyOptions.size();
    }
};

#endif // AITTCOIN_QT_CURRENCYUNITS_H
