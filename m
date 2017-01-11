Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH V4] clk: vc5: Add support for IDT VersaClock 5P49V5923 and
 5P49V5933
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20170110185020.20645-1-marek.vasut@gmail.com>
 <da3607ec-6405-ab2a-23d7-b0723ad75de5@gmail.com> <8755535.oe5AAjKalT@avalon>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f1a287f5-6050-2e19-99c9-e17972e4db88@gmail.com>
Date: Wed, 11 Jan 2017 16:53:53 +0100
MIME-Version: 1.0
In-Reply-To: <8755535.oe5AAjKalT@avalon>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 01/11/2017 04:41 PM, Laurent Pinchart wrote:
> Hi Marek,

Hi!

> Thank you for the patch.
> 
> On Wednesday 11 Jan 2017 15:37:11 Marek Vasut wrote:
>> On 01/10/2017 07:50 PM, Marek Vasut wrote:
>>> Add driver for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips. These
>>> chips have two clock inputs, XTAL or CLK, which are muxed into single
>>> PLL/VCO input. In case of 5P49V5923, the XTAL in built into the chip
>>> while the 5P49V5923 requires external XTAL.
>>>
>>> The PLL feeds two fractional dividers. Each fractional divider feeds
>>> output mux, which allows selecting between clock from the fractional
>>> divider itself or from output mux on output N-1. In case of output
>>> mux 0, the output N-1 is instead connected to the output from the mux
>>> feeding the PLL.
>>>
>>> The driver thus far supports only the 5P49V5923 and 5P49V5933, while
>>> it should be easily extensible to the whole 5P49V59xx family of chips
>>> as they are all pretty similar.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>>
>> +Cc Laurent, linux-renesas
>>
>>> ---
>>> V2: - Drop address-cells and size-cells from the binding
>>>     - Add clock-names to the binding
>>>     - Drop vc5_input_names
>>>     - Fix assortment of spelling mistakes
>>>     - Switch div_frc and div_int datatype to uXX
>>>     - Switch f_in to u32
>>>     - Add missing remove
>>>     - Define macros for handling XIN and CLKIN
>>>     - Rework the FOD fractional divider calculation, this was wrong
>>>       and made the output clock be off considerably under certain
>>>       circumstances (when the fractional part was large).
>>>
>>> V3: - Rework the MUX frequency recalculation and divider configration
>>>       so that it fits into the clock framework
>>>     - Add support for 5P49V5933 chip to lay groundwork for adding more
>>>       chips easily.
>>>     - Export the OUT0_SEL_I2CB output into the clock framework, so it
>>>       can be accessed from DT as well. WARNING: This does change the
>>>       bindings, clock0 is now the OUT0_SEL_I2CB, clock1 is OUT1 and
>>>       clock2 is OUT2 (or OUT4 on the 5P49V5933).
>>>     - Drop unnecessary caching of pin_*_name clock name and clk_hw
>>>       structures in driver data.
>>>     - Add missing MAINTAINERS entry
>>>
>>> V4: - Support also 5P49V5923A by dropping the B from the bindings and
>>>       code. According to the update notice, the chips are identical
>>>       except for disabling the VCO monitoring, which is internal
>>>       factory-defined bit and has no impact on silicon performance.
>>>
>>> ---
>>>
>>>  .../devicetree/bindings/clock/idt,versaclock5.txt  |  43 ++
> 
> If you decide to split the bindings in a separate patch as often requested by 
> the DT reviewers,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> for them. Please see below for more comments.
> 
>>>  MAINTAINERS                                        |   5 +
>>>  drivers/clk/Kconfig                                |  10 +
>>>  drivers/clk/Makefile                               |   1 +
>>>  drivers/clk/clk-versaclock5.c                      | 821 ++++++++++++++++
>>>  5 files changed, 880 insertions(+)
>>>  create mode 100644
>>>  Documentation/devicetree/bindings/clock/idt,versaclock5.txt create mode
>>>  100644 drivers/clk/clk-versaclock5.c
> 
> [snip]
> 
>>> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
>>> new file mode 100644
>>> index 000000000000..14f518e84d6d
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-versaclock5.c
> 
> [snip]
> 
>>> +/*
>>> + * VersaClock5 i2c regmap
>>> + */
>>> +static bool vc5_regmap_is_writeable(struct device *dev, unsigned int reg)
>>> +{
>>> +	/* Factory reserved regs, make them read-only */
>>> +	if (reg >= 0 && reg <= 0xf)
> 
> reg is unsigned, it will always be >= 0. You can drop the first part of the 
> condition.

Fixed

>>> +		return false;
>>> +
>>> +	/* Factory reserved regs, make them read-only */
>>> +	if (reg == 0x14 || reg == 0x1c || reg == 0x1d)
>>> +		return false;
>>> +
>>> +	return true;
>>> +}
> 
> [snip]
> 
>>> +static long vc5_mux_round_rate(struct clk_hw *hw, unsigned long rate,
>>> +			       unsigned long *parent_rate)
>>> +{
>>> +	unsigned long idiv;
>>> +
>>> +	/* PLL cannot operate with input clock above 50 MHz. */
>>> +	if (rate > 50000000)
>>> +		return -EINVAL;
> 
> As this is a PLL constraint, shouldn't it be enforced by vc5_pll_round_rate() 
> instead ?

vc5_pll_round_rate can only enforce PLL output frequency, not input
frequency AFAICT .

>>> +	/* CLKIN within range of PLL input, feed directly to PLL. */
>>> +	if (*parent_rate <= 50000000)
>>> +		return *parent_rate;
>>> +
>>> +	idiv = DIV_ROUND_UP(*parent_rate, rate);
>>> +	if (idiv > 127)
>>> +		return -EINVAL;
>>> +
>>> +	return *parent_rate / idiv;
>>> +}

