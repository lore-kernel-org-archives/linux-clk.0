Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Sep 2017 11:13:17 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: Implement reset control status readback
Message-ID: <20170926091317.2lgdssq3kifxcsle@flea>
References: <20170926023620.22284-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jepa6dc2uytqcbei"
In-Reply-To: <20170926023620.22284-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--jepa6dc2uytqcbei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 02:36:20AM +0000, Chen-Yu Tsai wrote:
> Until now we were not providing a way to read back the status of our
> reset controls. Consumers had no real way to be certain whether a
> peripheral was held in reset or not.
>=20
> Implement the status callback to complete the API support.
>=20
> Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jepa6dc2uytqcbei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyhosAAoJEBx+YmzsjxAg8oMP/0WNQ+nzimjh3NzYY8EEVX2U
MQJ1OKUv7qJBo4OYzAPWTFEOYRX+PjxVlMthvVAeK6SBqBLLwwo+aYlW5parHALH
xRc5uZJWfawmBqKEPJ/cpApWuWKUVtvyGeJJsM4L0OvsnJ3N6UcB6lO2+WT7jWxb
Te6Vcj9Khs6KFJm5MzKnV+neJAJvU5iIb6DbKaAW4Klvk9V71zrSZaaTriOQNrzQ
mhp+rYd54WFWNFB3LUUB0oN7KijRasu/UIJJVaDsqjbIjAgdpLiJwz248eu7LLJg
RNpYwwI8F0EymkllbA8FjAhppVDsKZN6Jtb9wkDa2Q52wv66FSJmFo3aHDis+2BQ
TdUIsbk1yKpHViV0xfsM+IARba+ukRt/dfJua51UmbaMs3MteYmER6ptZbfX7JNu
y+zsAozGNFr1n9P6jyRMpcgO3rwARJmkvPR4I2Iab54/nLhyAolZvKKmDw/KhVzl
/sbMynGJuQShJ4I3Wc11h0UUkb3nQAwp+SAomuwRzNLE9En4KSLgkmAYaY0Ec0/p
8nlofVQ2S+rZV5ikvDROXU7LKTh005sRBjSOs/5WTaho1LndOwfdwJG1MaKXXlGI
/0UWNrRDHzMdbxjckHm7QxgBR9udzcBlA81+1zI1gc8+9MUY3i6iiytMBX0rlzwA
jx420EtsN6HzUlHBjVIw
=SCUx
-----END PGP SIGNATURE-----

--jepa6dc2uytqcbei--
