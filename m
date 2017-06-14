Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 14 Jun 2017 21:26:17 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.13
Message-ID: <20170614192617.bsp5pjxrphlk36sk@flea.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oy3hvnsuuw46sroa"
List-ID: <linux-clk.vger.kernel.org>


--oy3hvnsuuw46sroa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here is the patches for 4.13 for the Allwinner SoCs.

In order to reduce the conflicts, this is based on the fixes tag I
sent a PR for a few minutes ago.

Thanks!
Maxime

The following changes since commit d85da227c3ae43d9ca513d60f244213cb4e55485:

  clk: sunxi-ng: a64: Export PLL_PERIPH0 clock for the PRCM (2017-05-31 21:=
57:30 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.13

for you to fetch changes up to 06e226c7fb233f676b01b144d0b321ebe510fdcd:

  clk: sunxi-ng: Move all clock types to a library (2017-06-07 15:33:39 +02=
00)

----------------------------------------------------------------
Allwinner clock patches for 4.13

Some new clock units are supported, for the display clocks unsed in the
newer SoCs, and the A83T PRCM.

There is also a bunch of minor fixes for clocks that are not used by
anyone, and reworks needed by drivers that will land in 4.13.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi-ng: select SUNXI_CCU_MULT for sun8i-a83t

Chen-Yu Tsai (7):
      dt-bindings: clock: sunxi-ccu: Add compatible string for A83T CCU
      clk: sunxi-ng: Support multiple variable pre-dividers
      clk: sunxi-ng: Add driver for A83T CCU
      clk: sunxi-ng: a83t: Fix PLL lock status register offset
      clk: sunxi-ng: a83t: Fix audio PLL divider offset
      dt-bindings: clock: sunxi-ccu: Add compatible string for A83T PRCM
      clk: sunxi-ng: a83t: Add support for A83T's PRCM

Icenowy Zheng (2):
      dt-bindings: add binding for the Allwinner DE2 CCU
      clk: sunxi-ng: add support for DE2 CCU

Maxime Ripard (8):
      clk: divider: Make divider_round_rate take the parent clock
      clk: sunxi-ng: Pass the parent and a pointer to the clocks round rate
      clk: sunxi-ng: div: Switch to divider_round_rate
      clk: sunxi-ng: mux: Don't just rely on the parent for CLK_SET_RATE_PA=
RENT
      clk: sunxi-ng: mux: split out the pre-divider computation code
      clk: sunxi-ng: mux: Change pre-divider application function prototype
      clk: sunxi-ng: mux: Re-adjust parent rate
      clk: sunxi-ng: sun5i: Export video PLLs

Stephen Boyd (1):
      clk: sunxi-ng: Move all clock types to a library

Tobias Klauser (1):
      clk: sunxi-ng: explicitly include linux/spinlock.h

Wei Yongjun (1):
      clk: sunxi-ng: de2: fix wrong pointer passed to PTR_ERR()

 .../devicetree/bindings/clock/sun8i-de2.txt        |  31 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |   5 +-
 drivers/clk/clk-divider.c                          |  19 +-
 drivers/clk/sunxi-ng/Kconfig                       | 116 +--
 drivers/clk/sunxi-ng/Makefile                      |  37 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              |  10 +-
 drivers/clk/sunxi-ng/ccu-sun5i.h                   |   6 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               |  10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |  10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |  10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c              | 922 +++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.h              |  64 ++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 260 ++++++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.h               |  28 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |  10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 | 117 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               |  10 +-
 drivers/clk/sunxi-ng/ccu_div.c                     |  38 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |  15 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |  19 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     | 108 ++-
 drivers/clk/sunxi-ng/ccu_mux.h                     |  24 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   7 +-
 drivers/clk/sunxi-ng/ccu_reset.h                   |   1 +
 include/dt-bindings/clock/sun5i-ccu.h              |   3 +
 include/dt-bindings/clock/sun8i-a83t-ccu.h         | 140 ++++
 include/dt-bindings/clock/sun8i-de2.h              |  18 +
 include/dt-bindings/reset/sun8i-a83t-ccu.h         |  98 +++
 include/dt-bindings/reset/sun8i-de2.h              |  14 +
 include/linux/clk-provider.h                       |  16 +-
 30 files changed, 1893 insertions(+), 273 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a83t.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.h
 create mode 100644 include/dt-bindings/clock/sun8i-a83t-ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-de2.h
 create mode 100644 include/dt-bindings/reset/sun8i-a83t-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-de2.h

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--oy3hvnsuuw46sroa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZQY3ZAAoJEBx+YmzsjxAg/QkQALiTsLXzmabPiaEEqO5MmkH9
F26a+cIftOmizEpomxx7aRilAgPbbLWVJ0fXfYdkrXaKjp3LCY1EsyynQTxHKx+1
oETCFphnitlqfGVX87QDj6D2ER4T3nGq51KwVCpNaZ/iig7G+dAvnzDOwybW3J+y
JHeNoSRBH/KV1h/SUt+kw8i5IfZb/xHZDPPeWqj/56a+ByuDSepFGLdnwBCRT77G
nVtRMnPEqy3aBugJabMZWs1n8nr/T8ChEGXKQlBr4f/NBd3MPlf4vv9LDs30Niq6
j/DqZT30Ti0UwRXes1IrhPG66VCvUnJOFrTXSa6o95U0Vqr46gU5jHPCkMpzlJ1y
59wtBok6KRjiaAXhLfnJNBaT3T+fOTlEjtIUv4dn3xiZrzcL6iOUSCyfCOgeEqXa
Ax5f9f98UmVaNI+SmFh74ypfg1LM7PhkX8Z//6GvgSSAj1h0J8fQGdzjRfSYVaAT
8AhrRecwz/wSAODhuyHVndxq0AuyvMZ7IieSyG+GBvhzQnpPTHqyrgg0DlCPdB+K
ly/dgnmMH6w3IBbfJuhPPPRCGjmXCzBsEtDle7AY0jFbp0X5MRUBHgpKTxQYiR/Z
yMmMER3H+2vBJJsyv7idJedFgImwox0JQmtSEp6YJxD+S/XA0TKtUpbashy3ASWp
VPPKrvcC91xl39fnsbPR
=Iluf
-----END PGP SIGNATURE-----

--oy3hvnsuuw46sroa--
