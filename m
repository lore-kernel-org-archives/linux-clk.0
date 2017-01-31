Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 31 Jan 2017 09:40:10 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.11
Message-ID: <20170131084010.jht6mp6dlpbidt4j@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kqff4wyqw4cgonfa"
List-ID: <linux-clk.vger.kernel.org>


--kqff4wyqw4cgonfa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following changes for 4.11.

Thanks!
Maxime

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clk-for-4.11

for you to fetch changes up to 64507fe38de3eb7ed60f26843e0ddf1c565a9b21:

  ARM: dts: sun9i: Switch to new clock bindings (2017-01-30 08:39:22 +0100)

----------------------------------------------------------------
Allwinner clock changes for 4.11

  - Support for one new SoC, the V3s
  - Convertion of two old SoCs to the new framework, the old sun5i family
    and the A80
  - A bunch of fixes

----------------------------------------------------------------
Chen-Yu Tsai (8):
      clk: sunxi-ng: mux: Fix determine_rate for mux clocks with pre-divide=
rs
      clk: sunxi-ng: mux: honor CLK_SET_RATE_NO_REPARENT flag
      clk: sunxi-ng: mux: Get closest parent rate possible with CLK_SET_RAT=
E_PARENT
      clk: sunxi-ng: Support separately grouped PLL lock status register
      clk: sunxi-ng: Add A80 CCU
      clk: sunxi-ng: Add A80 USB CCU
      clk: sunxi-ng: Add A80 Display Engine CCU
      ARM: dts: sun9i: Switch to new clock bindings

Icenowy Zheng (4):
      clk: sunxi-ng: fix PLL_CPUX adjusting on A33
      clk: sunxi-ng: set the parent rate when adjustin CPUX clock on A33
      dt-bindings: add device binding for the CCU of Allwinner V3s
      clk: sunxi-ng: add support for V3s CCU

Marcus Cooper (1):
      clk: sunxi-ng: A31: Fix spdif clock register

Maxime Ripard (10):
      clk: sunxi-ng: multiplier: Add fractional support
      clk: sunxi-ng: Implement factors offsets
      clk: sunxi-ng: mult: Fix minimum in round rate
      clk: sunxi-ng: Implement multiplier maximum
      clk: sunxi-ng: Implement global pre-divider
      clk: sunxi-ng: Add sun5i CCU driver
      ARM: sun5i: Convert to CCU
      ARM: gr8: Convert to CCU
      clk: sunxi-ng: Call divider_round_rate if we only have a single parent
      clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for the GPU

Myl=E8ne Josserand (1):
      clk: sunxi-ng: a33: Add CLK_SET_RATE_PARENT to ac-dig

