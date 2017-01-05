Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] clk: vc5: Add support for IDT VersaClock 5P49V5923B
Date: Thu, 05 Jan 2017 16:13:01 +0200
Message-ID: <7398143.JfNZUDgVyk@avalon>
In-Reply-To: <a94799ce-0030-ee4b-3d07-b3c190d79ba5@gmail.com>
References: <20161228000045.4540-1-marek.vasut@gmail.com> <2015482.2Xx0FSfo4q@avalon> <a94799ce-0030-ee4b-3d07-b3c190d79ba5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

On Wednesday 04 Jan 2017 17:21:43 Marek Vasut wrote:
> On 01/03/2017 01:18 PM, Laurent Pinchart wrote:
> > On Monday 02 Jan 2017 14:46:29 Geert Uytterhoeven wrote:
> >> On Wed, Dec 28, 2016 at 1:00 AM, Marek Vasut wrote:
> >>> Add driver for IDT VersaClock 5 5P49V5923B chip. This chip has two
> >>> clock inputs, XTAL or CLK, which are muxed into single PLL/VCO input.
> >>> The PLL feeds two fractional dividers. Each fractional divider feeds
> >>> output mux, which allows selecting between clock from the fractional
> >>> divider itself or from output mux on output N-1. In case of output
> >>> mux 0, the output N-1 is instead connected to the output from the mux
> >>> feeding the PLL.
> >>> 
> >>> The driver thus far supports only the 5P49V5923B, while it should be
> >>> easily extensible to the whole 5P49V59xx family of chips as they are
> >>> all pretty similar.
> >>> 
> >>> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> >>> Cc: Michael Turquette <mturquette@baylibre.com>
> >>> Cc: Stephen Boyd <sboyd@codeaurora.org>
> >>> ---
> >>> 
> >>>  .../devicetree/bindings/clock/idt,versaclock5.txt  |  41 ++
> >>>  drivers/clk/Kconfig                                |  10 +
> >>>  drivers/clk/Makefile                               |   1 +
> >>>  drivers/clk/clk-versaclock5.c                      | 696 +++++++++++++
> >>>  4 files changed, 748 insertions(+)
> >>>  create mode 100644
> >>>  Documentation/devicetree/bindings/clock/idt,versaclock5.txt create mode
> >>>  100644 drivers/clk/clk-versaclock5.c

[snip]

> >>> diff --git a/drivers/clk/clk-versaclock5.c
> >>> b/drivers/clk/clk-versaclock5.c
> >>> new file mode 100644
> >>> index 0000000..286689d
> >>> --- /dev/null
> >>> +++ b/drivers/clk/clk-versaclock5.c

[snip]

> >>> +static unsigned long vc5_mux_recalc_rate(struct clk_hw *hw,
> >>> +                                        unsigned long parent_rate)
> >>> +{
> >>> +       struct vc5_driver_data *vc5 =
> >>> +               container_of(hw, struct vc5_driver_data, clk_mux);
> >>> +       unsigned long idiv;
> >>> +       u8 div;
> >>> +
> >>> +       /* FIXME: Needs locking ? */
> > 
> > Let's fix it then :-)
> 
> I would like to get feedback on this one, does it ?

That's a question for Mike or Stephen I believe.

> >>> +       /* CLKIN within range of PLL input, feed directly to PLL. */
> >>> +       if (parent_rate <= 50000000) {
> >>> +               regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
> >>> +                                 
> >>> VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV,
> >>> +                                 
> >>> VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
> >>> +               regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff,
> >>> 0x00);
> >>> +               return parent_rate;
> >>> +       }
> >>> +
> >>> +       idiv = DIV_ROUND_UP(parent_rate, 50000000);
> >>> +       if (idiv > 127)
> >>> +               return -EINVAL;
> >>> +
> >>> +       /* We have dedicated div-2 predivider. */
> >>> +       if (idiv == 2)
> >>> +               div = VC5_REF_DIVIDER_SEL_PREDIV2;
> >>> +       else
> >>> +               div = VC5_REF_DIVIDER_REF_DIV(idiv);
> >>> +
> >>> +       regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, div);
> >>> +       regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
> >>> +                          VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV, 0);
> >>> +
> >>> +       return parent_rate / idiv;
> >>> +}

[snip]

