Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 11 Sep 2016 22:21:04 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clocks changes for 4.9
Message-ID: <20160911202104.GA2491@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
List-ID: <linux-clk.vger.kernel.org>


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the usual bunch of clock patches for the Allwinner SoCs, this
time converting more SoCs to the new framework.

Thanks!
Maxime

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clk-for-4.9

for you to fetch changes up to d63a5e7c713a68bd368016f2022326a1a91310d8:

  clk: sunxi-ng: Add hardware dependency (2016-09-10 11:41:21 +0200)

----------------------------------------------------------------
Allwinner Clock changes for 4.9

Four more SoCs converted to the new clock framework (A31, A31s, A23 and
A33).

----------------------------------------------------------------
Chen-Yu Tsai (6):
      clk: sunxi-ng: mux: Increase fixed pre-divider div size
      clk: sunxi-ng: nkm: Add mux to support multiple parents
      clk: sunxi-ng: mux: Add support for mux tables
      clk: sunxi-ng: mux: support fixed pre-dividers on multiple parents
      clk: sunxi-ng: mux: Add clk notifier functions
      clk: sunxi-ng: Add A31/A31s clocks

Jean Delvare (1):
      clk: sunxi-ng: Add hardware dependency

Maxime Ripard (8):
      clk: sunxi-ng: mux: Rename mux macro to be consistent
      clk: sunxi-ng: div: Add mux table macros
      clk: sunxi-ng: div: Add kerneldoc for the _ccu_div structure
      clk: sunxi-ng: div: Allow to set a maximum
      clk: sunxi-ng: mux: Add mux table macro
      clk: sunxi-ng: Add N-class clocks support
      clk: sunxi-ng: Add A33 CCU support
      clk: sunxi-ng: Add A23 CCU

 .../devicetree/bindings/clock/sunxi-ccu.txt        |    5 +-
 drivers/clk/sunxi-ng/Kconfig                       |   39 +
 drivers/clk/sunxi-ng/Makefile                      |    4 +
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               | 1235 ++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun6i-a31.h               |   72 ++
 drivers/clk/sunxi-ng/ccu-sun8i-a23-a33.h           |   63 +
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |  737 ++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |  780 +++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   10 +-
 drivers/clk/sunxi-ng/ccu_div.h                     |   66 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |   23 +-
 drivers/clk/sunxi-ng/ccu_mp.h                      |    2 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |  133 +++
 drivers/clk/sunxi-ng/ccu_mult.h                    |   35 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |   56 +-
 drivers/clk/sunxi-ng/ccu_mux.h                     |   68 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   44 +-
 drivers/clk/sunxi-ng/ccu_nkm.h                     |   23 +
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   21 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |   16 +-
 include/dt-bindings/clock/sun6i-a31-ccu.h          |  187 +++
 include/dt-bindings/clock/sun8i-a23-a33-ccu.h      |  127 ++
 include/dt-bindings/reset/sun6i-a31-ccu.h          |  106 ++
 include/dt-bindings/reset/sun8i-a23-a33-ccu.h      |   87 ++
 24 files changed, 3860 insertions(+), 79 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-a31.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-a31.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a23-a33.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a23.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a33.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_mult.c
 create mode 100644 include/dt-bindings/clock/sun6i-a31-ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-a23-a33-ccu.h
 create mode 100644 include/dt-bindings/reset/sun6i-a31-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-a23-a33-ccu.h

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX1bywAAoJEBx+YmzsjxAgLiMP/jiEketF6seK9sDBxhkGTtwC
ak4muGGGzmjr/KELAI6+ZGs+4qcoKSaYBJAPdh0veN3N6Fvhwgo5GjT3QbPVIqJB
X7DSoNuaC2MswSa57FbuU4ex2eCWCH95D3vPlQd7iCjn5GCBgEOAcMBn/wxMgKvj
KLmJkfxTnJZviQi4Cpm+lfSD25fg1tA2eVrL7GTl5EPP8BWJVYTc+cL5SwYphl92
K8fEVu7iFdB4h5QIoDXuIbS2sHHjw4c3NOVBihs7NKOk6GqiBVxxVSwlLOfDq8al
vIcxR2w4ZHlPdm5U2CB8HXBv+5yWvgl2esvh9P4441BNBsLnkK4uSGcRaE0/GlJy
yckVXt7bnaBfAXuZ0E2BicPNwmXRlfOeiSKZIq6zx6g21vDq5z0i8Fbg006iKPRE
axx/KfHz2h3GOHzgTLmktcR3uc9moXSrmWoDvwD/tzZxQrLHVo846c4Sp2FKcEpX
dgDMFOu7Fjgv2YF4mMdlEGPow+UQ0OiGiHHsK+DyzQ6OX7fd3MPZJrJA3+BNgDKn
ixoH7DEL64xWBCXZiHrqR83KS8LCwromLMwPxLvB/jHqd5G0UxQ4WFRkMeFv1byi
9ZIIT3lsq1E2rULnw272zmmFDR/0T99xM+AZepO/RX5h50+Q/9TrJ1bGhHvCt/pA
HkKIalCe0IEHyhjnPSvE
=bjs+
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
