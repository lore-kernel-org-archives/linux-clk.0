Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 20 Oct 2017 09:43:24 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.15
Message-ID: <20171020074324.y5ykvzhst3uq6kbz@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jn73jf6ydh3ivsr5"
List-ID: <linux-clk.vger.kernel.org>


--jn73jf6ydh3ivsr5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following changes for the next merge window.

Thanks!
Maxime

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.15

for you to fetch changes up to 4328a2186e5120cfd34c4f04c6e4b7e74fb8b7b4:

  clk: sunxi-ng: sun4i: Export video PLLs (2017-10-17 19:32:16 +0200)

----------------------------------------------------------------
Allwinner clock changes for 4.15

The most notable changes are:
  - Addition of sigma/delta modulation for the audio PLLs on the newer SoCs
  - A83t Display clocks supports

There's also a bunch of minor fixes that didn't have any impact on current
features provided by the kernel.

----------------------------------------------------------------
Alexander Syring (1):
      clk: sunxi-ng: Fix missing CLK_SET_RATE_PARENT in ccu-sun4i-a10.c

Chen-Yu Tsai (12):
      clk: sunxi-ng: Implement reset control status readback
      clk: sunxi-ng: sun6i: Export video PLLs
      clk: sunxi-ng: sun6i: Rename HDMI DDC clock to avoid name collision
      clk: sunxi-ng: sun5i: Fix bit offset of audio PLL post-divider
      clk: sunxi-ng: nm: Check if requested rate is supported by fractional=
 clock
      clk: sunxi-ng: Add sigma-delta modulation support
      clk: sunxi-ng: nm: Add support for sigma-delta modulation
      clk: sunxi-ng: sun8i: h3: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun4i: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun5i: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun6i: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun8i: a23: Use sigma-delta modulation for audio PLL

Icenowy Zheng (2):
      clk: sunxi-ng: add CLK_SET_RATE_UNGATE to all H3 PLLs
      clk: sunxi-ng: add CLK_SET_RATE_PARENT flag to H3 GPU clock

Jonathan Liu (1):
      clk: sunxi-ng: sun4i: Export video PLLs

Maxime Ripard (1):
      clk: sunxi-ng: Add A83T display clocks

Ondrej Jirman (1):
      clk: sunxi-ng: a83t: Fix invalid csi-mclk mux offset

 drivers/clk/sunxi-ng/Makefile             |   1 +
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c      |  28 ++++--
 drivers/clk/sunxi-ng/ccu-sun4i-a10.h      |   4 +-
 drivers/clk/sunxi-ng/ccu-sun5i.c          |  27 +++--
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c      |  40 +++++---
 drivers/clk/sunxi-ng/ccu-sun6i-a31.h      |   8 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c      |  38 ++++---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c     |   2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c      |  21 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c       |  56 ++++++-----
 drivers/clk/sunxi-ng/ccu_common.h         |   1 +
 drivers/clk/sunxi-ng/ccu_nm.c             |  25 ++++-
 drivers/clk/sunxi-ng/ccu_nm.h             |  25 +++++
 drivers/clk/sunxi-ng/ccu_reset.c          |  14 +++
 drivers/clk/sunxi-ng/ccu_sdm.c            | 158 ++++++++++++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu_sdm.h            |  80 +++++++++++++++
 include/dt-bindings/clock/sun4i-a10-ccu.h |   2 +
 include/dt-bindings/clock/sun6i-a31-ccu.h |   4 +
 18 files changed, 457 insertions(+), 77 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_sdm.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_sdm.h

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jn73jf6ydh3ivsr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ6akcAAoJEBx+YmzsjxAgKjcP/jffBoZPHBatdqiEdRaNVIRj
ERT7OTxZD4gKbMkpDTUm2rWBjhAAn9ag5gR7zzZRWdXRi0eNFI3WaUnM+qEq7VMZ
FEXeV0Epk0A+bD208TWhe/hFsRLrabr/zT4skLGDe5vscli1oRsnY0ktunWgwHrd
N+x3TIHlFIuWSEO8qGO2OMHeEixgUHuW9/UNnI//qa69uxJHRlUe1totgn3udjqY
p2Ksdh9DBDBvdZZlpfIqP9WQW9ALp8gAOyApHpaEL83uIAGB3CsnTpFO2QYsrBxK
wWClAJ2Um5zympPc0uLQF3X57bhufSV29jwdzsc74o16z4E3OlkROwrlh86A80Jg
ldZnqwgo8NEQmNAiTgKM0en24X1kjrzmnsy1mLpaWVO21TuEFPisGyE4hhmVhatr
qDp11AznxJ6l+U4xrXGobqK7ZYVjhIPwmoJCvSqEm1gsKQ+u1H7/VQjzqQaqNc6Z
YnUPqfvtZA954b0sXT+hdrasIfmwxuWSGZB/zXuEP4xjfzPfEZmZW3oORQ6htSQk
3xkkleSJMlTI4rZzRkazVe6JIXv6yX4QZuj/UTDMt6JEJKQWlQC4+1CCEbCyDu/V
Xx9LefopAbGotGWDrytlinSLgLOdU/8IVsviX/59f4VCYEs5PBxiENr0QIJKoROX
g7YkclpFAm4iMuIOj6Ef
=QMDv
-----END PGP SIGNATURE-----

--jn73jf6ydh3ivsr5--
