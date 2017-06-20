Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 20 Jun 2017 08:30:51 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner clock changes for 4.13
Message-ID: <20170620063051.j2chtseeetoh3mhe@flea.lan>
References: <20170614192617.bsp5pjxrphlk36sk@flea.home>
 <20170616215036.GN20170@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hkr6n6dweofarkrk"
In-Reply-To: <20170616215036.GN20170@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--hkr6n6dweofarkrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2017 at 02:50:36PM -0700, Stephen Boyd wrote:
> On 06/14, Maxime Ripard wrote:
> > Hi Mike, Stephen,
> >=20
> > Here is the patches for 4.13 for the Allwinner SoCs.
> >=20
> > In order to reduce the conflicts, this is based on the fixes tag I
> > sent a PR for a few minutes ago.
> >=20
>=20
> Thanks. Pulled into clk-next. I did notice on new sparse warning
> though for which I've applied this diff on top:
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index cfe4538304fb..312664155a54 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -68,7 +68,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_co=
mmon *common,
>  	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
>  }
> =20
> -unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
> +static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *co=
mmon,
>  					    struct ccu_mux_internal *cm,
>  					    int parent_index,
>  					    unsigned long parent_rate)

Seems good, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hkr6n6dweofarkrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZSMEbAAoJEBx+YmzsjxAgBfYP/iJFKf8UYOy4FmuBkejp9EeX
msIeRY/wLBHcbdetgJvNf6crf0PbcNWgiLJ2xHve401cNZ7rNL+M/cfN7n1zJIz/
WoTQu/ZcLqL/ZW6sVjVVyoGvwRUxSss7MCGlngM/CPDWfg3J+OlrWjXeSOtWGQUp
Gzso3XEuGp4OKzF8PISGlly1gXkkx0But5VdOu0NWdjsW8VyKU4NIr/jRg0prQC8
copFBzf4oibsQcK78sAEMz5AZCJO8KsEWSHWTakblfpKpGkbrUjbisD5L1aQ/0+R
T8I2g1KLhJm6g7wtfzT72u8yqrMUw8Tnqo7WdolulgJhoFwRo87OkfYCfMVFmUlW
hVZwSkNpcFRplpJfSFOgy/WXC2tXBUs4Pisbpi8+ufu0i62h++Vx5NGYKl8XUZoC
ixKH9eEj7ZsCyPWKG30mpiGftXaxm1MwwuNvJxIwfk8Gr6e+p5Dl62zdlWiWs5DV
qmIGbVlCOpAEgPq+OGaaIEdS/VuGyCULAsDqC3JHva+Bor+BtFWOaZxAoaZ0er+X
viZMEGcfMcoMmZMy88oae2Oyump/vV4O0p51NU9NnEuOkPhMdaGyTtbISSA/OXkN
JGsLumVm0GT3Gp+9Mx5n/w1Pub/fLE6HHZG813HDIRD6UBp1w3PMoucjpjqWUE4H
+kOEbVx3wdRlBb4tlW6y
=YM9H
-----END PGP SIGNATURE-----

--hkr6n6dweofarkrk--