[...]

>>> +static struct clk_hw *
>>> +vc5_of_clk_get(struct of_phandle_args *clkspec, void *data)
>>> +{
>>> +	struct vc5_driver_data *vc5 = data;
>>> +	unsigned int idx = clkspec->args[0];
>>> +
>>> +	if (idx > 2) {
>>> +		pr_err("%s: invalid index %u\n", __func__, idx);
> 
> Does this deserve an error message ?

I think it does, the driver will yell if you use incorrect index in the
bindings.

>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>> +	return &vc5->clk_out[idx].hw;
>>> +}
>>> +
>>> +static int vc5_map_index_to_output(const enum vc5_model model,
>>> +				   const unsigned int n)
>>> +{
>>> +	switch (model) {
>>> +	case IDT_VC5_5P49V5923:
>>> +		if (n == 0)	/* OUT1 */
>>> +			return 0;
>>> +		if (n == 1)	/* OUT2 */
>>> +			return 1;
>>> +		break;
>>> +	case IDT_VC5_5P49V5933:
>>> +		if (n == 0)	/* OUT1 */
>>> +			return 0;
>>> +		if (n == 1)	/* OUT4 */
>>> +			return 3;
>>> +		break;
>>> +	}
>>> +
>>> +	/*
>>> +	 * If we got here, there is certainly a bug in the driver,
>>> +	 * but we shouldn't crash the kernel.
>>> +	 */
>>> +	WARN_ON("Invalid clock index!\n");
>>> +	return -EINVAL;
> 
> I don't think that's needed. The function is called from two locations only, 
> and they're both very easy to audit. You can just return n in the 
> IDT_VC5_5P49V5923 case and return n == 0 ? 0 : 3 in the other case.

OK, dropped and fixed.

>>> +}
> 
> [snip]
> 
>>> +static int vc5_probe(struct i2c_client *client,
>>> +                  const struct i2c_device_id *id)
>>> +{
>>> +     const struct of_device_id *of_id =
>>> +             of_match_device(clk_vc5_of_match, &client->dev);
>>> +     struct vc5_driver_data *vc5;
>>> +     struct clk_init_data init;
>>> +     const char *parent_names[2];
>>> +     unsigned int n, idx;
>>> +     int ret;
>>> +
>>> +     vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
>>> +     if (vc5 == NULL)
>>> +             return -ENOMEM;
>>> +
>>> +     i2c_set_clientdata(client, vc5);
>>> +     vc5->client = client;
>>> +     vc5->model = (enum vc5_model)of_id->data;
>>> +
>>> +     vc5->pin_xin = devm_clk_get(&client->dev, "xin");
>>> +     if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
>>> +             return -EPROBE_DEFER;
>>> +
>>> +     vc5->pin_clkin = devm_clk_get(&client->dev, "clkin");
>>> +     if (PTR_ERR(vc5->pin_clkin) == -EPROBE_DEFER)
>>> +             return -EPROBE_DEFER;
>>> +
>>> +     vc5->regmap = devm_regmap_init_i2c(client, &vc5_regmap_config);
>>> +     if (IS_ERR(vc5->regmap)) {
>>> +             dev_err(&client->dev, "failed to allocate register map\n");
>>> +             return PTR_ERR(vc5->regmap);
>>> +     }
>>> +
>>> +     /* Register clock input mux */
>>> +     memset(&init, 0, sizeof(init));
>>> +
>>> +     if (!IS_ERR(vc5->pin_xin)) {
>>> +             clk_prepare_enable(vc5->pin_xin);
> 
> Given that the CCF core will take care of enabling/disabling parents as 
> needed, do you need this ?

It should, so, dropped.

[...]

-- 
Best regards,
Marek Vasut
