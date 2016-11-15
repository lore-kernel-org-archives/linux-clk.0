Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 15 Nov 2016 22:23:32 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner clock fixes for 4.9
Message-ID: <20161115212332.w5amyhohmauqzpe5@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fafanrkxxkzcp5iu"
List-ID: <linux-clk.vger.kernel.org>


--fafanrkxxkzcp5iu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following fixes for the 4.9 cycle

Thanks!
Maxime

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clk-fixes-for-4.9

for you to fetch changes up to ac95330b96376550ae7a533d1396272d675adfa2:

  clk: sunxi: Fix M factor computation for APB1 (2016-11-04 08:49:46 +0100)

----------------------------------------------------------------
Allwinner clock fixes for 4.9

Two fixes, one for the old clock code, one for the new implementation.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun6i-a31: Force AHB1 clock to use PLL6 as parent

St=E9phan Rafin (1):
      clk: sunxi: Fix M factor computation for APB1

 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 12 ++++++++++++
 drivers/clk/sunxi/clk-sunxi.c        |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fafanrkxxkzcp5iu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYK3zUAAoJEBx+YmzsjxAgsAAP/jfFFqXU9V1A5wX6d0ae+kId
5GNenHsM/rh4wxJGGgpVcC3o26eeRUVaIkd9ljAb5o0TM7mPCNzIKrvE9msfvl/9
HKEfg+Vs1wOomVsiDFqMI08YeSisryDJre7n1sL7msLvvp4SGPYUW4c2ul9fw92L
QtsHvcTN2XkVBGspUmswE9i7dHH0ERSqCQqidXWdQ4ynrRqt/Bl6ewSQWDuoePn1
6+ERuYsSDvethnbXuZ0l2kQk5PY5G/qRUqS/HTHo4epmd7AdADB8vwObz1w34LuE
u2hLs8EGpw+8DPCPmupiHsm33C6COu8NZMh2GPXBUwBpE4ldPLcLppOeSrXBQbe0
yWiozDRSNQenXGcVjVAo/TMEOJE9w2bvdWpjmhNpuDyifl5aeayPzO5cZ9DpnL0A
GTehMDNAaXRZ5JphBdgkZStSeaBLsPN3YIXCo7gHSxSCiEcx+FcwnnOonndVmwOM
mzAI4JZ7II8IEihgJSEv+JzucLhDCH35KD+QAE8iP1Qd3D04Hi2HPau9k1+Kx/8A
dktLaGkBEsBxk22nnJ3KmJqx5OyGil6kfOFzmWN5s/FXBZyqZxymFaRu/ksrshco
KZcE1wtyLutda1NDNpYr90Poi6ZiYF6Xct7fwpSLx5sw8n91+BlKlChVWktQvwu0
Jb5jxjodsBPpmSSR3qET
=Eb54
-----END PGP SIGNATURE-----

--fafanrkxxkzcp5iu--
