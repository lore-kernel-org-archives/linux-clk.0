Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 5 Jul 2016 21:55:37 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner clock fixes for 4.7
Message-ID: <20160705195537.GA17805@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
List-ID: <linux-clk.vger.kernel.org>


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following fixes for the 4.7 cycle.

Thanks!
Maxime

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clk-fixes-for-4.7

for you to fetch changes up to 9ca91a65583c73e4be6e9f53323a7ae04e6803ef:

  clk: sunxi: remove unused variable (2016-06-16 09:18:29 +0200)

----------------------------------------------------------------
Allwinner clock fixes for 4.7

A bunch of changes for the display clocks merged in 4.7

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi: remove unused variable

Maxime Ripard (2):
      clk: sunxi: tcon-ch1: Do not return a negative error in get_parent
      clk: sunxi: display: Add per-clock flags

 drivers/clk/sunxi/clk-sun4i-display.c  | 5 ++++-
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c | 4 ----
 2 files changed, 4 insertions(+), 5 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXfBC5AAoJEBx+YmzsjxAg+C4P/16e3HZ0wqlsKrbpmCR5AZHv
olPryL2WswQh2Y8pHW1jWhg27bLMAtMdyiElL8xO1JcAEj8QWTPXW4lLWoyf5ZW7
oVIkqqInxPO1D02+GANsk56loyFDcgz6XzBj+TNmoPZYAYGhpSbVLaP9kJeMcs51
K9kAcIGpGM0e1DDq6ZbL21AyMUFyz3kTLSqaH1ssIi3AY/SxZ/aQTatLLK5UJpHB
ROzzUt90LAgMCPYQVqMX3IMVsbCPfYtDdvaM43n29KbPwPXvK+PuRSFXjksTvPAY
ZaxNxR65OQk/OJoyKfAidSzwplpLjXieWIIXqEEySb/dtfdV+x5UoJKWm8QA2QM7
KlYtcJU4eQ9SZxIz2byv2KD9DLxQvZUa6X6tQbF+h/pms1CV04e7n9SCiLYbxhom
fxEIRr8RF0mBvJGySS7/SwRRvQos05u0iUHRr2AOVl7RRbcXERqx97HkfWgUUiQc
OybIFK2g+bApNtURLxD5J0qACAbr6aJ5fp1PAdVtlJu50xcGhRNP1cRJSy+mLQEo
Qguln6r4skWnDtsJgi1/gOAbWRClxdB/oUUbwrlNsxLhdBS46BWsyNYIEtqaHGZv
8iM/Z7OTQ3hmXqWaN6dOtoTEIoMHwLZ+UJ50Ja0kT8gFksIFdZINrn99ag24e7uq
8tLnyR92dW+picZesU/R
=RvCl
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