> >>> +static int vc5_clk_out_set_parent(struct clk_hw *hw, u8 index)
> >>> +{
> >>> +       struct vc5_hw_data *hwdata = container_of(hw, struct
> >>> vc5_hw_data, hw);
> >>> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> >>> +       const u8 mask = VC5_OUT_DIV_CONTROL_RESET |
> >>> +                       VC5_OUT_DIV_CONTROL_SELB_NORM |
> >>> +                       VC5_OUT_DIV_CONTROL_SEL_EXT |
> >>> +                       VC5_OUT_DIV_CONTROL_EN_FOD;
> >>> +       const u8 extclk = VC5_OUT_DIV_CONTROL_SELB_NORM |
> >>> +                         VC5_OUT_DIV_CONTROL_SEL_EXT;
> >>> +       u8 src = VC5_OUT_DIV_CONTROL_RESET;
> >>> +
> >>> +       if (index == 0)
> >>> +               src |= VC5_OUT_DIV_CONTROL_EN_FOD;
> >>> +       else if (index == 1)
> >>> +               src |= extclk;
> >>> +       else
> >>> +               return -EINVAL;
> > 
> > Can this happen given that the number of parents is set to 2 ?
> 
> I believe it should not happen, but I'd rather sanitize the input here
> to be safe. Shall I remove it ?

I'd remove it as it can't happen. Being called with index > 1 would be similar 
to being called with hw == NULL, which you don't check explicitly. I don't 
think we should sanitize every input parameter value in every driver when the 
core is supposed to take care of that.

> >>> +       return regmap_update_bits(vc5->regmap,
> >>> VC5_OUT_DIV_CONTROL(hwdata->num),
> >>> +                                 mask, src);
> >>> +}

[snip]

