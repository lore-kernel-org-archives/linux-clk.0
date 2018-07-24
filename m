Return-Path: <maxime.ripard@bootlin.com>
Date: Tue, 24 Jul 2018 15:22:19 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.19
Message-ID: <20180724132219.6z4fvvarmhvs5p44@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5xkazgalytjd5dwz"
List-ID: <linux-clk.vger.kernel.org>


--5xkazgalytjd5dwz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following changes for the next merge window.

Thanks!
Maxime

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.19

for you to fetch changes up to 0195156340d365540c7dfa239232065826904f59:

  clk: sunxi-ng: add A64 compatible string (2018-06-27 20:29:08 +0200)

----------------------------------------------------------------
Allwinner clock changes for 4.19

Our usual bunch of clock patches, this time to enable the A64 display
engine clocks controller mostly.

----------------------------------------------------------------
Icenowy Zheng (2):
      dt-bindings: add compatible string for the A64 DE2 CCU
      clk: sunxi-ng: add A64 compatible string

Jernej Skrabec (3):
      clk: sunxi-ng: r40: Add minimal rate for video PLLs
      clk: sunxi-ng: r40: Allow setting parent rate to display related cloc=
ks
      clk: sunxi-ng: r40: Export video PLLs

 .../devicetree/bindings/clock/sun8i-de2.txt        |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 11 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               | 58 ++++++++++++------=
----
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h               |  8 ++-
 include/dt-bindings/clock/sun8i-r40-ccu.h          |  4 ++
 5 files changed, 47 insertions(+), 35 deletions(-)

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--5xkazgalytjd5dwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltXKAoACgkQ0rTAlCFN
r3QIHg//Ut61pKKNbEkbNjkvXDEeFYGXqOrKXz5XlbQ1aBa07rJnFcTgia+W4pf4
aqaLgvUlGNb9KWgc0kyVxXda9Iy1bS4720PAHaskE7LzKArBKhBzLyg8x7bDnfSG
yTIBeOffz+ijbqU2Is2zAYSbZ+8Uv1rtWWUAK8ca4JbNQBRnTTxHpTc8vzASUqQc
CUr7d9wuW05VCfF4AOSD3obr7ZE0k1PgDNuQ0PNq9LCl3k4C7yYv5Rj6poYwDtjQ
OEv/DRQvPG4k25uEsCIA8zzfq7kNNqj9MIaei1lQyBeb4wanSnG3iHDskzLDTCnW
FRkM17NkM14zjcb43AgFei1HE4iKJ+JHmoQdxZhgCjpRkU84BglU65S6HAX4ALCC
dZYSwEGQYt6sOHhMMvmvBtcT2LElNLI4tgvR0udU3Jpn7CwBH8kHuUxfAy5IrWMj
XOOkWWUBysQykzPmYcgQuBEZpWaNd0uR/+ElVCF068ol5S2+yQuroOfAHG2CoHqk
mE1iKYG4s8EM22E8czoTXq8RHJb7v7XF0HMjJUXvKyycl4VUL7Ynow14hCddJN2h
jwgMjhCkzvEsaHrMuTvq4UBFtOk+L9iULiA/GIJ1bTSsEQfknMyk3v5XnO6OpI1C
KMmBISMqGwZBFvYW9xGRJEDInK6sHjlhleKaBzq0oaZQec2jLRI=
=BPkK
-----END PGP SIGNATURE-----

--5xkazgalytjd5dwz--
