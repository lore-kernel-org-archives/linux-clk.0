Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:39987 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751686AbdFGJjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 05:39:07 -0400
Date: Wed, 7 Jun 2017 11:38:45 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 07/11] drm: sun4i: add support for the TV encoder in
 H3 SoC
Message-ID: <20170607093845.cu5kk55nj72roysf@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-8-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yrw3slyluc5aqqtx"
In-Reply-To: <20170604160149.30230-8-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--yrw3slyluc5aqqtx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2017 at 12:01:45AM +0800, Icenowy Zheng wrote:
> Allwinner H3 features a TV encoder similar to the one in earlier SoCs,
> but has a internal fixed clock divider that divides the TCON1 clock
> (called TVE clock in datasheet) by 11.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Quirk part rewritten.
>=20
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun=
4i_tv.c
> index 338b9e5bb2a3..b9ff6d5ea67a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -13,6 +13,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> =20
> @@ -169,14 +170,21 @@ struct tv_mode {
>  	const struct resync_parameters	*resync_params;
>  };
> =20
> +struct sun4i_tv_quirks {
> +	int fixed_divider;
> +};
> +
>  struct sun4i_tv {
>  	struct drm_connector	connector;
>  	struct drm_encoder	encoder;
> =20
>  	struct clk		*clk;
> +	struct clk		*mod_clk;
>  	struct regmap		*regs;
>  	struct reset_control	*reset;
> =20
> +	const struct sun4i_tv_quirks *quirks;
> +
>  	struct sun4i_drv	*drv;
>  };
> =20
> @@ -391,6 +399,12 @@ static void sun4i_tv_mode_set(struct drm_encoder *en=
coder,
>  	struct sun4i_tcon *tcon =3D crtc->tcon;
>  	const struct tv_mode *tv_mode =3D sun4i_tv_find_tv_by_mode(mode);
> =20
> +	if (tv->quirks->fixed_divider) {
> +		DRM_DEBUG_DRIVER("Applying fixed divider %d on TVE clock\n",
> +				 tv->quirks->fixed_divider);
> +		mode->crtc_clock *=3D tv->quirks->fixed_divider;
> +	}
> +

You're not allowed to change the mode in mode_set, and you shouldn't
even change it. The output pixel clock is still 27MHz.

You should implement that using the states, as we discussed already.

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yrw3slyluc5aqqtx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZN8mlAAoJEBx+YmzsjxAg1k8QAJ9a3yGzgYKTmeQ4uT48hGRp
wOMcjTL5TBnH88Q6EVry3KnlSQKqAC5PG7p9ncixskJTpUUWAV6fyKprFQ6HKN5r
NHaHH+66CsQ9YTnLQjPjDMQGH2k6bcI5vBRWm4wbGbBwEtUwIpgN5AA4T5/Qind9
8ALKDwp1rVLiOK1Qk8wuj3WUChH1xcsR2oDFOEOV/AZzILKCKVLmpoLFT65Z6q/+
APqlBa/3A+9TJDVp/GzrxMb5nowTgh+o9LTUbFI6fyWw8sawWnU0T0iUvl0SFkA+
LoY0ir0sUhYx2hmWLhsAPHUPOsGYD68PzMnIMydFkr3rcmwvVaOE9Qa4uRfpowcZ
iLgHIpMcw8XAX1Q5/rK2YNLoJv5CJT+Alj1K8+axheJS9RkvKGuIrLJA14KupabU
l/llmxWIwbWeEVEq4EpBgCe/qAAubed1uyK+W3H2/8uefTdyvKFBO6L1DOtOjVQY
BvN6ANgw/T/wMKU4saTAG8WHMp8CNbZB68/vUDmLX0wgB7xi1Cuzxi0rqYJoGaTp
wBuG7t9Nq0L9WCBjpZFQD2klRwmlcJVKBpIMCKgQ9w7gJ/SmREvGthf4XnQq4VcQ
hr1yvmZKWxSCOLSZFQN9NltdFj+d7/DAFyvUhckrTmMmKPmCX9HaL0OLYtIe8Kq1
YBwAUKdtSF7Szz55GCcN
=8ass
-----END PGP SIGNATURE-----

--yrw3slyluc5aqqtx--
