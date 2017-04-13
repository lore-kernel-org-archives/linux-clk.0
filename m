Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 13 Apr 2017 11:59:38 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 4.11, again
Message-ID: <20170413095938.ac4zjp7ql6y76sst@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlbwklamz6koupsu"
List-ID: <linux-clk.vger.kernel.org>


--rlbwklamz6koupsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here is another PR, without the patches that you didn't want as fixes.

A few more fixes showed up in between, one of them being another build
fix, the other one fixing random CPU crashes happening with CPUfreq
since 4.11

Please merge it for one of 4.11-rc's, thanks!
Maxime

The following changes since commit b467e08a15563dede0d37d3233baa24fb97a7310:

  clk: sunxi-ng: fix recalc_rate formula of NKMP clocks (2017-03-20 10:34:0=
5 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-clk=
-fixes-for-4.11-2-bis

for you to fetch changes up to 372fa10172a2f9e1bfbc70778449628e82b72341:

  clk: sunxi-ng: a33: gate then ungate PLL CPU clk after rate change (2017-=
04-13 11:22:04 +0200)

----------------------------------------------------------------
Allwinner clock fixes for 4.11

Two build errors fixes for the sunxi-ng drivers.

The two other patches fix random CPU crashes happening on the A33 since
CPUFreq has been enabled in 4.11.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      clk: sunxi-ng: Add clk notifier to gate then ungate PLL clocks
      clk: sunxi-ng: a33: gate then ungate PLL CPU clk after rate change

Tobias Regnery (2):
      clk: sunxi-ng: fix build error without CONFIG_RESET_CONTROLLER
      clk: sunxi-ng: fix build failure in ccu-sun9i-a80 driver

 drivers/clk/sunxi-ng/Kconfig         |  2 ++
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 11 ++++++++
 drivers/clk/sunxi-ng/ccu_common.c    | 49 ++++++++++++++++++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu_common.h    | 12 +++++++++
 4 files changed, 74 insertions(+)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rlbwklamz6koupsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY70wKAAoJEBx+YmzsjxAg9HYP/iFFZw5O3I10hO3CRfht2sx9
Dp9kjnkOPmy7O4XOohe8NUAhDNc+VMEf0d7p3N6rfvZxuxdWUwnkrsGx3Anj3421
hwh/1Sn43c3IlqqcgEQ+/GTW+5vh8wUKFxtC1GxWHXw/qN5OlSPQduFBzoEPXj0h
rOokujP22rA6oMLnYiE55fvWW0hRq/AjZDvSKimWdGi42g7VIkn3grEFgbvOqWlv
p6As3FX7BJzeVdWAftIjoTl3tGNSp1iGhOW6TagPbTzkuHH4mAdLJsoJ6oHnII+M
Q07kHNeDrkko3x6t+KJiCL0+rLJAi/mnad2N1IpX4TVyu7TSFaHmIbFsXImK3Lzs
Ux7KUI9jobOB5l/3/UrH+XDiHTTbPDxwo+HCATtHx/yMoXw97x4cRvHl33cjS+ch
ukaNofno/DqqYqLUun1MRXA88YP9lneGWA6zKc0ojw3lUv2lynmy1hF9ZmVG6ow0
2Mn/zQE/8PRPlRBdfmyuxOIN6uvUIcGyky1o5QSDoGlXQON34LmP+a7ZHpO8M5e2
OfMJ8unAoi2FiMnROea4RmB1VqEGMEvxyf6uf0IlbhNp6wEiZduZUpEWS5/szaBF
cgL38vlB9ruqJw2UWCvc+4ThrzT9y5hD/NyzrsaVR6od37Fa15cgxlrEd3UGtdhI
s+5Tt3hRMFWD+D26I1PR
=58ZZ
-----END PGP SIGNATURE-----

--rlbwklamz6koupsu--
