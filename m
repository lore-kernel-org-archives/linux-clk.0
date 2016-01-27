Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 16:50:54 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 02/11] clk: sunxi: factors: Make struct
 clk_factors_config table const
Message-ID: <20160127155054.GF4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-3-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
In-Reply-To: <1453727747-23307-3-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:38PM +0800, Chen-Yu Tsai wrote:
> struct clk_factors_config contains shifts/widths for the factors of
> the factors clk. This is used to read out the factors from the register
> value. In no case is it written to, so make it const.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqOdeAAoJEBx+YmzsjxAg1SoP/2tHAd8oO3PQPJ27F4c9Qyqs
Q8/w8PnPxq1hTGVqNqAjukcf4DD15xj3MmPhoqqwNtvaMH7ZhkIpsfaAwh28zmhW
A5xUKKY9uTv6Atz/VzBPUoUdS1tLsbSPp1g//vSIcWgP6IHylrL0eHJgFLPgs4nI
6vnH5HTlo/ibaQAj7lHGW0n8HIoMEZED2e/Mb39glgEqtCJlWqr8XEYHXzK/XFLu
v5BNdK67XEYAoGFcJ9wSbx9K+b/fLzYh28qDC5nRwGux3rV/0Ln6rXgJS9qRt0fS
CNeGM9Gl5uwguJ+UEMcePpkfSoDtf+7yRmMNApogbzDTZH1k3vIdZ3BeUaK52BhZ
p8baOiwJcQw0XaDeC8wqr/Ws6N+n5J4YkiypOZ67CM0KuefUhw8y9gL/JVxQcgCs
94ok6iWRmnrIe9tWVpZGAt5JETnUQ67V/wyMeFGoVsvi7DMYzxRRKm8fy7D0+k1U
dyRC33yZz4OBZAkLH5BqLxgBFLYs0E1VPYoIh5JWZTe73EtWddoiDXtmIgK/vdId
VgQ4nBuZqB8g/XtQ9hLQRMFWiNdfbTvsEBLzRaBkfC52Lo624SeZ4sV6FDbnSkqV
v69pYmzu69idQb8gjGPJX4sXpRNPcnyTfbOrT64cqkJXqK7CS74pNydEECiXvAnL
pzKDOeswytkFwUmTf2U0
=CA/B
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--
