Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 15 Nov 2016 22:26:15 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner clock changes for 4.10
Message-ID: <20161115212615.lm3guceyfmdjnhfp@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="khrhj25xjddv4u5g"
List-ID: <linux-clk.vger.kernel.org>


--khrhj25xjddv4u5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following patches for the next merge window.

Thanks!
Maxime

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git sunxi-c=
lk-for-4.10

for you to fetch changes up to 0f6f9302b819ca352cfd4f42c18ec08d521f9cae:

  clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for audio module clocks =
(2016-11-11 21:47:41 +0100)

----------------------------------------------------------------
Allwinner clock changes for 4.10

The usual patches from us, but most notably the introduction of the A64
clocks unit.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      clk: sunxi-ng: sun8i-a23: Set CLK_SET_RATE_PARENT for audio module cl=
ocks
      clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for audio module clo=
cks

Julia Lawall (1):
      clk: sunxi: mod0: improve function-level documentation

Maxime Ripard (6):
      clk: sunxi-ng: Rename the internal structures
      clk: sunxi-ng: Remove the use of rational computations
      clk: sunxi-ng: Finish to convert to structures for arguments
      clk: sunxi-ng: Add minimums for all the relevant structures and clocks
      clk: sunxi-ng: Implement minimum for multipliers
      clk: sunxi-ng: Add A64 clocks

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +
 drivers/clk/sunxi-ng/Kconfig                       |  14 +-
 drivers/clk/sunxi-ng/Makefile                      |   1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              | 915 +++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h              |  72 ++
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |   6 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |  10 +-
 drivers/clk/sunxi-ng/ccu_div.h                     |   6 +-
 drivers/clk/sunxi-ng/ccu_frac.c                    |  12 +-
 drivers/clk/sunxi-ng/ccu_frac.h                    |  14 +-
 drivers/clk/sunxi-ng/ccu_mp.h                      |   4 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |  33 +-
 drivers/clk/sunxi-ng/ccu_mult.h                    |  17 +-
 drivers/clk/sunxi-ng/ccu_nk.c                      |  43 +-
 drivers/clk/sunxi-ng/ccu_nk.h                      |   4 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |  45 +-
 drivers/clk/sunxi-ng/ccu_nkm.h                     |   6 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |  55 +-
 drivers/clk/sunxi-ng/ccu_nkmp.h                    |   8 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |  58 +-
 drivers/clk/sunxi-ng/ccu_nm.h                      |   6 +-
 drivers/clk/sunxi/clk-mod0.c                       |   2 +-
 include/dt-bindings/clock/sun50i-a64-ccu.h         | 134 +++
 include/dt-bindings/reset/sun50i-a64-ccu.h         |  98 +++
 24 files changed, 1434 insertions(+), 130 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a64.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a64.h
 create mode 100644 include/dt-bindings/clock/sun50i-a64-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a64-ccu.h

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--khrhj25xjddv4u5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYK313AAoJEBx+YmzsjxAgNnsQAIZMa3Fdr2XQdx+xZS7TJrgo
k1F1HE1pxgx7303aPJzySyKawtZni+gtkwU7cqgvcQjh/2RAxrlq91pkCKgs7i/I
GaNCEfz3xkjIymd5cRccuOtn9sWER/1PslWaanOqs1ETUha4c+qQwbZBIq0pqACE
egCTM9YLD4Gkf57TmpkuFpKdQpBTTYrwgLlPfFAPLJEgSP7UQnriGCYsApByuAbs
jhG3TLl3RelZ32DwV4fZZVoO5gkhXDQvkWqVQsy3q007SmB55081DYSGP3VUCr7v
h8hskhrkjmOFpdFvoYOy1/X6zhVOEhc8UFWYGT8HFyUbQ4d3l3NumjBfdoeJIsQT
2G3bZ6A+kFmlvPP21ftwI0kbzthksR3RbOK7GiRiQbZ806oYG3kcmnxPXJnIdt0R
G1/T7viecW+cfE2RHsGjHaJYWSAG2nCdLO6ZBJubbagG/7PnOWG6NmKvjyC4AnIm
PLBSiLwvFpHljv7kRkDF/ezEgxYSotrBLa3c6viuXd9/tfcyjr9fm1I9vBzmbI//
aWBBcN6wkcyEOvE92OU4RHg7xGX2fG1g3hpnOivIPG9fPD1lJ0zBuf+DK22qG44h
KGfWtpF6/ym9A7Y9pJgthkccjLk2yC+h2jkKy87A2qRnDdjr5hghAm3//Xgl3Y4S
/8U++gMbXIv5CGm/vAy3
=uZl8
-----END PGP SIGNATURE-----

--khrhj25xjddv4u5g--
