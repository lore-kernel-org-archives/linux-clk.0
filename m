Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V3] clk: bcm2835: mark enabled clocks with CLK_ENABLE_HAND_OFF
In-Reply-To: <1461770664-29384-1-git-send-email-kernel@martin.sperl.org>
References: <1461770664-29384-1-git-send-email-kernel@martin.sperl.org>
Date: Thu, 28 Apr 2016 13:22:22 -0700
Message-ID: <87d1p9v5z5.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> The bcm2835 firmware enables several clocks and plls before
> booting the linux kernel.
>
> These plls should never get disabled as it may result in a
> stopped system clock and more.
>
> So during probing we check if the clock is enabled
> and if it is then mark that clock with CLK_ENABLE_HAND_OFF.
> As a consequence this will also enable the corresponding
> parent plls and pll-divs.
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>
> --

> ---
>  drivers/clk/bcm/clk-bcm2835.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 35f8de7..65d62c2 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1251,7 +1251,14 @@ static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
>  		init.flags |= CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
>  	}
>
> +	/* if the clock is running then enable HAND_OFF */
> +	if (cprman_read(cprman, data->ctl_reg) & CM_ENABLE) {
> +		dev_info(cprman->dev,
> +			 "found enabled clock %s - enabling hand off\n",
> +			 data->name);
> +		init.flags |= CLK_ENABLE_HAND_OFF;
> +	}
> +

The debug shouldn't be at dev_info() level, but other than that this
seems like a good plan once CLK_ENABLE_HAND_OFF lands.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXInD+AAoJELXWKTbR/J7oXAYP/1rIspBoceUeuGMqcMiMv1Ef
rYKSacq0kDFNNcpthSD/fnHKyVc7Ljxc7moSh9oWFEVsnI1R1e/n/4x2G5YBUqJh
b5tTj8ewx0csUwR4+Z7U4lOdH2xoAfYg/6Uj4dj7sQj8PQ33fEdc3/xT5CiRgk+I
8UblxaDRM4lpckLdteLQ3hzfWkwZSBQ1GCfXb5mlb5+cVCFCcWWxyEDwaDv40DP8
Bu5vrmxfkWtHIpcWKRMfltpWCzvwOEJRL8mVAoHWV6TQoiqxySfayzInzq6ldFe5
lvMakVkNk6qXPEPOzl3Pv8WPnV2JiDgw64kiVTY9Za30J+Bl+E/PQL0QCtcV2jYI
GmhUljV6yFSQ3R6OtlQebhQUVUMgksX2kK+Zy8pDE/kOIaf9lbhdnD6DCxzjdgQK
QlJULh4kXw5OJ6xvAtfgLyPd1YQN57q3q3e9iOLu8kQe8iCLmv7d/7CL9btlxFjq
dV2Qky/JWQi62J2D+EfQyoupHTyehMMvbQzckCswBgCS1ncWX0yb+Qb0H92Xkjtb
qrAob4+PIXmiq1YgjeKHit89pYgYwPlGQ3ywTbW328cgo0Aubo3jU5jMKA8RsJ6Q
cQ4WZFHfZ2x0IKNrxa+CmzeWW0i5BA+7md8mszbSv7Zfs8YPDzgAh83TicTxoLas
F2Ltl0lTqN4g71HZHqM5
=iRbf
-----END PGP SIGNATURE-----
--=-=-=--
