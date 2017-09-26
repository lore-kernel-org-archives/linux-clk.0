Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Sep 2017 11:56:29 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 04/13] drm/sun4i: hdmi: Disable clks in bind function
 error path and unbind function
Message-ID: <20170926095629.hp3igc4zx7u6yn55@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-5-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tpspz472yzsgjpbf"
In-Reply-To: <20170926065919.24446-5-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--tpspz472yzsgjpbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:10AM +0000, Chen-Yu Tsai wrote:
> The HDMI driver enables the bus and mod clocks in the bind function, but
> does not disable them if it then bails our due to any errors. Neither
> does it disable the clocks in the unbind function.
>=20
> Fix this by adding a proper error path to the bind function, and
> clk_disable_unprepare calls to the unbind function.
>=20
> Also rename the err_cleanup_connector label to err_cleanup_encoder,
> since it is the encoder that gets cleaned up.
>=20
> Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tpspz472yzsgjpbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyiRNAAoJEBx+YmzsjxAggowQALHnTI21BOWs96TP7Ykj9CI3
O6H+SivibXJfBrs27usEAg/EHInlMmwUujOD26OQCD7yjJWFiVjNznb6Lu+/OWdE
l3SbfqBDvCc/i2Woy9A1UaGjFOax+VHAXTkzzEenTGwZ7ZiWkun/jUtNPf9/9vKD
r1vR/ZD9XOBMZW0M26JBOe70neMYdOsy+RAvAaPZnLNsTfKr/Yya8GeQbNApyYmS
f+ni6cZ16SqkTFBVe7eOh6yKD9HpTuVDdD8T0wlPnihc8KOM/efPBKX2AGP+pza+
hSEk3+pEbh/DaCCUo7n09Mu+DjDZCCYvIPC6xHYhVEJGjurTsXd8giCjUojtOCqk
jKFrXfBTP3ChW1Xqrh2KcVu9MR5f7m2dBZMlcP5BeD1tX4qErW7DOUuwTo8x5zYc
s33XIdkfCwdUDDhoVMLa61DC4grYuRiBOmM4GLF93+qWJZs6S5ip/ccG+dIRseMu
LbBFOGMyg1F3BdgaqOaw0mJcaAZwSDoCDYpAdf8MqAlUonaKx9Lqxvy7Nnml/DeZ
BR36y/mU0bqT6SHhv7RR1RxPRPGybPkLVUzyfBLqwVU4+GsBLqTRoDKk0HFaqA2Y
xNkPtdNbf5GcsDR8HfYz2AkxibASnY2MrvH8mp9TK5g2TcofMHcCpuzduRF+LtTb
atUY4p2IqWci83DGnKPa
=u+Js
-----END PGP SIGNATURE-----

--tpspz472yzsgjpbf--
