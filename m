Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: bcm2835: Make sure the PLL is gated before changing its rate
In-Reply-To: <20180208134338.24590-4-boris.brezillon@bootlin.com>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com> <20180208134338.24590-4-boris.brezillon@bootlin.com>
Date: Thu, 08 Feb 2018 15:20:16 +0000
Message-ID: <87mv0j5wzz.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> All bcm2835 PLLs should be gated before their rate can be changed.
> Setting CLK_SET_RATE_GATE will let the core enforce that, but this is
> not enough to make the code work in all situations. Indeed, the
> CLK_SET_RATE_GATE flag prevents a user from changing the rate while
> the clock is enabled, but this check only guarantees there's no Linux
> users. In our case, the clock might have been enabled by the
> bootloader/FW, and, because we have CLK_IGNORE_UNUSED set, Linux never
> disables the PLL. So we have to make sure the PLL is actually disabled
> before changing the rate.
>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio=
 domain clocks")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 6c5d4a8e426c..051ce769c109 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -678,6 +678,18 @@ static int bcm2835_pll_set_rate(struct clk_hw *hw,
>  	u32 ana[4];
>  	int i;
>=20=20
> +	/*
> +	 * Normally, the CLK_SET_RATE_GATE flag prevents a user from changing
> +	 * the rate while the clock is enabled, but this check only makes sure
> +	 * there's no Linux users.
> +	 * In our case, the clock might have been enabled by the bootloader/FW,
> +	 * and, since CLK_IGNORE_UNUSED flag is set, Linux never disables it.
> +	 * So we have to make sure the clk is actually disabled before changing
> +	 * the rate.
> +	 */
> +	if (bcm2835_pll_is_on(hw))
> +		bcm2835_pll_off(hw);
> +

I'm not sure this improves the situation.  If the PLL was on, then
presumably there's a divider using it and a CM clock using that, so
we'll probably end up driving some glitches on them.

Does the common clk framework have a way to disable unused clocks from
the leaf clocks up to this root, before the general
disable-unused-clocks path happens late in the boot process?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlp8arEACgkQtdYpNtH8
nuiFNA/7Bm6EkROH/umwxRodCTmBHB9X3tgnCd5OoaH9C9o0YvAU1LI1mVJet+iI
aRrUgNZ8f/7sDJZnSCyEDEP8DuGTBB2HNnq5zE/31IUcQY6fHbx5bbYaA3Z86Tw9
sJXUdIch5gmPVbYYI2wDQtRTTp1mqsooyrejbfeyT7Pm9DtuxzoHvQhy1fa9kB0I
L/RvIZHd29vBiOTAAtDGOl6MSixWm3DB6yamuPIfZEnEZfCqtUTPLJGhCTo+tyeD
BW9CVMf64GcHTjPvcodTm9MjkzJqEbZDaF9HtdVMm2ltdjSML6ZdOI3Fhr8TDVzw
yzJE0gvX1gmHDVO60HkVLievuF706B2RwPC3i57AeO2JM2+5cESg4Dguj21oPDsf
/WThpkDx3WjrvW+cvpTNMVQPF9ZI2fsNHne3bG3i/sAZZFc2kQbAl+OUhzAnbDh+
rQdlWnXs2vGFw6NuX0E2kLqUhlZcduwZbaYDBXH9WEl7+d/zoE7OnHkcmR+lus/j
zrOswBKI7O7rzhajUWa5/AGECRlHXj5OhThW5uimsDD+kGMzp/TOQoJ3JAdc4KUE
qWSEMK5nZSao5pq8QZDebhcDhymh7LJIPakO6bcviSHRCjgtmiBJRhjoj6EYNWUf
AEvgG1RODCCiQcYJICvoX967M5brIWjyYYIqsWbiAuophkAcMUg=
=Ys0O
-----END PGP SIGNATURE-----
--=-=-=--
