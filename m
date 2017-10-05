Return-Path: <andrew@aj.id.au>
Message-ID: <1507189072.5452.67.camel@aj.id.au>
Subject: Re: [PATCH v4 4/5] clk: aspeed: Register gated clocks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Thu, 05 Oct 2017 18:07:52 +1030
In-Reply-To: <20171003065540.11722-5-joel@jms.id.au>
References: <20171003065540.11722-1-joel@jms.id.au>
	 <20171003065540.11722-5-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BeetCuN/SvIeRunHVKpo"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-BeetCuN/SvIeRunHVKpo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-03 at 17:25 +1030, Joel Stanley wrote:
> The majority of the clocks in the system are gates paired with a reset
> controller that holds the IP in reset.
>=C2=A0
> This borrows from clk_hw_register_gate, but registers two 'gates', one
> to control the clock enable register and the other to control the reset
> IP. This allows us to enforce the ordering:
>=C2=A0
> =C2=A01. Place IP in reset
> =C2=A02. Enable clock
> =C2=A03. Delay
> =C2=A04. Release reset
>=C2=A0
> There are some gates that do not have an associated reset; these are
> handled by using -1 as the index for the reset.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>
>=C2=A0
> ---
> v4:
> =C2=A0- Drop useless 'disable clock' comment
> =C2=A0- Drop CLK_IS_BASIC flag
> =C2=A0- Fix 'there are a number of clocks...' comment
> =C2=A0- Pass device to clk registration functions
> =C2=A0- Check for errors when registering clk_hws
> v3:
> =C2=A0- Remove gates offset as gates are now at the start of the list
> ---
> =C2=A0drivers/clk/clk-aspeed.c | 130 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 130 insertions(+)
>=C2=A0
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index adb295292189..a424b056e767 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -228,6 +228,107 @@ static const struct aspeed_clk_soc_data ast2400_dat=
a =3D {
> =C2=A0	.calc_pll =3D aspeed_ast2400_calc_pll,
> =C2=A0};
> =C2=A0
> +static int aspeed_clk_enable(struct clk_hw *hw)
> +{
> +	struct aspeed_clk_gate *gate =3D to_aspeed_clk_gate(hw);
> +	unsigned long flags;
> +	u32 clk =3D BIT(gate->clock_idx);
> +	u32 rst =3D BIT(gate->reset_idx);
> +
> +	spin_lock_irqsave(gate->lock, flags);
> +
> +	if (gate->reset_idx >=3D 0) {
> +		/* Put IP in reset */
> +		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, rst);
> +
> +		/* Delay 100us */
> +		udelay(100);
> +	}
> +
> +	/* Enable clock */
> +	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, 0);
> +
> +	if (gate->reset_idx >=3D 0) {
> +		/* Delay 10ms */
> +		/* TODO: can we sleep here? */
> +		msleep(10);
> +
> +		/* Take IP out of reset */
> +		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
> +	}
> +
> +	spin_unlock_irqrestore(gate->lock, flags);
> +
> +	return 0;
> +}
> +
> +static void aspeed_clk_disable(struct clk_hw *hw)
> +{
> +	struct aspeed_clk_gate *gate =3D to_aspeed_clk_gate(hw);
> +	unsigned long flags;
> +	u32 clk =3D BIT(gate->clock_idx);
> +
> +	spin_lock_irqsave(gate->lock, flags);
> +
> +	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, clk);
> +
> +	spin_unlock_irqrestore(gate->lock, flags);
> +}
> +
> +static int aspeed_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct aspeed_clk_gate *gate =3D to_aspeed_clk_gate(hw);
> +	u32 clk =3D BIT(gate->clock_idx);
> +	u32 reg;
> +
> +	regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
> +
> +	return (reg & clk) ? 0 : 1;

Kill a branch, save the internet: return !(reg & clk);

