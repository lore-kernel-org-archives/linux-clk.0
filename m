Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 29 Sep 2017 10:47:55 +0200
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
Subject: Re: [PATCH v3 02/14] clk: sunxi-ng: sun6i: Rename HDMI DDC clock to
 avoid name collision
Message-ID: <20170929084755.vsbqn4bq6z2n7c64@flea>
References: <20170929082306.16193-1-wens@csie.org>
 <20170929082306.16193-3-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xy6qbslaheqpye3t"
In-Reply-To: <20170929082306.16193-3-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--xy6qbslaheqpye3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 08:22:54AM +0000, Chen-Yu Tsai wrote:
> The HDMI DDC clock found in the CCU is the parent of the actual DDC
> clock within the HDMI controller. That clock is also named "hdmi-ddc".
>=20
> Rename the one in the CCU to "ddc". This makes more sense than renaming
> the one in the HDMI controller to something else.
>=20
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xy6qbslaheqpye3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzgi7AAoJEBx+YmzsjxAgjsoP+QH8P/BNG52QblxUFTms57VL
7dq4YRnOfdJKUPPka8p+fFUN9kEOYmvor5+XNn78ep0RlYGmWUjOvY6Y8uKu7MY4
KYmtokxQ7XA1OpPQ2gyXd6pIxkDXniujkBqBsDKZQy7ZOz81dDJxpkRKGpFky/IQ
AgQSGHh4pWJww8lUY1Yzt1IxkAQy13zLUfyDPghBR2yGsd1a0UaYlO3u6jqq9+3k
+khyeUqO1aI4txyYqR38QZ/wAIZF/DRbX2L3gYgjSOKLnPM83g2+DXHQHlZyM0cN
aY6EWibfEKczay4U5dceMwFbxj+DUBsYU3Aw6yZAcl11ZYleloFZVII4LR5Ei2o6
jOmhOpSfS4v0IqEGTWL0++RMbhxCx3v09wZZyeS3nfgIySfCMla4NTPn8fPb8Yo7
9c79r32mlsfaYFgpD6UnFDpjuF+13djd5DMn+k8AelHS9NwgLVIFEpwEsI9M6WjR
dzJOHgTrRtaolfp5oo3JBjyhHKSbcvIw/Nb8vv3SBI8yYKVV/SOp9HenQVtTyx4g
9OLZ27OWXb2Ay74HbCHfJFsJNN5ANtUTfUrd2NIef0PbPdc+OaEk0+NgKAMi+M0W
p62C+TxQ+5z6FAFdk4yZX6QgnBcg/qWCH82PhE8/Rl/9QvkTjFz22npR3/GuHc2H
TLXZSWHAF4Bt+YnA1yjb
=TFeN
-----END PGP SIGNATURE-----

--xy6qbslaheqpye3t--
