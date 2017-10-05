Return-Path: <andrew@aj.id.au>
Message-ID: <1507189629.5452.69.camel@aj.id.au>
Subject: Re: [PATCH v4 5/5] clk: aspeed: Add reset controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Thu, 05 Oct 2017 18:17:09 +1030
In-Reply-To: <20171003065540.11722-6-joel@jms.id.au>
References: <20171003065540.11722-1-joel@jms.id.au>
	 <20171003065540.11722-6-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-37AQqB120cmBylic0NKy"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-37AQqB120cmBylic0NKy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-03 at 17:25 +1030, Joel Stanley wrote:
> There are some resets that are not associated with gates. These are
> represented by a reset controller.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>

With respect to the Aspeed hardware reset bits:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=C2=A0
> ---
> v3:
> =C2=A0 - Add named initalisers for the reset defines
> =C2=A0 - Add define for ADC
> ---
> =C2=A0drivers/clk/clk-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 82 ++++++++++=
+++++++++++++++++++++-
> =C2=A0include/dt-bindings/clock/aspeed-clock.h | 10 ++++
> =C2=A02 files changed, 91 insertions(+), 1 deletion(-)
>=C2=A0
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index a424b056e767..de491dc7f955 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/of_device.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/spinlock.h>
> =C2=A0
> @@ -292,6 +293,68 @@ static const struct clk_ops aspeed_clk_gate_ops =3D =
{
> =C2=A0	.is_enabled =3D aspeed_clk_is_enabled,
> =C2=A0};
> =C2=A0
> +/**
> + * struct aspeed_reset - Aspeed reset controller
> + * @map: regmap to access the containing system controller
> + * @rcdev: reset controller device
> + */
> +struct aspeed_reset {
> +	struct regmap			*map;
> +	struct reset_controller_dev	rcdev;
> +};
> +
> +#define to_aspeed_reset(p) container_of((p), struct aspeed_reset, rcdev)
> +
> +static const u8 aspeed_resets[] =3D {
> +	[ASPEED_RESET_XDMA]	=3D 25,
> +	[ASPEED_RESET_MCTP]	=3D 24,
> +	[ASPEED_RESET_ADC]	=3D 23,
> +	[ASPEED_RESET_JTAG_MASTER] =3D 22,
> +	[ASPEED_RESET_MIC]	=3D 18,
> +	[ASPEED_RESET_PWM]	=3D=C2=A0=C2=A09,
> +	[ASPEED_RESET_PCIVGA]	=3D=C2=A0=C2=A08,
> +	[ASPEED_RESET_I2C]	=3D=C2=A0=C2=A02,
> +	[ASPEED_RESET_AHB]	=3D=C2=A0=C2=A01,
> +};
> +
> +static int aspeed_reset_deassert(struct reset_controller_dev *rcdev,
> +				=C2=A0unsigned long id)
> +{
> +	struct aspeed_reset *ar =3D to_aspeed_reset(rcdev);
> +	u32 rst =3D BIT(aspeed_resets[id]);
> +
> +	return regmap_update_bits(ar->map, ASPEED_RESET_CTRL, rst, 0);
> +}
> +
> +static int aspeed_reset_assert(struct reset_controller_dev *rcdev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long id)
> +{
> +	struct aspeed_reset *ar =3D to_aspeed_reset(rcdev);
> +	u32 rst =3D BIT(aspeed_resets[id]);
> +
> +	return regmap_update_bits(ar->map, ASPEED_RESET_CTRL, rst, rst);
> +}
> +
> +static int aspeed_reset_status(struct reset_controller_dev *rcdev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long id)
> +{
> +	struct aspeed_reset *ar =3D to_aspeed_reset(rcdev);
> +	u32 val, rst =3D BIT(aspeed_resets[id]);
> +	int ret;
> +
> +	ret =3D regmap_read(ar->map, ASPEED_RESET_CTRL, &val);
> +	if (ret)
> +		return ret;
> +
> +	return !!(val & rst);
> +}
> +
> +static const struct reset_control_ops aspeed_reset_ops =3D {
> +	.assert =3D aspeed_reset_assert,
> +	.deassert =3D aspeed_reset_deassert,
> +	.status =3D aspeed_reset_status,
> +};
> +
> =C2=A0static struct clk_hw *aspeed_clk_hw_register_gate(struct device *de=
v,
> =C2=A0		const char *name, const char *parent_name, unsigned long flags,
> =C2=A0		struct regmap *map, u8 clock_idx, u8 reset_idx,
> @@ -333,10 +396,11 @@ static int aspeed_clk_probe(struct platform_device =
*pdev)
> =C2=A0{
> =C2=A0	const struct aspeed_clk_soc_data *soc_data;
> =C2=A0	struct device *dev =3D &pdev->dev;
> +	struct aspeed_reset *ar;
> =C2=A0	struct regmap *map;
> =C2=A0	struct clk_hw *hw;
> =C2=A0	u32 val, rate;
> -	int i;
> +	int i, ret;
> =C2=A0
> =C2=A0	map =3D syscon_node_to_regmap(dev->of_node);
> =C2=A0	if (IS_ERR(map)) {
> @@ -344,6 +408,22 @@ static int aspeed_clk_probe(struct platform_device *=
pdev)
> =C2=A0		return PTR_ERR(map);
> =C2=A0	}
> =C2=A0
> +	ar =3D devm_kzalloc(dev, sizeof(*ar), GFP_KERNEL);
> +	if (!ar)
> +		return -ENOMEM;
> +
> +	ar->map =3D map;
> +	ar->rcdev.owner =3D THIS_MODULE;
> +	ar->rcdev.nr_resets =3D ARRAY_SIZE(aspeed_resets);
> +	ar->rcdev.ops =3D &aspeed_reset_ops;
> +	ar->rcdev.of_node =3D dev->of_node;
> +
> +	ret =3D devm_reset_controller_register(dev, &ar->rcdev);
> +	if (ret) {
> +		dev_err(dev, "could not register reset controller\n");
> +		return ret;
> +	}
> +
> =C2=A0	/* SoC generations share common layouts but have different divisor=
s */
> =C2=A0	soc_data =3D of_device_get_match_data(dev);
> =C2=A0	if (!soc_data) {
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindin=
gs/clock/aspeed-clock.h
> index 4a99421d77c8..8e19646d8025 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -39,4 +39,14 @@
> =C2=A0
> =C2=A0#define ASPEED_NUM_CLKS			35
> =C2=A0
> +#define ASPEED_RESET_XDMA		0
> +#define ASPEED_RESET_MCTP		1
> +#define ASPEED_RESET_ADC		2
> +#define ASPEED_RESET_JTAG_MASTER	3
> +#define ASPEED_RESET_MIC		4
> +#define ASPEED_RESET_PWM		5
> +#define ASPEED_RESET_PCIVGA		6
> +#define ASPEED_RESET_I2C		7
> +#define ASPEED_RESET_AHB		8
> +
> =C2=A0#endif
--=-37AQqB120cmBylic0NKy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1eN9AAoJEJ0dnzgO5LT51pYQAItQ7KxkuRPhx3xBj2w6XvlU
OIad1Ympj9ucWF6oop9QvnoxZzDlXE2KUKr4t+ysF3cpqmf11AJU9hCVTgn5Ni2d
zriGMwh0v55p2hAZ8/MPdWlrVZ2vWpuGgaRgiKz/rwkatpJ2Vq8CH3lxYoIHtBIo
uwvocBPo4rUETHy6eTHup5+2O7nlz6dF5TaLRIfEcKAr7cpsKsmI3SxFdTekSTsz
bwxRCPun5oV4WKGBgioCoU4tGCwMlxY3Aiw5LEF5evHziVegtQRQrSILpUeeiVFC
EEDpl/wiJoSCHYqMQK2+FQF5jZlv77JyCu8x5+Um11ln/zpN4XqEsDx972JNLXpx
cNqgLTqHTgdsnAE5NFDpiRX03mNJ1A5/oNJPocQ/z4wkwZIgHJB1s7uxKS2AqEF3
oxxKDsB5EffzMxatls7EEtkWqsraJJb+1/mMbQ5z+d23XGYt331jjRebWuoAGNEG
PxBohwQJX/Y/bAsTZy5RU8Rz2m8i1t1KyamQ0tLDXLZZusUOls7fLpBnA8pFyrIm
tqMniMh/urlplQEd52p1uG5irJYS5YHD//L6snD8syXVsA1BqTqFilj+7ij8yZkT
R8uqO0pk2BnJD53QlyX8xlQL5cPqsrRtcB0FjRxLZTwLCbZ8dvO/2EcjIUiWwi9S
a7OAlINUgjwrW+RfzVaL
=Sc1p
-----END PGP SIGNATURE-----

--=-37AQqB120cmBylic0NKy--
