Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 14 Jun 2017 21:21:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 4.12
Message-ID: <20170614192119.xktlt4o5puje2pdu@flea.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="njkjuo6jn7iu6dzg"
List-ID: <linux-clk.vger.kernel.org>


--njkjuo6jn7iu6dzg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following patches for 4.12

Thanks!
Maxime

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-fixes-for-4.12

for you to fetch changes up to d85da227c3ae43d9ca513d60f244213cb4e55485:

  clk: sunxi-ng: a64: Export PLL_PERIPH0 clock for the PRCM (2017-05-31 21:=
57:30 +0200)

----------------------------------------------------------------
Allwinner clock fixes for 4.12

Some fixes that fix some bindings that went in 4.12, fix a few reset and
clock offsets and a build error fix

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi-ng: enable SUNXI_CCU_MP for PRCM

Chen-Yu Tsai (4):
      clk: sunxi-ng: a31: Correct lcd1-ch1 clock register offset
      dt-bindings: clock: sunxi-ccu: Add pll-periph to PRCM's needed clocks
      clk: sunxi-ng: h3: Export PLL_PERIPH0 clock for the PRCM
      clk: sunxi-ng: a64: Export PLL_PERIPH0 clock for the PRCM

Yong Deng (1):
      clk: sunxi-ng: v3s: Fix usb otg device reset bit

 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 7 ++++---
 drivers/clk/sunxi-ng/Kconfig                          | 1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 | 4 +++-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c                  | 2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                   | 4 +++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                  | 2 +-
 include/dt-bindings/clock/sun50i-a64-ccu.h            | 2 ++
 include/dt-bindings/clock/sun8i-h3-ccu.h              | 2 ++
 8 files changed, 17 insertions(+), 7 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--njkjuo6jn7iu6dzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZQYyvAAoJEBx+YmzsjxAgRIIP/24k+HRPDGk62mUB0CBSrAQZ
8zcOQmn4ej5tHj18AZigJuw+nsVqhcm9VmloTzIcBPkaTh1qx8N7ZriUMrV8+9Pk
8qd6uwTX3zuWi2DXn0vkPkEmIqn8YoE71RF70E85bKe9hbqyKAAY14StQl3JT5np
aEdJFF8ZKWN6B3f9q669Vo2WJaRcA0qZeso141YpSra9QYWvDvRxU8329nfgO+3v
HKWag+XB3Du61BnhKj4eIHR28Hw/UD1sSIdWm8pWNAgPYO/EWtkSFHVMeNgQVm2m
l9eVgR3vT0Km8LgsxzvwrzEhAkAVBBUS5Nffa0Mp49DJG+Lw3FfEtLc1aupgJ+K4
a3KCAS5MLtU20yFpRo6EOphx4u24qM6kbd6cCDmGPD6yThlF8rFvHWbNbsnmdlRN
8UIZ9tapseH2m6eeIN4PgHm7/LsRjxuA+odJSEZmVd6N6hMjYjFui1E+YZsrb1Ph
cG60g8o2UNoVHIvfF3zo7rVIJ9/877yLSgpJQkdqPRMo86FDwScXrC382fgKFFIR
+nH05nzvVKt0+/ezrFBlITXPqhtjkGRYWIEkIyfHbP7z3J4D7ZZUibcXdOUyeOvK
Gssmz/hcYAgv4ACZKyHau5zQ/oGJUHko/e9zf9aIXWDVybJQQFKCIZiwMf69WbbD
HCq1tPnoQ32wdQKhribK
=0j6t
-----END PGP SIGNATURE-----

--njkjuo6jn7iu6dzg--
