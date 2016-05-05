Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V5] clk: bcm2835: mark enabled clocks and pll with CLK_ENABLE_HAND_OFF
In-Reply-To: <1462348385-16167-1-git-send-email-kernel@martin.sperl.org>
References: <1462348385-16167-1-git-send-email-kernel@martin.sperl.org>
Date: Thu, 05 May 2016 12:17:51 -0700
Message-ID: <87oa8ks49s.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> The bcm2835 firmware enables several clocks and plls before
> booting the linux kernel.
>
> These plls should never get disabled as it may result in a
> stopped system clock and more.
>
> So during probing we check if the clock and plls are enabled
> and if it is then mark that clock/pll with CLK_ENABLE_HAND_OFF.
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> Note: This requires the CLK_ENABLE_HAND_OFF patch to be applied.
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 0fc71cb..0663b6c 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1211,6 +1211,15 @@ bcm2835_register_pll_divider(struct bcm2835_cprman=
 *cprman,
>  	divider->cprman =3D cprman;
>  	divider->data =3D data;
>=20=20
> +	/* if the pll-divider is running, then enable CLK_ENABLE_HAND_OFF */
> +	if ((cprman_read(cprman, data->a2w_reg) &
> +	     A2W_PLL_CHANNEL_DISABLE) =3D=3D 0) {
> +		dev_dbg(cprman->dev,
> +			"found firmware enabled pll_div %s - enabling hand off\n",
> +			data->name);
> +		init.flags |=3D CLK_ENABLE_HAND_OFF;
> +	}

I don't think we want this on dividers.  There are very few cases where
a divider will be grabbed and prepare/enabled on its own, rather than as
a side effect of a downstream clock being needed.  So, I think the
dividers need to stay as being enabled/disabled automatically by the
downstream clocks, like in the v3 patch you had sent.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXK5xfAAoJELXWKTbR/J7ocyUQAKMEymgsMgvn6gfnEilc+yOQ
wPbG3Jec8NCYShKPPtx5+CgwQD3MpoOAEz64qxBS0ttSSwDPxVJZiFSoVHxBPYLR
Cu7FCFuIx1cruumOtKgoSAfaVSU2bqEJxQ8ndW1+oYWnBCVdEskbz8LKz2PUvIKu
U3dUX23//JeJNkmwAKLzFF+4nb+9NjJFNRB0McV5VrBBMXm0vV4B2rgorxv8i1He
EhcREj64oQp2F40xV2EnvnNmg2Pfk1tgGhbcspWblo+Vl6zLczq1vgK1A/6KI3A5
wtWEv7be1KLWoqsHL0iqAMdc9pKif9wVCLP4aDct3S8F+0kaRQYLCXk8IYGNuI9U
N5+OVGR6TEtkEik04Tjj6td4kIYxXLZGijvMlrkhR33MDnfXTAuE1Nv6D1u24n1w
w5G7rbUgYOHm7HlW/Ok2vgak0opD/ptA5Y9lD6bSUaCQHwjTSWCCJcj5Z5pgDBCw
C3U1Jlik3m1aVcN2SGIECJNLItymNDfL+s2FZcBqo4OArUrdpa3qRCMD5Nt5EmBM
pIM9toO1IUvZc0BiAxAD+dPoqECRtEvNExJmAMaUzAOENtfviPqFpkNtnzjiDQ01
KuOJ21TfpIWPuVHJYNn1JhNyvdWwSmfCSIw0M8aiogGOYWs8mo/oPih6t8Adf7OA
wdE74h5BASo5v67bdC08
=q/yA
-----END PGP SIGNATURE-----
--=-=-=--
