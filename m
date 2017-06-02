Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 2 Jun 2017 21:31:06 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 12/19] drm/sun4i: hdmi: Support the DDC clock in the
 A31's HDMI controller
Message-ID: <20170602193106.c3yagwkglhg45h6y@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-13-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rjl2suipzdxwdmfe"
In-Reply-To: <20170602101024.18940-13-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--rjl2suipzdxwdmfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2017 at 06:10:17PM +0800, Chen-Yu Tsai wrote:
> On the A31, the HDMI DDC block is different from the one in the
> other SoCs. As far as the DDC clock goes, it has no pre-divider,
> as it is clocked from a slower parent clock, not the TMDS clock.
> The divider offset from the register value is different. And the
> clock control register is at a different offset.
>=20
> This patch adds support for this variant.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi.h         |  1 +
>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/s=
un4i_hdmi.h
> index 08c514672fd3..c39c2a245339 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> @@ -178,6 +178,7 @@ struct sun4i_hdmi {
>  };
> =20
>  int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
> +int sun6i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
>  int sun4i_tmds_create(struct sun4i_hdmi *hdmi);
>  int sun6i_tmds_create(struct sun4i_hdmi *hdmi);
> =20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm=
/sun4i/sun4i_hdmi_ddc_clk.c
> index 9a6b6243e977..b1395e7b242c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> @@ -151,3 +151,14 @@ int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct=
 clk *parent)
>  {
>  	return _sun4i_ddc_create(hdmi, parent, &sun4i_variant);
>  }
> +
> +static const struct sun4i_ddc_variant sun6i_variant =3D {
> +	.reg_offset	=3D SUN6I_HDMI_DDC_CLK_REG,

This one should be handled through a regmap_field.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rjl2suipzdxwdmfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMbz6AAoJEBx+YmzsjxAg2QEP/1FHFocbrrbyyxdb6Own0ieA
gTKvSW7W7MG6Q5f78fJoJb3C2GJr85KwRtDezfJczRJzMxiHeQbqPFqdQJ0w1YTX
OFA0JDYH+Nwqn9wbg4lUMztdJ0Us2sqjUnySCx65hgmS3dbJGwvrENGQuA/9g+C0
PNx0jfe1Vr0Oq2yramU+OJdg6CbZUfix6GibEdE3JWosxx9KsTkkMq1rE9AENU6S
I+eAIrfkc0ZQ+HStMNxeKn9NQ13fd7e6lMBMyJG5o0DvdpjV/IM2Vu5fg0cbdyhr
W9hNY7SgvxDu9HzFepDN/o6jEUxdKOCpjTl1LSKUVsWz4Ox78K5ppQyWo7LhVzuf
d6C/JkXyiinDqjABLqa1ud1hInU8VFyzchWtbt4RQlenRGG1zIlRGMzYIrjQPWaj
UVEh+LfCwpzhjELgp4bW/YXQkaww6/5y//vy4OCNMYHZSBnYxfI0Tsx8xHZgjqe8
n1NfJdvzAVc8SbfZGc7j5+APTmwUPktdTDXMHyCB7Dh6sUclpslhaUTfy22jG4uH
xA8ViPpmPs+95ieViCHNSc3ko1W3Fq9UZFETJle2CzyVpTJbfRDF6+ii8AP3wKSx
F4h4VWkjXnMeoPPpj29AdRXhpZnjT/hEhGdUVdLPjcYn0Oz1K3zKEaOM+TcvvXBH
JXdNZwQN/281WXpBJ8Bq
=Sbjn
-----END PGP SIGNATURE-----

--rjl2suipzdxwdmfe--
