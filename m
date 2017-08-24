Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 24 Aug 2017 10:36:20 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.14, take 3
Message-ID: <20170824083620.b5cq4qtyr3cqtpjx@flea.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ocda6ongssomgbjx"
List-ID: <linux-clk.vger.kernel.org>


--ocda6ongssomgbjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here is a quite late PR, but this also something we've been waiting
for for quite some time already.

These patches convert our last users of the old clock framework to the
new one. We still have some marginal users of the old clock drivers,
but they shouldn't prevent the fix for the orphans clocks we hold back
to work.

Maxime

The following changes since commit cd030a78f7aa06fe216f6665a6ea84b8f3e5b3d3:

  clk: sunxi-ng: support R40 SoC (2017-08-19 17:04:37 +0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.14-3

for you to fetch changes up to c84f5683f6e9fee78e054431d89121225ccb7464:

  clk: sunxi-ng: Add sun4i/sun7i CCU driver (2017-08-24 10:15:54 +0200)

----------------------------------------------------------------
Allwinner clock changes for 4.14, part 3

Conversion of the last two SoCs (A10, A20) to the sunxi-ng framework.

----------------------------------------------------------------
Priit Laes (3):
      dt-bindings: List devicetree binding for the CCU of Allwinner A20
      dt-bindings: List devicetree binding for the CCU of Allwinner A10
      clk: sunxi-ng: Add sun4i/sun7i CCU driver

 .../devicetree/bindings/clock/sunxi-ccu.txt        |    2 +
 drivers/clk/sunxi-ng/Kconfig                       |   13 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c               | 1456 ++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun4i-a10.h               |   61 +
 include/dt-bindings/clock/sun4i-a10-ccu.h          |  200 +++
 include/dt-bindings/clock/sun7i-a20-ccu.h          |   53 +
 include/dt-bindings/reset/sun4i-a10-ccu.h          |   69 +
 8 files changed, 1855 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.h
 create mode 100644 include/dt-bindings/clock/sun4i-a10-ccu.h
 create mode 100644 include/dt-bindings/clock/sun7i-a20-ccu.h
 create mode 100644 include/dt-bindings/reset/sun4i-a10-ccu.h

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ocda6ongssomgbjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnpAEAAoJEBx+YmzsjxAgISwP/0dGCHYbvNSJd8c6mxrnG6ap
Ec4tSdkYh/YtA+PmHmXTD/gCyv1WteSL0YiU2Ffm7VSIMP41f0NmMEvJstP/Ep32
DoZ71EaoK4mmkrVpt1xTHASqfzQ2k4+y6s7arisS8YspcIhubXNDCMEiAplGJb/1
xfNwpTaHHb2Y9tksnjhr7v1xw9/tC1n/Wz/uOMLSGO7otOBsBR8I502mrv47VL8h
KiPn1h/xadnBocuN9JlBdFaA09UNgafI4Ewzl5wSFkZ624A9HU0qsiSdACJryUl3
Wcq0S3gOtms9cu2L6+cWFIRKG+TeSLszU84kWJl3g0OytzwFQLSTq8CvHKkff/aG
8w8xjNUjfSqwzJzL8qS2hGXQ5MrGMcPCIjx4LwnQXQ3J/jD50ZNm6C5M2bu7EapQ
6y4GCtxCelhXplv4IOgf88s8YNrxXTr4//NFgAWjezRS6s4EVcEVsQu2t5L3eLVX
0DGqqEj70KPRbnhEDguw/uS/sd3VfJ06JehM8l1PiUWnRaYnoIfDIIVVOnkhZjci
6cvLqtwbEpVEHh+0cVGi2A1B7khUG3Q2lM/5JL9AKzFUmLgcaJ8YMUAIv1DhtYRd
scmGQtUGpkj+7QWk8OI6eSs2+Khm82k3CubZNSZBfoFuLoBrWBlcqAiSfHAPrhMJ
4TuCx1mcetg6lt9hUeCT
=qKIp
-----END PGP SIGNATURE-----

--ocda6ongssomgbjx--
