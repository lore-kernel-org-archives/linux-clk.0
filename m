Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Sep 2017 11:32:47 +0200
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
Subject: Re: [PATCH v2 02/13] clk: sunxi-ng: sun6i: Rename HDMI DDC clock to
 avoid name collision
Message-ID: <20170926093247.blcu52dzluqawzb5@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-3-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4hidansbmszwo3hv"
In-Reply-To: <20170926065919.24446-3-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--4hidansbmszwo3hv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:08AM +0000, Chen-Yu Tsai wrote:
> The HDMI DDC clock found in the CCU is the parent of the actual DDC
> clock within the HDMI controller. That clock is also named "hdmi-ddc".
>=20
> Rename the one in the CCU to "hdmi-ddc-parent". This makes more sense
> than renaming the one in the HDMI controller to something else.
>=20
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

I'd rather stick to the datasheet names. What about "DDC" ?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4hidansbmszwo3hv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyh6/AAoJEBx+YmzsjxAgQO4QALB420PC2F/Onf1As80O01IL
yXOMB+atYGkwwejwNmW8i9Fk4H0riwhYvKDh+IbkVH8rptheAYzqSvukOsZRQEXY
BQ9a85em8k3XT7EVvDXqEFqT0p3QIeZI19PTVPEeK2t7Lk56eWDvW9D0I0S3MgI7
O0Pc+k+FXnvMVAiKnD+J/s6NK5Djbvpi26KULaBX3kbsSP5LJZUvKFXqm7sMk88X
KgrMvesu7KMB9Q2vrcCjjYR3BEa9BbDfdxNT7E7MSCQ1Q8MYJwNdQQBQ5R91Ywc5
544NSlG6c3haUMHi3UYpFt55T3EiaYPksCQE8VjMjso4nxs2CS2kjwi/9VK8bkD4
y2/YeBg4F27JOxIxZ4AHuN7ZzdRT8F4HZgwTUh5Wt2qAuWa5sPuEanjlCjBc5x6w
HXmfIASaIeS5iT300X13iYieDGxXhOfxzF2zqEkZj2/T0NfZ9VEmw9jfivQbpgBr
Vu9qntEsS2VgHk70KiW3iqMbS3xDDKeYCRbluXJSNaCk9lpjI4n6jQvTIUjXQZSp
SavBIuXXm9PXAv8mmzGd7E9lLEE/1RyYGDTb+1Lxrpwl+Zkw5Mgg+aGcdz1JdJU3
CfajykZduus90ASKCOzCO6PjC/HTidEI2wZ2Hr0SrIRkmG5VRB4CyR68iNVuveoi
nKLjYY+xp7OCvlCgaJ3d
=UQ9Q
-----END PGP SIGNATURE-----

--4hidansbmszwo3hv--
