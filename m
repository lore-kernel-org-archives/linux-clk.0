Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 15 Sep 2016 10:34:36 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] clk: sunxi-ng: sun6i-a31: Register offset and clk
 flag fixes
Message-ID: <20160915083436.GC10128@lukather>
References: <20160915065740.13664-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
In-Reply-To: <20160915065740.13664-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 15, 2016 at 02:57:37PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> Here are 3 fixes for the new sunxi-ng clk driver for sun6i-a31 recently
> introduced for 4.9. The issues were noticed while working on the display
> pipeline for the A31/A31s. The second patch follows what Maxime has done
> for the A33 CCU driver. The third issue was noticed while doing the first
> patch.
>=20
> I hope we can get this into 4.9 as well, either right in -rc1, or in a
> later -rc.

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Stephen, could you apply those patches directly on top of my previous
PR, or do you want me to send another one?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX2l0cAAoJEBx+YmzsjxAgndIQALJ/+FGWOe9YLOUESBj9S+iJ
tkMo4dVNOs0gshgCGT0Oz93fbo3VVIUOhgTgqQtWedpiX8MFeziKuTozgjQQWEsr
NrkY7Kq/CX+UMr7ap797FGBivanDSGMcCmOgG/2WAUjpnYJajIE63+NraVBk4Iai
QZ1oTa7xfgiD8NFqIzAl1/dEQfu/m0pv/rLe3KqZMbR41AQiHqa8KSKimTe/gy3J
7iy3jBfrwNMUo0+himgLvj3wRjgfLElCaLPBAm82NpUMgjb0+g/bd4sTppcxZH+e
NDOCEAOHiZRtOgMFJooILQkRSXabo9M6+BoaxEzVJibmkUVrEtuwMue4KDDRbFb5
A0+KMg3wkoOdB0eqIzgRp1TlxYzecnSuSkx7fAMlqhIFwIfNVbyWuxiOWNr7xAha
qEpl3+Kn0vtnnptuUB4CLWrb9CLT7QD23eR2BT8yZsAC2prxLBk/jlAxi4WFd7ms
CkZiIxGZqeh6YkLkHV1zKs9CYWKpeRgunlzDSfoJbnzEXcHI8YHG6L6tA50O/SWU
w9RF6wP/+0NMp07r+w5OieoYTLnhK3HT8u2iaJnn2z6KHd5OlNkAQgXRpbFzRxAF
3Ljna5xRjloHuo4U8FzpX1E9q/F4HKXdv4UnA9TMJ8M9L0qaRZgOyJe1l2eg/Cyq
uORYHD1DZCbCjRFgeWjS
=N49m
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--
