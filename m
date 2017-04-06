Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 6 Apr 2017 09:41:21 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 4.11, bis
Message-ID: <20170406074121.tkivdvghbr27tr54@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s7hpnb46w62idibh"
List-ID: <linux-clk.vger.kernel.org>


--s7hpnb46w62idibh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following changes for one of the 4.11-rc's

Thanks!
Maxime

The following changes since commit b467e08a15563dede0d37d3233baa24fb97a7310:

  clk: sunxi-ng: fix recalc_rate formula of NKMP clocks (2017-03-20 10:34:0=
5 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-fixes-for-4.11-2

for you to fetch changes up to d054a839a0986136374d49f9f9fbc264abae9c4c:

  clk: sunxi-ng: fix build error without CONFIG_RESET_CONTROLLER (2017-03-2=
7 13:37:05 +0200)

----------------------------------------------------------------
Allwinner clock fixes for 4.11, bis

A few patches to fix a build error and a few minor typos and bugs in the
sunxi-ng code

----------------------------------------------------------------
Chen-Yu Tsai (3):
      clk: sunxi-ng: use 1 as fallback for minimum multiplier
      clk: sunxi-ng: Fix round_rate/set_rate multiplier minimum mismatch
      clk: sunxi-ng: a80: Fix audio PLL comment not matching actual code

Tobias Regnery (1):
      clk: sunxi-ng: fix build error without CONFIG_RESET_CONTROLLER

 drivers/clk/sunxi-ng/Kconfig         | 1 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 3 +--
 drivers/clk/sunxi-ng/ccu_nk.c        | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkm.c       | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkmp.c      | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nm.c        | 4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--s7hpnb46w62idibh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY5fEhAAoJEBx+YmzsjxAgPLEP/Az4J3gk/qgldTBraKxxhCrF
tU4j+HxS1DrBL+nNIzo2T0iOirSdSnttvDQZHgVx2U8cWqdhSj/aJTS3sKbovUHE
Vipn7CkANAr8lVX+fI0URsTgmHi2fEj//lCFIySup/1rpr/Y5inLqb2kL03RQxg2
rWz6kWrTa4sQL6gQdu/PoAKVDSq6M1jY/Mmqk+/L8yBQ2wZFmlKlSJJ9uLhMCR+U
tOD6Vqcu6KxMC1ACWgZXoZ7dHXb/UWVl3lrN4FzIVOOUzgFxi1Cwuoz427jXwoIr
VK5OdAlwfytvweklYANfyW8EwPTwda9UV+GvHv8KqlC0Sm7HmldbmFHrQOlk7bWp
1pCa6lFVyzIAQggs610upM5Zw09TjKqEke/ssy+V8mG2zIwp9lGLTQuon71Qw+3J
Kz7dyyiyeZ10gYNmc6kZM0LLhL2IK6HPIPK/DV1VHFSzdz4CWVH2yU0beG/mQAnh
ubySIBiP04m7X/R+9kaTZmn35Ju+rJ6vBsdh8IlvKt4EDpUDF7AEihdkw0kBFCZF
F3vbnUy7ybGwqz3iNGOoh809q0XtlY0+3I5my4vUKKqlH4t3msbCl6RDyF3WcdZF
qI7fRgUvUqTDd0oYWoMoWiU4FxW6ONQgfUWNxA96Q3KaHvCsiNPjk5/cDCx0Lg2E
5KCQW8v3WgvPd91nLbYJ
=eMfE
-----END PGP SIGNATURE-----

--s7hpnb46w62idibh--
