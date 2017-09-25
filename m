Return-Path: <andrew@aj.id.au>
Message-ID: <1506344081.30138.32.camel@aj.id.au>
Subject: Re: [PATCH v2 5/5] clk: aspeed: Add reset controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Mon, 25 Sep 2017 22:24:41 +0930
In-Reply-To: <20170921042641.7326-6-joel@jms.id.au>
References: <20170921042641.7326-1-joel@jms.id.au>
	 <20170921042641.7326-6-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wfRnG1yxeKqdf/Q9Mx1e"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-wfRnG1yxeKqdf/Q9Mx1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-21 at 13:56 +0930, Joel Stanley wrote:
> There are some resets that are not associated with gates. These are
> represented by a reset controller.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/clk/clk-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 82 ++++++++++=
+++++++++++++++++++++-
> =C2=A0include/dt-bindings/clock/aspeed-clock.h |=C2=A0=C2=A09 ++++
> =C2=A02 files changed, 90 insertions(+), 1 deletion(-)
>=C2=A0
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index dec9db4ec47b..db97c0f9f99e 100644
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
> @@ -256,6 +257,68 @@ static const struct clk_ops aspeed_clk_gate_ops =3D =
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
> +	25, /* x-dma */
> +	24, /* mctp */
> +	23, /* adc */
> +	22, /* jtag-master */
> +	18, /* mic */
> +	=C2=A09, /* pwm */
> +	=C2=A08, /* pci-vga */
> +	=C2=A02, /* i2c */
> +	=C2=A01, /* ahb */

Bit of a nit, but given you define macros for the indices, maybe use design=
ated
initialisers and drop the comments.

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
> @@ -299,10 +362,11 @@ static int __init aspeed_clk_probe(struct platform_=
device *pdev)
> =C2=A0	const struct clk_div_table *mac_div_table;
> =C2=A0	const struct clk_div_table *div_table;
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
> @@ -310,6 +374,22 @@ static int __init aspeed_clk_probe(struct platform_d=
evice *pdev)
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
> =C2=A0	soc_data =3D of_device_get_match_data(&pdev->dev);
> =C2=A0	div_table =3D soc_data->div_table;
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindin=
gs/clock/aspeed-clock.h
> index afe06b77562d..a9d552b6bbd2 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -40,4 +40,13 @@
> =C2=A0#define ASPEED_CLK_GATE_SDCLKCLK	(22 + ASPEED_CLK_GATES)
> =C2=A0#define ASPEED_CLK_GATE_LHCCLK		(23 + ASPEED_CLK_GATES)
> =C2=A0
> +#define ASPEED_RESET_XDMA		0
> +#define ASPEED_RESET_MCTP		1
> +#define ASPEED_RESET_JTAG_MASTER	2
> +#define ASPEED_RESET_MIC		3
> +#define ASPEED_RESET_PWM		4
> +#define ASPEED_RESET_PCIVGA		5
> +#define ASPEED_RESET_I2C		6
> +#define ASPEED_RESET_AHB		7
> +
> =C2=A0#endif
--=-wfRnG1yxeKqdf/Q9Mx1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyPySAAoJEJ0dnzgO5LT5vM8P/jaRq7k/Fcjn/p+sacVhWgw6
D9zrFvlbKEiPIrVjsdmfqLPLdsxIfw1WZtZWYtZVE3dSXLcKOmK7Zgt7QspbMAGu
wTCC2RUj5TSqd3qGScBZXG+0uE3HT9HmpM2V/PcqBMNBkKx0W9ANv2fKtYgzJc9i
QkM8WFlPAp8ZCf+cq8SyTHdBEecVDG/ViuKz4u/n3O3cPPFTlDfu/2XVGHFoWUCZ
WM1k8yXwpMvb2hO3UtjtKHLvbpt2RQN3L9c28FwHNCk6Ju57eNnbHZpAY0LfZZLK
8XpniJ+MJl2eXgzeq2Nx9KyBCibWRWtOcAgwn4Xbq98yzS/5PwIubrJ3+JDn1zqT
Y7NMBkYnI3JyQKm4PgJVLd5A46Mgvqh96vdQZ2A10nYzAGFSLrCx5C4NVWdeo4/w
NlIzf2ylCR1OEMnsJPUrgNTnkMISVwqR8BU/qb9w1GNCXGHGFqI+oBxiiPNKf9Dq
vD6EGhqoiYGhIevEq4lW4YNlB/4rcNdMxX3vWfHhviL5Aw+CSmcPFO7+tje1IVH6
QzKCvssicnxNbe7EJwLoDD1FddfyJdfYVj8zD4EIQ+luuBunahUozxdlFRD7YuS6
pI+ScsyDSIeLmGq771TocoAE0mufX2GhF/HtUppxJ9SQky0yjKVD6EdYXYpiLeGp
TQ0kZ8/E67Gtlk6fHBxf
=pfLO
-----END PGP SIGNATURE-----

--=-wfRnG1yxeKqdf/Q9Mx1e--