Ondrej Jirman (1):
      clk: sunxi-ng: fix PLL_CPUX adjusting on H3

 .../devicetree/bindings/clock/sun9i-de.txt         |   28 +
 .../devicetree/bindings/clock/sun9i-usb.txt        |   24 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    2 +
 arch/arm/boot/dts/sun5i-a10s.dtsi                  |   85 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                   |  140 +--
 arch/arm/boot/dts/sun5i-gr8.dtsi                   |  520 +--------
 arch/arm/boot/dts/sun5i-r8.dtsi                    |   10 +-
 arch/arm/boot/dts/sun5i.dtsi                       |  353 +-----
 arch/arm/boot/dts/sun9i-a80.dtsi                   |  404 ++-----
 drivers/clk/sunxi-ng/Kconfig                       |   31 +
 drivers/clk/sunxi-ng/Makefile                      |    5 +
 drivers/clk/sunxi-ng/ccu-sun5i.c                   | 1022 ++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun5i.h                   |   67 ++
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               |    4 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |   16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   10 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               |  591 ++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h               |   63 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c            |  283 +++++
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h            |   33 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c           |  144 +++
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h           |   25 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c               | 1223 ++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun9i-a80.h               |   57 +
 drivers/clk/sunxi-ng/ccu_common.c                  |    9 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |    4 +
 drivers/clk/sunxi-ng/ccu_div.c                     |   12 +
 drivers/clk/sunxi-ng/ccu_div.h                     |   10 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |   10 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |   30 +-
 drivers/clk/sunxi-ng/ccu_mult.h                    |   24 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     |   43 +-
 drivers/clk/sunxi-ng/ccu_nk.c                      |   22 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   26 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   25 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |   17 +-
 include/dt-bindings/clock/sun5i-ccu.h              |  103 ++
 include/dt-bindings/clock/sun8i-v3s-ccu.h          |  107 ++
 include/dt-bindings/clock/sun9i-a80-ccu.h          |  162 +++
 include/dt-bindings/clock/sun9i-a80-de.h           |   80 ++
 include/dt-bindings/clock/sun9i-a80-usb.h          |   59 +
 include/dt-bindings/reset/sun5i-ccu.h              |   32 +
 include/dt-bindings/reset/sun8i-v3s-ccu.h          |   78 ++
 include/dt-bindings/reset/sun9i-a80-ccu.h          |  102 ++
 include/dt-bindings/reset/sun9i-a80-de.h           |   58 +
 include/dt-bindings/reset/sun9i-a80-usb.h          |   56 +
 46 files changed, 4877 insertions(+), 1332 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/sun9i-de.txt
 create mode 100644 Documentation/devicetree/bindings/clock/sun9i-usb.txt
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun5i.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun5i.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80.h
 create mode 100644 include/dt-bindings/clock/sun5i-ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-v3s-ccu.h
 create mode 100644 include/dt-bindings/clock/sun9i-a80-ccu.h
 create mode 100644 include/dt-bindings/clock/sun9i-a80-de.h
 create mode 100644 include/dt-bindings/clock/sun9i-a80-usb.h
 create mode 100644 include/dt-bindings/reset/sun5i-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-v3s-ccu.h
 create mode 100644 include/dt-bindings/reset/sun9i-a80-ccu.h
 create mode 100644 include/dt-bindings/reset/sun9i-a80-de.h
 create mode 100644 include/dt-bindings/reset/sun9i-a80-usb.h

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kqff4wyqw4cgonfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYkE1lAAoJEBx+YmzsjxAgTicQALpOFUWYhhKqfrj2VNbuWEdQ
bh5sH8A2B7XBGLdc7RG0rEY5oGGUFBPiv7pvY4Jg0B01Jr0owkBZDFhO4fWCLpNv
CW+Akqxu3reRAXJirsU4usiaBcaieEoF9jGrthq6Rrks09AK4EhrkQt6cSZ4bVEU
6ndlTZ5TGenTcz27MMYDTDAFgY4U0xeLkUV25UOldA+HYJixWk6Depar1VT97oYz
7hnQ1pOJgvMx+pUWCGWF8mayG9hxR0hG3PbyJLkzP8fK7CMmY3tQ0V88SJG//nG8
6U+8HekrwWMQW61en1x7eyZD3fvHIk6rsee9FcfzOFflVAPpFLlhnTQa28v3OzeZ
lh4QAX36N8OcdCuD20eX1ZeOjWBu68hQhgO/+0I6iKIaL0flMRn7CWPk9BG92YSA
7PSae3uo1M75ddDHd7FyVnZbKV3ApS39E0bD5c48fiHv2S12aEzSjSPU2M7Xvl/T
uxJrfT4brG8vrpez5WeKGJdAQVIXaIFd4xsuzeKMmzxg4XE9Pjfm7kqewkwSjC4J
yIolJw7j2m4Va+6STBfZxPLRHAKG1HspD3UOXz3TpUKlDq+yJcCSHi/Z52Ct+H79
0Mxk7Yd/AMFg8zaX9ZqmpXHwjx8meWpT1bGOOfYK6Q7EgHIJczEHpHQnQI4ZP90P
+JuszzPpqO9PcJH29yJJ
=ChhY
-----END PGP SIGNATURE-----

--kqff4wyqw4cgonfa--
