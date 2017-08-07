Return-Path: <wens@wens.csie.org>
Date: Mon, 7 Aug 2017 10:43:59 +0800
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner clock changes for 4.14
Message-ID: <20170807024359.s6jj5wlgrd3fxe2k@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qyoseamnlebcrjg2"
List-ID: <linux-clk.vger.kernel.org>


--qyoseamnlebcrjg2
Content-Type: text/plain; charset=big5
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here is the first and possibly only bunch of patches for 4.14.
These are all non critical fixes.

Thanks!
ChenYu


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.14

for you to fetch changes up to 913c3d85b4b562e38242765baa95113c8c7f1c14:

  clk: sunxi-ng: allow set parent clock (PLL_CPUX) for CPUX clock on H3 (20=
17-08-04 12:05:33 +0800)

----------------------------------------------------------------
Allwinner clock changes for 4.14

Non critical fixes:

  - Fix sunxi-ng/ccu-sunxi-r.h header file guard macro typo

  - Make fractional clock modes really used and correctly configured

  - Make H3 cpu clock rate change correctly to be used with cpufreq

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: h3: gate then ungate PLL CPU clk after rate change

Icenowy Zheng (1):
      clk: sunxi-ng: allow set parent clock (PLL_CPUX) for CPUX clock on H3

Jernej =C5=A0krabec (4):
      clk: sunxi-ng: Fix fractional mode for N-M clocks
      clk: sunxi-ng: multiplier: Fix fractional mode
      clk: sunxi-ng: Make fractional helper less chatty
      clk: sunxi-ng: Wait for lock when using fractional mode

Matthias Kaehlcke (1):
      clk: sunxi-ng: Fix header guard of ccu-sun8i-r.h

 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 13 ++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun8i-r.h  |  2 +-
 drivers/clk/sunxi-ng/ccu_frac.c     | 14 ++++++++------
 drivers/clk/sunxi-ng/ccu_frac.h     |  2 +-
 drivers/clk/sunxi-ng/ccu_mult.c     | 10 +++++++---
 drivers/clk/sunxi-ng/ccu_nm.c       | 19 ++++++++++++++++---
 6 files changed, 45 insertions(+), 15 deletions(-)

--qyoseamnlebcrjg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAlmH0+8ACgkQOJpUIZwP
JDDzjQ/+JvDsN5Qm00uG7gXn49HaKPlYhEbKbc4paThpdoWRD7R6QBow6zIoITBB
8H1JMXtVMOATbJxnOkyVxjwpC1lE/E3bigseAUb+Ezt9pF2RL063srF2es4LYbUN
uTjHjAptp+yTiE/mrLpRszv/xkC7ZBfhkOI4mb4SMZrgl8UjAsI72NDuw12kgl5w
jybcKMdSRQJUf8z5NIVuAbZWvBFjCcDzBw65tXI0KL/RVPhJcjxat8jxIE2E7373
QhCt0ogG7YuMl/o+IoGt2TN+7AOJ/yYmYPKxgxrGyb7dNSMPT5C5RnklBHxKCnVH
FhyRq+lXdaTuDDrnmzBHgeiDIbzw65GIyOvCrMBLvaziX+lp2NYC52euuQt4R1yN
22/6V5k7dlaDdkeIfkTX+87Kdmy9wm3nFV5zDAeXZwDFsNXOICgq4U2WjU1BWnli
y8QEvaYw2SVmJMsBEzbeQcFRCY8L8p7izdgT3L5Q6VVAib1BNkWv2YOapntgicnW
PYJ/daBoh1JAhDehs15u9rkYNyU31eBQlbM1mYT2hlPloOngCHKNfIf1O8qcGQAC
CG/VxSh5jdlmc9espAV8MLPjHMtGs7SaDWfFh1IRJwoFurm71jkfYwAqCVCi0C8v
arUgjqwjvx3yxr1cnq16/gQDYQHJnueXLW/mlnefn8LTIsiS6/Y=
=vki3
-----END PGP SIGNATURE-----

--qyoseamnlebcrjg2--
