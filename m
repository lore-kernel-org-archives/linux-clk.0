Return-Path: <wens@wens.csie.org>
Date: Wed, 2 Aug 2017 16:15:40 +0800
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner clock fixes for 4.13
Message-ID: <20170802081540.kzy2q7qo4lb3muxt@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yvjd62nhq3qvajbd"
List-ID: <linux-clk.vger.kernel.org>


--yvjd62nhq3qvajbd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

I will be handling most of the Allwinner pull requests for this cycle.
Here is a critical fix for the sunxi-ng clk drivers.

Thanks
ChenYu

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-4.13

for you to fetch changes up to 9735ee9e3cc3ba113ac96b0368ef3f1a73092a23:

  clk: sunxi-ng: sun5i: Add clk_set_rate_parent to the CPU clock (2017-07-24 11:37:04 +0200)

----------------------------------------------------------------
Allwinner clock fixes for 4.13

One critical clock fix for sun5i (A10s/A13/R8) which enables propogation
of clock rate changes from the "cpu" clock to it's parent PLL clock.
This fixes cpufreq related crashes that have been observed on KernelCI
with the C.H.I.P. and multi_v7_defconfig.

----------------------------------------------------------------
Maxime Ripard (1):
      clk: sunxi-ng: sun5i: Add clk_set_rate_parent to the CPU clock

 drivers/clk/sunxi-ng/ccu-sun5i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--yvjd62nhq3qvajbd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAlmBiigACgkQOJpUIZwP
JDALMRAAx9ZuQBMVpvlHMYKUDIwyN6LMAw83TaDCmkrReURp6AVASWV116iq/bV+
kvmtoQlMM+TOWgX7xck69jC3cpR7rxT8YjeyQE7XmKvM2jXwz/JFsRgOIX+7Yof4
CGvfH5EOKV8FPP5E+TYEhjZmG27vWzv90IFUZaHhcP6RtZjHYzvBNJ0FWJ98qICV
a08E1VcMyvw3rPvmWTXziNvogXCdrpuKsL+r3TAxeZ2tUVISTzgx9HXN283Y+90M
N3DhjNtlNRcDdCig448tGHacca9D1a8FHfj3BMZK8lrv5gIVvre9aAA+GE+3fXfQ
H2JgAWdaFq3kT2OX9lxXPbOXhfABKoZ64UA4BIwq7Eadexxr8nx1CFVrs6uS+Yye
m382KCg1mDIwXvEmXzj4Sv+TIdUSrxLSyOeI3v95Yxis8PjIo+IW2HaQGaQDmXeq
k/k6MHxO7op6pHFdixP/6W0v2UZHry5tnxOStQeggOx8FjQtiFq0bfxgPjf045kk
Klgp7EwjbbrVC6w2yR+9P1+BJNG2mjmTXbI0b9RIUagasCdbFJnUC1j20+1lgX+q
bNPeo4ciOrGhsYnAtUyVO/0YWf8cxva6BJYSMsAUQ7QdiqhWTOmRXt1JAr79lUX2
0n0pRA9g/vTb+jjb63fuQF1entgWZhAzgqlHxoh/UPFYNyWPB1k=
=7sfB
-----END PGP SIGNATURE-----

--yvjd62nhq3qvajbd--
