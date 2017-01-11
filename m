Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V4] clk: vc5: Add support for IDT VersaClock 5P49V5923 and 5P49V5933
Date: Wed, 11 Jan 2017 17:41:32 +0200
Message-ID: <8755535.oe5AAjKalT@avalon>
In-Reply-To: <da3607ec-6405-ab2a-23d7-b0723ad75de5@gmail.com>
References: <20170110185020.20645-1-marek.vasut@gmail.com> <da3607ec-6405-ab2a-23d7-b0723ad75de5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

Thank you for the patch.

On Wednesday 11 Jan 2017 15:37:11 Marek Vasut wrote:
> On 01/10/2017 07:50 PM, Marek Vasut wrote:
> > Add driver for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips. These
> > chips have two clock inputs, XTAL or CLK, which are muxed into single
> > PLL/VCO input. In case of 5P49V5923, the XTAL in built into the chip
> > while the 5P49V5923 requires external XTAL.
> > 
> > The PLL feeds two fractional dividers. Each fractional divider feeds
> > output mux, which allows selecting between clock from the fractional
> > divider itself or from output mux on output N-1. In case of output
> > mux 0, the output N-1 is instead connected to the output from the mux
> > feeding the PLL.
> > 
> > The driver thus far supports only the 5P49V5923 and 5P49V5933, while
> > it should be easily extensible to the whole 5P49V59xx family of chips
> > as they are all pretty similar.
> > 
> > Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> 
> +Cc Laurent, linux-renesas
> 
> > ---
> > V2: - Drop address-cells and size-cells from the binding
> >     - Add clock-names to the binding
> >     - Drop vc5_input_names
> >     - Fix assortment of spelling mistakes
> >     - Switch div_frc and div_int datatype to uXX
> >     - Switch f_in to u32
> >     - Add missing remove
> >     - Define macros for handling XIN and CLKIN
> >     - Rework the FOD fractional divider calculation, this was wrong
> >       and made the output clock be off considerably under certain
> >       circumstances (when the fractional part was large).
> > 
> > V3: - Rework the MUX frequency recalculation and divider configration
> >       so that it fits into the clock framework
> >     - Add support for 5P49V5933 chip to lay groundwork for adding more
> >       chips easily.
> >     - Export the OUT0_SEL_I2CB output into the clock framework, so it
> >       can be accessed from DT as well. WARNING: This does change the
> >       bindings, clock0 is now the OUT0_SEL_I2CB, clock1 is OUT1 and
> >       clock2 is OUT2 (or OUT4 on the 5P49V5933).
> >     - Drop unnecessary caching of pin_*_name clock name and clk_hw
> >       structures in driver data.
> >     - Add missing MAINTAINERS entry
> > 
> > V4: - Support also 5P49V5923A by dropping the B from the bindings and
> >       code. According to the update notice, the chips are identical
> >       except for disabling the VCO monitoring, which is internal
> >       factory-defined bit and has no impact on silicon performance.
> > 
> > ---
> > 
> >  .../devicetree/bindings/clock/idt,versaclock5.txt  |  43 ++

If you decide to split the bindings in a separate patch as often requested by 
the DT reviewers,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

for them. Please see below for more comments.

> >  MAINTAINERS                                        |   5 +
> >  drivers/clk/Kconfig                                |  10 +
> >  drivers/clk/Makefile                               |   1 +
> >  drivers/clk/clk-versaclock5.c                      | 821 ++++++++++++++++
> >  5 files changed, 880 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/clock/idt,versaclock5.txt create mode
> >  100644 drivers/clk/clk-versaclock5.c

[snip]

> > diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> > new file mode 100644
> > index 000000000000..14f518e84d6d
> > --- /dev/null
> > +++ b/drivers/clk/clk-versaclock5.c

[snip]

