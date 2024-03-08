#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

AITTCOIND=${AITTCOIND:-$SRCDIR/aittcoind}
AITTCOINCLI=${AITTCOINCLI:-$SRCDIR/aittcoin-cli}
AITTCOINTX=${AITTCOINTX:-$SRCDIR/aittcoin-tx}
AITTCOINQT=${AITTCOINQT:-$SRCDIR/qt/aittcoin-qt}

[ ! -x $AITTCOIND ] && echo "$AITTCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
AITTVER=($($AITTCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for aittcoind if --version-string is not set,
# but has different outcomes for aittcoin-qt and aittcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$AITTCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $AITTCOIND $AITTCOINCLI $AITTCOINTX $AITTCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${AITTVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${AITTVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
