Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 9 Oct 2017 09:16:18 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: megous@megous.com
Cc: dev@linux-sunxi.org, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: a83t: Fix invalid csi-mclk mux offset
Message-ID: <20171009071618.liicj4whwamozvku@flea.lan>
References: <20171005023314.21663-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjq36izgykdjiajx"
In-Reply-To: <20171005023314.21663-1-megous@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--qjq36izgykdjiajx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2017 at 02:33:14AM +0000, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
>=20
> Datasheet specified that parent MUX settings are at bits [10:8],
> but current implementation specifies incorrect offset at [10:12].
> Fix this.
>=20
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qjq36izgykdjiajx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ2yJCAAoJEBx+YmzsjxAgYFMP/3V//IAVz+6kevDHfsi9pkQl
thoD7SiGvLd4RxntAwfQ1i8FVJqagnFjHWi4qn8TBpxm9wrckNYkOUxUzPzT5ADl
BYnS2kymfGrSjmBzmgznLMtE2fsFKiem29//onj8sGE37w6H6zSeOHhk0I29E1xk
bpyZG3UrEIK+r3sfUgKg3mlANZBshCyvyX/TRjiH+OMkev9UNGBqvOvO+PRVVx2J
p/QM4BGA/l+UzdL0tEFVYQ4r0iyO3FOve/j8gMNbPYYDqZKta4exuh0pPZujPPH6
p5ysmOuiTZfMTLC6qzZVBwGPa+oNp9FV/Ge9aOdShNhOB6i5CH+mGPDaN5xg/G7z
x9yvCnM47drxH2046+og3PpLFMu59jLaNyHgHG/PQ2YADuo/NuPJnbMgOv5YG9Vc
nJCvPhtJ45GbNnfXR2XWGAvrYFWZ+Miex0xw9wswQjkScX4qBI/OXcSSP5hsMbd0
kH6H+gjkLJJQ38AJBonBKPO4y/l5xMDfQabkzOmxR6EA4mMSremAkAe4NstLvYCn
DJsmAa0Yhp6ZWDP0erRZ/wap9JC5CoH+cQv5PCBpxLB9vZpLvGQgLR+6B9YKV5Lf
zPn92MU8OwKcC95HjKTimhgNvuSgGrQYxvKdk5tGTJv+eOZxCrhlxUqfNUTKdpz2
2+kPJtwHjLoMrtHuFCSf
=ELoE
-----END PGP SIGNATURE-----

--qjq36izgykdjiajx--
