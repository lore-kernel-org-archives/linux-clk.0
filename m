Return-Path: <maxime.ripard@bootlin.com>
Date: Mon, 21 May 2018 13:59:47 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.18
Message-ID: <20180521115947.wqrnv2hczate65lz@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ykggpdq7ksextfjp"
List-ID: <linux-clk.vger.kernel.org>


--ykggpdq7ksextfjp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please merge the following changes for the next merge window, thanks!

Maxime

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.18

for you to fetch changes up to 17de4c857b1f74b90967f7e7fd5ff81be61dc044:

  clk: sunxi-ng: r40: export a regmap to access the GMAC register (2018-05-=
17 14:02:07 +0800)

----------------------------------------------------------------
Allwinner clock changes for 4.18

Not a lot of changes for this release, but two quite important features
were added: the H6 PRCM clock support, and the needed changes to the R40
clock driver to allow for the EMAC to operate.

----------------------------------------------------------------
Icenowy Zheng (3):
      clk: sunxi-ng: add support for H6 PRCM CCU
      clk: sunxi-ng: r40: rewrite init code to a platform driver
      clk: sunxi-ng: r40: export a regmap to access the GMAC register

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   3 +-
 drivers/clk/sunxi-ng/Kconfig                       |   5 +
 drivers/clk/sunxi-ng/Makefile                      |   1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c             | 207 +++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h             |  19 ++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               |  72 +++++--
 include/dt-bindings/clock/sun50i-h6-r-ccu.h        |  24 +++
 include/dt-bindings/reset/sun50i-h6-r-ccu.h        |  17 ++
 8 files changed, 336 insertions(+), 12 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
 create mode 100644 include/dt-bindings/clock/sun50i-h6-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-h6-r-ccu.h

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--ykggpdq7ksextfjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsCtLIACgkQ0rTAlCFN
r3Q82w//VvJNFyNBf1MN1LNOSsaqF2wXXPvQIiyKjskFgj/3e4Y1OVMNMxkdxkV5
58WMgc1nBif1GOSabRi1uld/on+1uPKGkajfYIQNPh1b9TKYzUNork4Gkrc7UHtJ
iD5H12miFWR7Zt0UPCYWbbzXOjeVj/BlFPo66mUO/FHhhtmStcBoQZZvtyD+OgKG
ulqbpUXPjOpeVD0nL9l0mqZJXXn7FW3QWbz/nXUv2mOplALQ9+onXGawKtwl+MqH
hujEpEpBQKrRFxu+yCU4AK7VBobH+LLFtbGM9fq32c7r6GdINnYQsQT0TK2t81rr
1kskHa91SWx4q2RIwkaLwH3bNdeINIlv6WiVzgndUwPS/fimVjGcQ10DmHbLKK9e
/lX56YCVdAaZUy6Y/9GitEs03JA9rWEVaPJs3m2xivLAqHjccXaQ5y93fi/m7QoJ
Pec+XUP5kpSlX5J7wp19rLkciPnYxNWxEBNzZRssoZuNrgX571unStb/BMZ+iUby
3VQ5moXVBcIhR5cbjBx6pt95UzRjWN+EWzTdqidAIQV65RJk48be4DpMLZx+8y9Z
PWIPbq7sJ3v77K27jTHaoDyT0VpjwBOdYhdHUF/OUXu6+nJ0nvQrhw4pZ2J/PXeu
ePQLphwJu6hDn7NUomMHG4wNKu6T85XL3OOKgp44vNXni4KZZKQ=
=Yq/w
-----END PGP SIGNATURE-----

--ykggpdq7ksextfjp--
