Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 7 Nov 2016 12:27:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mirza Krak <mirza.krak@gmail.com>
Cc: swarren@wwwdotorg.org, jonathanh@nvidia.com, gnurou@gmail.com,
	linux@armlinux.org.uk, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
	mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V4 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Message-ID: <20161107112753.GA28616@ulmo.ba.sec>
References: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
 <1478507405-13204-2-git-send-email-mirza.krak@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
In-Reply-To: <1478507405-13204-2-git-send-email-mirza.krak@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 09:30:00AM +0100, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>=20
> Add TEGRA20_CLK_NOR to init table and set default rate to 92 MHz which
> is max rate.
>=20
> The maximum rate value of 92 MHz is pulled from the downstream L4T
> kernel.
>=20
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> Changes in v2:
> - no changes
>=20
> Changes in v3:
> - Added comment in commit message where I got the maximum rates from.
>=20
> Changes in V4:
> - no changes

Applied, thanks.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIGU2AAoJEN0jrNd/PrOht9AP/0roeEvmAvdXBNDHsabHt6md
rTyHNMy4pyI/nrV6UJCqDZdsyd90r02hclwT8wSzRUqlb8Nb6MkoV399An5TjDp7
iuIj/ENZ2U2Zy/wsiDuOvs+j9Yx5AII9fabPc635rkjgarTkTmgVXOh4i7KWfqEC
dAogdbbcsVNnmigmU/MY0nHwMyRqTQg/0oifcSnnncdtHq/U8UFkqx78GAmAI6gp
7hecLkzALHq133LzFD+d4w9iAH+yuNac0L5/IgzMFlSul7Bna1Wq3sIxtanMhYCu
2ff6l7GXfF2m2hNG5W3MrN6dh3LjoXkqCQLWoeYCbI63js3c49UvPdg2si2VIP9I
Weqx8/RKafOCwkcCSdCYCjatoA7ru6lrnv0ZQeuNg+bNEUEWYuBQbnhnQtx4PNXc
O5xlw0Fw3nJ6ga8A46AUdqRvOk+Qv1wNaAU6Grx8Mw69dVmsuxXqsE9v5TCFwotZ
M2zliYjMsKO3/pk8U4R2Z3CbagG91FNs9nJyaM1av3tp/lU6OzWWmbKQfEQ8lepZ
Q3BlnsehHJ65CvIbx3GLp789q0QfllyL9D3tYMkm8wFn3vQ/yDDH19R2ONsGiN87
PLLI13BmK96omNhq8sTaPxb1vNnIJjtewoyavHJTjbyL1ygCrpAVCeAyieM7+Rh1
CzaYifKKB3m4BEDWInb9
=CBbR
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