> > +/*
> > + * VersaClock5 i2c regmap
> > + */
> > +static bool vc5_regmap_is_writeable(struct device *dev, unsigned int reg)
> > +{
> > +	/* Factory reserved regs, make them read-only */
> > +	if (reg >= 0 && reg <= 0xf)

reg is unsigned, it will always be >= 0. You can drop the first part of the 
condition.

> > +		return false;
> > +
> > +	/* Factory reserved regs, make them read-only */
> > +	if (reg == 0x14 || reg == 0x1c || reg == 0x1d)
> > +		return false;
> > +
> > +	return true;
> > +}

[snip]

> > +static long vc5_mux_round_rate(struct clk_hw *hw, unsigned long rate,
> > +			       unsigned long *parent_rate)
> > +{
> > +	unsigned long idiv;
> > +
> > +	/* PLL cannot operate with input clock above 50 MHz. */
> > +	if (rate > 50000000)
> > +		return -EINVAL;

As this is a PLL constraint, shouldn't it be enforced by vc5_pll_round_rate() 
instead ?

> > +	/* CLKIN within range of PLL input, feed directly to PLL. */
> > +	if (*parent_rate <= 50000000)
> > +		return *parent_rate;
> > +
> > +	idiv = DIV_ROUND_UP(*parent_rate, rate);
> > +	if (idiv > 127)
> > +		return -EINVAL;
> > +
> > +	return *parent_rate / idiv;
> > +}
> > +
> > +static int vc5_mux_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			    unsigned long parent_rate)
> > +{
> > +	struct vc5_driver_data *vc5 =
> > +		container_of(hw, struct vc5_driver_data, clk_mux);
> > +	unsigned long idiv;
> > +	u8 div;
> > +
> > +	/* CLKIN within range of PLL input, feed directly to PLL. */
> > +	if (parent_rate <= 50000000) {
> > +		regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
> > +				   VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV,
> > +				   VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
> > +		regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, 0x00);
> > +		return 0;
> > +	}
> > +
> > +	idiv = DIV_ROUND_UP(parent_rate, rate);
> > +
> > +	/* We have dedicated div-2 predivider. */
> > +	if (idiv == 2)
> > +		div = VC5_REF_DIVIDER_SEL_PREDIV2;
> > +	else
> > +		div = VC5_REF_DIVIDER_REF_DIV(idiv);
> > +
> > +	regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, div);
> > +	regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
> > +			   VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV, 0);
> > +
> > +	return 0;
> > +}

[snip]

