// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) @2024 The AITTCoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef AITTCOIN_QT_AITTCOINADDRESSVALIDATOR_H
#define AITTCOIN_QT_AITTCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class AITTCoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit AITTCoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** AITTCoin address widget validator, checks for a valid aittcoin address.
 */
class AITTCoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit AITTCoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // AITTCOIN_QT_AITTCOINADDRESSVALIDATOR_H
