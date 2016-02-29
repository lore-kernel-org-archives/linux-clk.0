Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 5/6] clk: bcm2835: correctly enable fractional clock support
In-Reply-To: <1456745963-2403-6-git-send-email-kernel@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-6-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:33:36 -0800
Message-ID: <87mvqj5k9r.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> The current driver calculates the clock divider with
> fractional support enabled.
>
> But it does not enable fractional support in the
> control register itself resulting in an integer only divider,
> but in clk_set_rate responds back the fractionally divided
> clock frequency.
>
> This patch enables fractional support in the control register
> whenever there is a fractional bit set in the requested clock divider.
>
> Mash clock limits are are also handled for the PWM clock
> applying the correct divider limits (2 and max_int) applicable to
> basic fractional divider support (mash order of 1).
>
> It also adds locking to protect the read/modify/write cycle of
> the register modification.
>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
> audio domain clocks")
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

Rewrite of the commit message:

The driver has been using fractional dividers for all clocks with
fractional bits.  However, MASH clocks (those used to drive audio) only
do fractional division when in MASH mode, which is used to push clock
jitter out of the audio band.  The PWM clock (used to drive i2s audio)
is the only MASH clock currently enabled in the driver.

Additional MASH modes are available that widen the frequency range, but
only 1-level MASH is used for now, until we characterize some better
policy.

Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
audio domain clocks")

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

> ---
>  drivers/clk/bcm/clk-bcm2835.c |   45 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index edb1f74..da77069 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -52,6 +52,7 @@
>  #define CM_GNRICCTL		0x000
>  #define CM_GNRICDIV		0x004
>  # define CM_DIV_FRAC_BITS	12
> +# define CM_DIV_FRAC_MASK	GENMASK(CM_DIV_FRAC_BITS - 1, 0)
>
>  #define CM_VPUCTL		0x008
>  #define CM_VPUDIV		0x00c
> @@ -129,6 +130,7 @@
>  # define CM_GATE			BIT(CM_GATE_BIT)
>  # define CM_BUSY			BIT(7)
>  # define CM_BUSYD			BIT(8)
> +# define CM_FRAC			BIT(9)

This is just the low bit of the 2-bit CM_MASH field at 9:10.  So you're
enabling MASH mode 1 in this patch.  Similarly, the subject of the patch
should be something like "Fix MASH-based fractional clock support for
PWM" since all the other clocks work with fractional already.

