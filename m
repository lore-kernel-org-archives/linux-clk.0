Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH 2/2] clk: bcm2835: Add PWM clock support
In-Reply-To: <1446678502-16243-3-git-send-email-repk@triplefau.lt>
References: <1446678502-16243-1-git-send-email-repk@triplefau.lt> <1446678502-16243-3-git-send-email-repk@triplefau.lt>
Date: Wed, 04 Nov 2015 18:17:38 -0800
Message-ID: <87pozp2nr1.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> Register the pwm clock for bcm2835.
> This patch also adds the ability to set a clock default rate.

I don't think we should be setting a default clock rate.  That should be
up to the thing that uses the clock.  If we need a standard rate set on
all Raspberry Pis, other than what is set at boot, then we could put it
in the bcm2835-pwm dt block (I think the "Assigned clock parents and
rates" part of clock-bindings.txt gives a way to do so).

> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  arch/arm/boot/dts/bcm2835.dtsi      |  8 ++++++++
>  drivers/clk/bcm/clk-bcm2835.c       | 28 +++++++++++++++++++++++++++-
>  include/dt-bindings/clock/bcm2835.h |  3 ++-
>  3 files changed, 37 insertions(+), 2 deletions(-)

Submitting DT changes is super awkward.  You'd need to put the bcm2835.h
and driver change in one patch with this subject.  The clk maintainers
would pull that patch.  You'd then have a second patch that covers just
the .dtsi change, which I would pull once I had a stable branch to put
it onto that had the bcm2835.h change.

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.d=
tsi
> index aef64de..0736de3 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -177,6 +177,14 @@
>  			status =3D "disabled";
>  		};
>=20=20
> +		pwm: pwm@7e20c000 {
> +			compatible =3D "brcm,bcm2835-pwm";
> +			reg =3D <0x7e20c000 0x28>;
> +			clocks =3D <&clocks BCM2835_CLOCK_PWM>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
>  		usb@7e980000 {
>  			compatible =3D "brcm,bcm2835-usb";
>  			reg =3D <0x7e980000 0x10000>;

> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 9469729..0647118 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -39,6 +39,7 @@
>=20=20
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> +#include <linux/clk.h>
>  #include <linux/clk/bcm2835.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -625,6 +626,8 @@ struct bcm2835_clock_data {
>  	const char *const *parents;
>  	int num_mux_parents;
>=20=20
> +	unsigned long dft_rate;
> +
>  	u32 ctl_reg;
>  	u32 div_reg;
>=20=20
> @@ -807,6 +810,17 @@ static const struct bcm2835_clock_data bcm2835_clock=
_emmc_data =3D {
>  	.frac_bits =3D 8,
>  };
>=20=20
> +static const struct bcm2835_clock_data bcm2835_clock_pwm_data =3D {
> +	.name =3D "pwm",
> +	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_per_parents),
> +	.parents =3D bcm2835_clock_per_parents,
> +	.dft_rate =3D 9600000,
> +	.ctl_reg =3D CM_PWMCTL,
> +	.div_reg =3D CM_PWMDIV,
> +	.int_bits =3D 12,
> +	.frac_bits =3D 12,
> +};
> +
>  struct bcm2835_pll {
>  	struct clk_hw hw;
>  	struct bcm2835_cprman *cprman;
> @@ -1440,6 +1454,7 @@ bcm2835_register_pll_divider(struct bcm2835_cprman =
*cprman,
>  static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
>  					  const struct bcm2835_clock_data *data)
>  {
> +	struct clk *ret;
>  	struct bcm2835_clock *clock;
>  	struct clk_init_data init;
>  	const char *parents[1 << CM_SRC_BITS];
> @@ -1477,7 +1492,15 @@ static struct clk *bcm2835_register_clock(struct b=
cm2835_cprman *cprman,
>  	clock->data =3D data;
>  	clock->hw.init =3D &init;
>=20=20
> -	return devm_clk_register(cprman->dev, &clock->hw);
> +	ret =3D devm_clk_register(cprman->dev, &clock->hw);
> +	if (IS_ERR(ret))
> +		goto out;
> +
> +	if (data->dft_rate)
> +		clk_set_rate(ret, data->dft_rate);
> +
> +out:
> +	return ret;
>  }
>=20=20
>  static int bcm2835_clk_probe(struct platform_device *pdev)
> @@ -1576,6 +1599,9 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)
>  				  cprman->regs + CM_PERIICTL, CM_GATE_BIT,
>  				  0, &cprman->regs_lock);
>=20=20
> +	clks[BCM2835_CLOCK_PWM] =3D
> +		bcm2835_register_clock(cprman, &bcm2835_clock_pwm_data);
> +
>  	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
>  				   &cprman->onecell);
>  }
> diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/cl=
ock/bcm2835.h
> index d323efa..61f1d20 100644
> --- a/include/dt-bindings/clock/bcm2835.h
> +++ b/include/dt-bindings/clock/bcm2835.h
> @@ -43,5 +43,6 @@
>  #define BCM2835_CLOCK_TSENS		27
>  #define BCM2835_CLOCK_EMMC		28
>  #define BCM2835_CLOCK_PERI_IMAGE	29
> +#define BCM2835_CLOCK_PWM		30
>=20=20
> -#define BCM2835_CLOCK_COUNT		30
> +#define BCM2835_CLOCK_COUNT		31
> --=20
> 2.0.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWOrxCAAoJELXWKTbR/J7ozqQP+wdPxYcyf+qRc1mq/SAegds2
z2/rhgkwhkutPVhbjJtqNfoFJe1MG9bpGCX9e+0JmWqjZLVIJLFiaUExsMaJ3OB8
+OSWdws4SYCDzxsIYP9BzCD9ZGSssoQ9SzUDQ9CbHGlNySiEgbsY/MD2o9AVylT8
EzIOMP/X0NQCuXwXWTaILO+tan3lHNuOpdxVKc+nUzW2VzQvMupTzZItq1bQ6fUk
FfGFlLbHsU2U3REx23hJXLe74h6CvR68SfCMjq15VG20qUqDTsRaWoax9IXVc6PE
ICDt/K41R582vl/8kbz4a+8ZwGXow1i/bSfichs3zjP0pUXy+vYloEiTj12UK/nN
ct+KPfCB0T3Et0sDrP+n1IEUolrQXevO4Qb7Zmj/pW+cYsqPkmzxQPVUCsnFdBNn
W4+zlMGMFnKQ7tpxkxuoMn5kvtmHI3LJsQA+BB8FT3MORVC/4rJEL2aqWVC9vThz
kqhXK+QllWt1uvgL8pcAZRLtkNI8IOz/SUsjZetIJGw7Laq9hqnJrTWR5KqcUEGY
ePIt37mNscfQig0JtzHja4nFfCu8k3liAdwkets4EmTOuBlTkAE+o0dPGrGq2e7R
s7u4cMTDn2rHWSlRuPHrPLzoLdGUAqkTESrqcJPbyV4N6P/Glz2P14JZPUXY3233
TpTbLhAwKqauEGg6zjm4
=rC4D
-----END PGP SIGNATURE-----
--=-=-=--