> > +static struct clk_hw *
> > +vc5_of_clk_get(struct of_phandle_args *clkspec, void *data)
> > +{
> > +	struct vc5_driver_data *vc5 = data;
> > +	unsigned int idx = clkspec->args[0];
> > +
> > +	if (idx > 2) {
> > +		pr_err("%s: invalid index %u\n", __func__, idx);

Does this deserve an error message ?

> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	return &vc5->clk_out[idx].hw;
> > +}
> > +
> > +static int vc5_map_index_to_output(const enum vc5_model model,
> > +				   const unsigned int n)
> > +{
> > +	switch (model) {
> > +	case IDT_VC5_5P49V5923:
> > +		if (n == 0)	/* OUT1 */
> > +			return 0;
> > +		if (n == 1)	/* OUT2 */
> > +			return 1;
> > +		break;
> > +	case IDT_VC5_5P49V5933:
> > +		if (n == 0)	/* OUT1 */
> > +			return 0;
> > +		if (n == 1)	/* OUT4 */
> > +			return 3;
> > +		break;
> > +	}
> > +
> > +	/*
> > +	 * If we got here, there is certainly a bug in the driver,
> > +	 * but we shouldn't crash the kernel.
> > +	 */
> > +	WARN_ON("Invalid clock index!\n");
> > +	return -EINVAL;

I don't think that's needed. The function is called from two locations only, 
and they're both very easy to audit. You can just return n in the 
IDT_VC5_5P49V5923 case and return n == 0 ? 0 : 3 in the other case.

> > +}

[snip]

> > +static int vc5_probe(struct i2c_client *client,
> > +                  const struct i2c_device_id *id)
> > +{
> > +     const struct of_device_id *of_id =
> > +             of_match_device(clk_vc5_of_match, &client->dev);
> > +     struct vc5_driver_data *vc5;
> > +     struct clk_init_data init;
> > +     const char *parent_names[2];
> > +     unsigned int n, idx;
> > +     int ret;
> > +
> > +     vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
> > +     if (vc5 == NULL)
> > +             return -ENOMEM;
> > +
> > +     i2c_set_clientdata(client, vc5);
> > +     vc5->client = client;
> > +     vc5->model = (enum vc5_model)of_id->data;
> > +
> > +     vc5->pin_xin = devm_clk_get(&client->dev, "xin");
> > +     if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
> > +             return -EPROBE_DEFER;
> > +
> > +     vc5->pin_clkin = devm_clk_get(&client->dev, "clkin");
> > +     if (PTR_ERR(vc5->pin_clkin) == -EPROBE_DEFER)
> > +             return -EPROBE_DEFER;
> > +
> > +     vc5->regmap = devm_regmap_init_i2c(client, &vc5_regmap_config);
> > +     if (IS_ERR(vc5->regmap)) {
> > +             dev_err(&client->dev, "failed to allocate register map\n");
> > +             return PTR_ERR(vc5->regmap);
> > +     }
> > +
> > +     /* Register clock input mux */
> > +     memset(&init, 0, sizeof(init));
> > +
> > +     if (!IS_ERR(vc5->pin_xin)) {
> > +             clk_prepare_enable(vc5->pin_xin);

Given that the CCF core will take care of enabling/disabling parents as 
needed, do you need this ?

> > +             vc5->clk_mux_ins |= VC5_MUX_IN_XIN;
> > +             parent_names[init.num_parents++] =
> > __clk_get_name(vc5->pin_xin);
> > +     } else if (vc5->model == IDT_VC5_5P49V5933) {
> > +             /* IDT VC5 5P49V5933 has built-in oscilator. */
> > +             vc5->pin_xin = clk_register_fixed_rate(&client->dev,
> > +                                                    "internal-xtal",
> > NULL,
> > +                                                    0, 25000000);
> > +             if (IS_ERR(vc5->pin_xin))
> > +                     return PTR_ERR(vc5->pin_xin);
> > +             vc5->clk_mux_ins |= VC5_MUX_IN_XIN;
> > +             parent_names[init.num_parents++] =
> > __clk_get_name(vc5->pin_xin); +     }
> > +
> > +     if (!IS_ERR(vc5->pin_clkin)) {
> > +             clk_prepare_enable(vc5->pin_clkin);
> > +             vc5->clk_mux_ins |= VC5_MUX_IN_CLKIN;
> > +             parent_names[init.num_parents++] =
> > +                     __clk_get_name(vc5->pin_clkin);
> > +     }
> > +
> > +     if (!init.num_parents) {
> > +             dev_err(&client->dev, "no input clock specified!\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     init.name = vc5_mux_names[0];
> > +     init.ops = &vc5_mux_ops;
> > +     init.flags = 0;
> > +     init.parent_names = parent_names;
> > +     vc5->clk_mux.init = &init;
> > +     ret = devm_clk_hw_register(&client->dev, &vc5->clk_mux);
> > +     if (ret) {
> > +             dev_err(&client->dev, "unable to register %s\n", init.name);
> > +             goto err_clk;
> > +     }
> > +
> > +     /* Register PLL */
> > +     memset(&init, 0, sizeof(init));
> > +     init.name = vc5_pll_names[0];
> > +     init.ops = &vc5_pll_ops;
> > +     init.flags = CLK_SET_RATE_PARENT;
> > +     init.parent_names = vc5_mux_names;
> > +     init.num_parents = 1;
> > +     vc5->clk_pll.num = 0;
> > +     vc5->clk_pll.vc5 = vc5;
> > +     vc5->clk_pll.hw.init = &init;
> > +     ret = devm_clk_hw_register(&client->dev, &vc5->clk_pll.hw);
> > +     if (ret) {
> > +             dev_err(&client->dev, "unable to register %s\n", init.name);
> > +             goto err_clk;
> > +     }
> > +
> > +     /* Register FODs */
> > +     for (n = 0; n < 2; n++) {
> > +             idx = vc5_map_index_to_output(vc5->model, n);
> > +             memset(&init, 0, sizeof(init));
> > +             init.name = vc5_fod_names[idx];
> > +             init.ops = &vc5_fod_ops;
> > +             init.flags = CLK_SET_RATE_PARENT;
> > +             init.parent_names = vc5_pll_names;
> > +             init.num_parents = 1;
> > +             vc5->clk_fod[n].num = idx;
> > +             vc5->clk_fod[n].vc5 = vc5;
> > +             vc5->clk_fod[n].hw.init = &init;
> > +             ret = devm_clk_hw_register(&client->dev,
> > &vc5->clk_fod[n].hw); +             if (ret) {
> > +                     dev_err(&client->dev, "unable to register %s\n",
> > +                             init.name);
> > +                     goto err_clk;
> > +             }
> > +     }
> > +
> > +     /* Register MUX-connected OUT0_I2C_SELB output */
> > +     memset(&init, 0, sizeof(init));
> > +     init.name = vc5_clk_out_names[0];
> > +     init.ops = &vc5_clk_out_ops;
> > +     init.flags = CLK_SET_RATE_PARENT;
> > +     init.parent_names = vc5_mux_names;
> > +     init.num_parents = 1;
> > +     vc5->clk_out[0].num = idx;
> > +     vc5->clk_out[0].vc5 = vc5;
> > +     vc5->clk_out[0].hw.init = &init;
> > +     ret = devm_clk_hw_register(&client->dev, &vc5->clk_out[0].hw);
> > +     if (ret) {
> > +             dev_err(&client->dev, "unable to register %s\n",
> > +                     init.name);
> > +             goto err_clk;
> > +     }
> > +
> > +     /* Register FOD-connected OUTx outputs */
> > +     for (n = 1; n < 3; n++) {
> > +             idx = vc5_map_index_to_output(vc5->model, n - 1);
> > +             parent_names[0] = vc5_fod_names[idx];
> > +             if (n == 1)
> > +                     parent_names[1] = vc5_mux_names[0];
> > +             else
> > +                     parent_names[1] = vc5_clk_out_names[n - 1];
> > +
> > +             memset(&init, 0, sizeof(init));
> > +             init.name = vc5_clk_out_names[idx + 1];
> > +             init.ops = &vc5_clk_out_ops;
> > +             init.flags = CLK_SET_RATE_PARENT;
> > +             init.parent_names = parent_names;
> > +             init.num_parents = 2;
> > +             vc5->clk_out[n].num = idx;
> > +             vc5->clk_out[n].vc5 = vc5;
> > +             vc5->clk_out[n].hw.init = &init;
> > +             ret = devm_clk_hw_register(&client->dev,
> > +                                        &vc5->clk_out[n].hw);
> > +             if (ret) {
> > +                     dev_err(&client->dev, "unable to register %s\n",
> > +                             init.name);
> > +                     goto err_clk;
> > +             }
> > +     }
> > +
> > +     ret = of_clk_add_hw_provider(client->dev.of_node, vc5_of_clk_get,
> > vc5); +     if (ret) {
> > +             dev_err(&client->dev, "unable to add clk provider\n");
> > +             goto err_clk;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_clk:
> > +     if (!IS_ERR(vc5->pin_xin))
> > +             clk_disable_unprepare(vc5->pin_xin);
> > +     if (!IS_ERR(vc5->pin_clkin))
> > +             clk_disable_unprepare(vc5->pin_clkin);
> > +     if (vc5->model == IDT_VC5_5P49V5933)
> > +             clk_unregister_fixed_rate(vc5->pin_xin);
> > +     return ret;
> > +}

[snip]

-- 
Regards,

Laurent Pinchart