But regardless, the patch seems sensible to me modulo the power domain
discussion. However as it's more clk-y than Aspeed-y I don't feel entirely
qualified to provide a r-b, so instead:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> +}
> +
> +static const struct clk_ops aspeed_clk_gate_ops =3D {
> +	.enable =3D aspeed_clk_enable,
> +	.disable =3D aspeed_clk_disable,
> +	.is_enabled =3D aspeed_clk_is_enabled,
> +};
> +
> +static struct clk_hw *aspeed_clk_hw_register_gate(struct device *dev,
> +		const char *name, const char *parent_name, unsigned long flags,
> +		struct regmap *map, u8 clock_idx, u8 reset_idx,
> +		u8 clk_gate_flags, spinlock_t *lock)
> +{
> +	struct aspeed_clk_gate *gate;
> +	struct clk_init_data init;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name =3D name;
> +	init.ops =3D &aspeed_clk_gate_ops;
> +	init.flags =3D flags;
> +	init.parent_names =3D parent_name ? &parent_name : NULL;
> +	init.num_parents =3D parent_name ? 1 : 0;
> +
> +	gate->map =3D map;
> +	gate->clock_idx =3D clock_idx;
> +	gate->reset_idx =3D reset_idx;
> +	gate->flags =3D clk_gate_flags;
> +	gate->lock =3D lock;
> +	gate->hw.init =3D &init;
> +
> +	hw =3D &gate->hw;
> +	ret =3D clk_hw_register(dev, hw);
> +	if (ret) {
> +		kfree(gate);
> +		hw =3D ERR_PTR(ret);
> +	}
> +
> +	return hw;
> +}
> +
> =C2=A0static int aspeed_clk_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	const struct aspeed_clk_soc_data *soc_data;
> @@ -235,6 +336,7 @@ static int aspeed_clk_probe(struct platform_device *p=
dev)
> =C2=A0	struct regmap *map;
> =C2=A0	struct clk_hw *hw;
> =C2=A0	u32 val, rate;
> +	int i;
> =C2=A0
> =C2=A0	map =3D syscon_node_to_regmap(dev->of_node);
> =C2=A0	if (IS_ERR(map)) {
> @@ -323,6 +425,34 @@ static int aspeed_clk_probe(struct platform_device *=
pdev)
> =C2=A0		return PTR_ERR(hw);
> =C2=A0	aspeed_clk_data->hws[ASPEED_CLK_BCLK] =3D hw;
> =C2=A0
> +	/*
> +	=C2=A0* TODO: There are a number of clocks that not included in this dr=
iver
> +	=C2=A0* as more information is required:
> +	=C2=A0*=C2=A0=C2=A0=C2=A0D2-PLL
> +	=C2=A0*=C2=A0=C2=A0=C2=A0D-PLL
> +	=C2=A0*=C2=A0=C2=A0=C2=A0YCLK
> +	=C2=A0*=C2=A0=C2=A0=C2=A0RGMII
> +	=C2=A0*=C2=A0=C2=A0=C2=A0RMII
> +	=C2=A0*=C2=A0=C2=A0=C2=A0UART[1..5] clock source mux
> +	=C2=A0*/
> +
> +	for (i =3D 0; i < ARRAY_SIZE(aspeed_gates); i++) {
> +		const struct aspeed_gate_data *gd =3D &aspeed_gates[i];
> +
> +		hw =3D aspeed_clk_hw_register_gate(dev,
> +				gd->name,
> +				gd->parent_name,
> +				gd->flags,
> +				map,
> +				gd->clock_idx,
> +				gd->reset_idx,
> +				CLK_GATE_SET_TO_DISABLE,
> +				&aspeed_clk_lock);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +		aspeed_clk_data->hws[i] =3D hw;
> +	}
> +
> =C2=A0	return 0;
> =C2=A0};
> =C2=A0
--=-BeetCuN/SvIeRunHVKpo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1eFQAAoJEJ0dnzgO5LT5zigP/jTaCMcU/Me3Ykiw6fZAv02z
Jm+37vhC41qTGb8u73FblkrKPYjqvThI2Seafqtzt+7se0mEcegQWO5uqwAaUGYv
DWY34azfQUdXi4sDtBAHUUYAYXK2HSljZ1bBFh3QN6NrQZKrOxemILNBKKC9/IUB
wjQlmqACEiGZ/BP/G/wlMF2RBBtXKLDLCrsfyotVi0W4ddJ/q2f4URuzEZIrrJA7
GTbaa7wnr1N7fJpg+w7hwmaKG8OPDb6hEFM1M5CTLvDFOQ+/y+5b1cvG4kqqp7BO
wGLRD59Nn+XGOUL22hc6oz0xF01jN/HnboNFJK25qqvkC3nXRbqxYdvcE0Blx3YQ
y/PS+bgtEcayJOQ0eUIk15FPtkf/1EQo8oL4UE1C+s7F7g76dcGAjhp5T+3Oaydl
CYO44Qc8s+arx86+iqN0VeTep3vIs4FFyGD9KD9wDbz/8nLAKqKXBT+C1i0Hg/IX
p4U0pLIDs0DySbEpvRwfE1KZkJEt/UYvglSij9hakpJOs1/XrRQKcxFLx8GbedrC
T+K7xypauv7IidP3DCsVcSbDi3Hcl52lldKtnsbMu+FDgPBgIL0+GoZbNLYZ1TyD
6GDQDojyFttc/Urk5YPHJ5vtldxAMPvFFDG3USP8AA56suQeobMBPUbsvU0dWL+e
LLYktgo/GDPUlzqjbh7L
=0t2R
-----END PGP SIGNATURE-----

--=-BeetCuN/SvIeRunHVKpo--