>  # define CM_SRC_SHIFT			0
>  # define CM_SRC_BITS			4
>  # define CM_SRC_MASK			0xf
> @@ -648,6 +650,7 @@ struct bcm2835_clock_data {
>  	u32 frac_bits;
>
>  	bool is_vpu_clock;
> +	bool is_mash_clock;
>  };
>
>  static const char *const bcm2835_clock_per_parents[] = {
> @@ -829,6 +832,7 @@ static const struct bcm2835_clock_data bcm2835_clock_pwm_data = {
>  	.div_reg = CM_PWMDIV,
>  	.int_bits = 12,
>  	.frac_bits = 12,
> +	.is_mash_clock = true,
>  };
>
>  struct bcm2835_pll {
> @@ -1184,7 +1188,7 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
>  		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
>  	u64 temp = (u64)parent_rate << CM_DIV_FRAC_BITS;
>  	u64 rem;
> -	u32 div;
> +	u32 div, mindiv, maxdiv;
>
>  	rem = do_div(temp, rate);
>  	div = temp;
> @@ -1194,11 +1198,23 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
>  		div += unused_frac_mask + 1;
>  	div &= ~unused_frac_mask;
>
> -	/* clamp to min divider of 1 */
> -	div = max_t(u32, div, 1 << CM_DIV_FRAC_BITS);
> -	/* clamp to the highest possible fractional divider */
> -	div = min_t(u32, div, GENMASK(data->int_bits + CM_DIV_FRAC_BITS - 1,
> -				      CM_DIV_FRAC_BITS - data->frac_bits));
> +	/* different clamping limits apply for a mash clock */
> +	if (data->is_mash_clock) {
> +		/* clamp to min divider of 2 */
> +		mindiv = 2 << CM_DIV_FRAC_BITS;
> +		/* clamp to the highest possible integer divider */
> +		maxdiv = (BIT(data->int_bits) - 1) << CM_DIV_FRAC_BITS;
> +	} else {
> +		/* clamp to min divider of 1 */
> +		mindiv = 1 << CM_DIV_FRAC_BITS;
> +		/* clamp to the highest possible fractional divider */
> +		maxdiv = GENMASK(data->int_bits + CM_DIV_FRAC_BITS - 1,
> +				 CM_DIV_FRAC_BITS - data->frac_bits);
> +	}
> +
> +	/* apply the clamping  limits */
> +	div = max_t(u32, div, mindiv);
> +	div = min_t(u32, div, maxdiv);
>
>  	return div;
>  }
> @@ -1292,9 +1308,26 @@ static int bcm2835_clock_set_rate(struct clk_hw *hw,
>  	struct bcm2835_cprman *cprman = clock->cprman;
>  	const struct bcm2835_clock_data *data = clock->data;
>  	u32 div = bcm2835_clock_choose_div(hw, rate, parent_rate, false);
> +	u32 ctl;
> +
> +	spin_lock(&cprman->regs_lock);
> +
> +	/*
> +	 * Setting up frac support
> +	 *
> +	 * In principle it is recommended to stop/start the clock first,
> +	 * but as we set CLK_SET_RATE_GATE during registration of the
> +	 * clock this requirement should be take care of by the
> +	 * clk-framework.
> +	 */
> +	ctl = cprman_read(cprman, data->ctl_reg) & ~CM_FRAC;
> +	ctl |= (div & CM_DIV_FRAC_MASK) ? CM_FRAC : 0;
> +	cprman_write(cprman, data->ctl_reg, ctl);

This should all be under "if (data->is_mash_clock) {}" since it doesn't
do anything on non-mash clocks.

>
>  	cprman_write(cprman, data->div_reg, div);
>
> +	spin_unlock(&cprman->regs_lock);
> +
>  	return 0;
>  }

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1KshAAoJELXWKTbR/J7olcAP/j7TCUkMVxWtliBxPixsRKar
6wYw5Cazh+l+o61bsAp6aiPGoXlLt+/qiMDDMxj8gKHpiUYulXGpWzkZ0xbs+M1L
M4T9tPHxget3RiKrBbc68YYy1g9+0elgY6q1U739InP8CF5WuTc1RcQy6B6AApGh
LgV2WEdNyx8EP6s/vUMTLPM7IlKzldTuOCknCGcXoB90fsbWWGrwG57XdsQj2anf
bwSoHPMSSRBghGbMaTSFjm6XjHaN6ndVeAkQc9eSoePRSUOBHWB8Svc8wCRX/MXi
TW4jBD4J68BQSUVGFwMVoAbpW7XgCFtXddmsEX9Q8h1xQk/O3ffu1fJYryrmjb12
W7LyYNZ60jU/jpqds5pq+VCCVMxYnDyYwaiaGoIbTqCJ4eVztZByhG4DYwmh/loh
LgH3zaa69EIkBTeP6hL1KEBsQjQcLU2bw9aRUMTgDtGbSdIVfptZD6nfoP+cJZFX
K0cU+fBbk+I3fQnFqwjMCKR1NuzMhFMqryBM7Qa6vyA25tL3hxguukYqiXAW3Zmw
7nZecEWvDdEAjP6nb9LV2Bb8RpbdtktLYDytgGQUG1t4zVvmayUZOwPSISxliyJn
CQCVg2LUbk/ewRgOYHXacNzXe6ujQ/+RfKgUoWr98uamdkkLMbq1UDsEKeM8VUXq
H1NDMtBL++ymTbkroy8u
=qIMj
-----END PGP SIGNATURE-----
--=-=-=--