> >>> +static int vc5_probe(struct i2c_client *client,
> >>> +                           const struct i2c_device_id *id)
> >>> +{
> >>> +       struct vc5_driver_data *vc5;
> >>> +       struct clk_init_data init;
> >>> +       const char *parent_names[2];
> >>> +       int ret, n;
> > 
> > n is never negative, you can make it an unsigned int.
> 
> Fixed
> 
> >>> +
> >>> +       vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
> >>> +       if (vc5 == NULL)
> >>> +               return -ENOMEM;
> >>> +
> >>> +       i2c_set_clientdata(client, vc5);
> >>> +       vc5->client = client;
> >>> +
> >>> +       vc5->pin_xin = devm_clk_get(&client->dev, "xin");
> >>> +       if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
> >>> +               return -EPROBE_DEFER;
> >>> +
> >>> +       vc5->pin_clkin = devm_clk_get(&client->dev, "clkin");
> >>> +       if (PTR_ERR(vc5->pin_clkin) == -EPROBE_DEFER)
> >>> +               return -EPROBE_DEFER;
> >>> +
> >>> +       vc5->regmap = devm_regmap_init_i2c(client, &vc5_regmap_config);
> >>> +       if (IS_ERR(vc5->regmap)) {
> >>> +               dev_err(&client->dev, "failed to allocate register
> >>> map\n");
> >>> +               return PTR_ERR(vc5->regmap);
> >>> +       }
> >>> +
> >>> +       if (!IS_ERR(vc5->pin_xin)) {
> >>> +               clk_prepare_enable(vc5->pin_xin);
> >>> +               vc5->pin_xin_name = __clk_get_name(vc5->pin_xin);
> >>> +               vc5->clk_mux_ins |= BIT(0);
> > 
> > You should define macros for the clk_mux_ins bits.
> 
> Fixed
> 
> >>> +       }
> >>> +
> >>> +       if (!IS_ERR(vc5->pin_clkin)) {
> >>> +               clk_prepare_enable(vc5->pin_clkin);
> > 
> > Shouldn't the input clocks be enabled only when at least one of the
> > outputs is enabled ?
> 
> Yes, I'll have to drill into this a bit.
> 
> >>> +               vc5->pin_clkin_name = __clk_get_name(vc5->pin_clkin);
> >>> +               vc5->clk_mux_ins |= BIT(1);
> >>> +       }
> >>> +
> >>> +       if (!vc5->clk_mux_ins) {
> >>> +               dev_err(&client->dev, "no input clock specified!\n");
> >>> +               return -EINVAL;
> >>> +       }
> >>> +
> >>> +       /* Register clock input mux */
> >>> +       memset(&init, 0, sizeof(init));
> >>> +       if (vc5->clk_mux_ins == (BIT(0) | BIT(1))) {
> >>> +               parent_names[0] = vc5->pin_xin_name;
> >>> +               parent_names[1] = vc5->pin_clkin_name;
> >>> +               init.num_parents = 2;
> >>> +       } else if (vc5->clk_mux_ins == BIT(0)) {
> >>> +               parent_names[0] = vc5->pin_xin_name;
> >>> +               init.num_parents = 1;
> >>> +       } else {
> >>> +               parent_names[0] = vc5->pin_clkin_name;
> >>> +               init.num_parents = 1;
> >>> +       }
> > 
> > How about
> > 
> > 	if (vc5->clk_mux_ins & BIT(0))
> > 	
> > 		parent_names[init.num_parents++] = vc5->pin_xin_name;
> > 	
> > 	if (vc5->clk_mux_ins & BIT(1))
> > 	
> > 		parent_names[init.num_parents++] = vc5->pin_clkin_name;
> > 
> > Even better, you could move this into you !IS_ERR(vc5->pin_xin) and
> > !IS_ERR(vc5->pin_clkin) checks above, and get rid of the temporary
> > pin_xin_name and pin_clkin_name fields that are only used for this
> > purpose.
> 
> That's nice indeed.
> 
> >>> +       init.name = vc5_mux_names[0];
> > 
> > I could be mistaken, but aren't clock names supposed to be unique ? If so,
> > you couldn't support multiple instances of this device.
> 
> By this device, you mean the mux or the clock chip ? In case of the
> former, if there is a VC5 with multiple muxes, the clock structure would
> need to be reworked indeed. In the later case, you access the
> device node (which is unique) and then the elements of it, which is
> again unique.

You're right, please ignore my comment.

> >>> +       init.ops = &vc5_mux_ops;
> >>> +       init.flags = 0;
> >>> +       init.parent_names = parent_names;
> >>> +       vc5->clk_mux.init = &init;
> >>> +       ret = devm_clk_hw_register(&client->dev, &vc5->clk_mux);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "unable to register %s\n",
> >>> init.name);
> >>> +               goto err_clk;
> >>> +       }
> >>> +
> >>> +       /* Register PLL */
> >>> +       memset(&init, 0, sizeof(init));
> >>> +       init.name = vc5_pll_names[0];
> >>> +       init.ops = &vc5_pll_ops;
> >>> +       init.flags = CLK_SET_RATE_PARENT;
> >>> +       init.parent_names = vc5_mux_names;
> >>> +       init.num_parents = 1;
> >>> +       vc5->clk_pll.num = 0;
> >>> +       vc5->clk_pll.vc5 = vc5;
> >>> +       vc5->clk_pll.hw.init = &init;
> >>> +       ret = devm_clk_hw_register(&client->dev, &vc5->clk_pll.hw);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "unable to register %s\n",
> >>> init.name);
> >>> +               goto err_clk;
> >>> +       }
> >>> +
> >>> +       /* Register FODs */
> >>> +       for (n = 0; n < 2; n++) {
> >>> +               memset(&init, 0, sizeof(init));
> >>> +               init.name = vc5_fod_names[n];
> >>> +               init.ops = &vc5_fod_ops;
> >>> +               init.flags = CLK_SET_RATE_PARENT;
> >>> +               init.parent_names = vc5_pll_names;
> >>> +               init.num_parents = 1;
> >>> +               vc5->clk_fod[n].num = n;
> >>> +               vc5->clk_fod[n].vc5 = vc5;
> >>> +               vc5->clk_fod[n].hw.init = &init;
> >>> +               ret = devm_clk_hw_register(&client->dev,
> >>> &vc5->clk_fod[n].hw);
> >>> +               if (ret) {
> >>> +                       dev_err(&client->dev, "unable to register %s\n",
> >>> +                               init.name);
> >>> +                       goto err_clk;
> >>> +               }
> >>> +       }
> >>> +
> >>> +       /* Register OUT1 and OUT2 */
> >>> +       for (n = 0; n < 2; n++) {
> >>> +               parent_names[0] = vc5_fod_names[n];
> >>> +               if (n == 0)
> >>> +                       parent_names[1] = vc5_mux_names[0];
> >>> +               else
> >>> +                       parent_names[1] = vc5_clk_out_names[n];
> >>> +
> >>> +               memset(&init, 0, sizeof(init));
> >>> +               init.name = vc5_clk_out_names[n + 1];
> >>> +               init.ops = &vc5_clk_out_ops;
> >>> +               init.flags = CLK_SET_RATE_PARENT;
> >>> +               init.parent_names = parent_names;
> >>> +               init.num_parents = 2;
> >>> +               vc5->clk_out[n].num = n;
> >>> +               vc5->clk_out[n].vc5 = vc5;
> >>> +               vc5->clk_out[n].hw.init = &init;
> >>> +               ret = devm_clk_hw_register(&client->dev,
> >>> +                                          &vc5->clk_out[n].hw);
> >>> +               if (ret) {
> >>> +                       dev_err(&client->dev, "unable to register %s\n",
> >>> +                               init.name);
> >>> +                       goto err_clk;
> >>> +               }
> >>> +       }
> >>> +
> >>> +       ret = of_clk_add_hw_provider(client->dev.of_node,
> >>> vc5_of_clk_get,
> >>> vc5);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "unable to add clk provider\n");
> >>> +               goto err_clk;
> >>> +       }
> >>> +
> >>> +       return 0;
> >>> +
> >>> +err_clk:
> >>> +       if (!IS_ERR(vc5->pin_xin))
> >>> +               clk_disable_unprepare(vc5->pin_xin);
> >>> +       if (!IS_ERR(vc5->pin_clkin))
> >>> +               clk_disable_unprepare(vc5->pin_clkin);
> >>> +       return ret;
> >>> +}

[snip]

-- 
Regards,

Laurent Pinchart
