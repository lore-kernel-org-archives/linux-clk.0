Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:42768 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755964AbeFOIbW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Jun 2018 04:31:22 -0400
Date: Fri, 15 Jun 2018 10:31:10 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, airlied@linux.ie,
        gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        seanpaul@chromium.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 11/27] drm/sun4i: tcon: Add support for tcon-top gate
Message-ID: <20180615083110.laruycabvyjmesmo@flea>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-12-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rsy7w5xmby6g4wcn"
In-Reply-To: <20180612200036.21483-12-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--rsy7w5xmby6g4wcn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 12, 2018 at 10:00:20PM +0200, Jernej Skrabec wrote:
> TV TCONs connected to TCON TOP have to enable additional gate in order
> to work.
>=20
> Add support for such TCONs.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 11 +++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 ++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 08747fc3ee71..0afb5a94a414 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -688,6 +688,16 @@ static int sun4i_tcon_init_clocks(struct device *dev,
>  		dev_err(dev, "Couldn't get the TCON bus clock\n");
>  		return PTR_ERR(tcon->clk);
>  	}
> +
> +	if (tcon->quirks->has_tcon_top_gate) {
> +		tcon->top_clk =3D devm_clk_get(dev, "tcon-top");
> +		if (IS_ERR(tcon->top_clk)) {
> +			dev_err(dev, "Couldn't get the TCON TOP bus clock\n");
> +			return PTR_ERR(tcon->top_clk);
> +		}
> +		clk_prepare_enable(tcon->top_clk);
> +	}
> +

Is it required for the TCON itself to operate, or does the TCON
requires the TCON TOP, which in turn requires that clock to be
functional?

I find it quite odd to have a clock that isn't meant for a particular
device to actually be wired to another device. I'm not saying this
isn't the case, but it would be a first.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--rsy7w5xmby6g4wcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsjeU4ACgkQ0rTAlCFN
r3Tj/hAAhiqOVUppOsEGny5ib7BWqYL0wmbs/o/OBy49lusxuyw832aWpY1wADem
eRFlAv9Aa7oulXKBEcT4fqw1PRzRKmxPZBu3O1psSK7mG1EfS8A/cPovOhicrMYh
EdqNNhBebY0F6vzMbZS/w37JVRA90YtkbeeeQRfnSpZhCqcLPzS184sUL9ZI+H6s
p81GHw/yGx7YK0YV6eRVvazdYHOjzka9f2LE/tg0Yq45r+Mdsat0q5hYPZ5cRIzu
O9nJoAK6Rta3JZIdMECsQamX20peg7li8xwMjqBf88rZ2Ixblk6RkvAiYDghAqWk
+YefkdImGMETtJ0HAE0mpJcQy75a4VqSl3UcnkQaXdUIhbUyfQd7rXLj135FETsd
P6i4y9gCGi0OBScjZNL1yNEjkoKVlnOkgzdkA0buP7gLntnTzLvYsn09XOc/A+Yd
Pe9sinpJk0macPjMzH7PML+0Onz6oKeKY6giquVn5R1/bjCo6ANMHKc5tSBtsrkt
xlFELmZbmJn3qxlzQm83PO7zpW0wycjxAWCtTQIIISM8Od2ZSEOBBnHFHyHq0Ezv
wdvpjs2RGTgGbRIEE1yEqtTsN24NGkoTg7Dzzt2f5Dd67hcl5z7GV+A7C+r3Yn2d
p6rya1/UHfIC0McQc0dKknsMbtpaVUXRImRJ1z33noYBKCYkDLg=
=A+Om
-----END PGP SIGNATURE-----

--rsy7w5xmby6g4wcn--
