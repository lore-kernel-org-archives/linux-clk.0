Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH V3] clk: vc5: Add support for IDT VersaClock 5P49V5923B
 and 5P49V5933
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170110174740.16223-1-marek.vasut@gmail.com>
 <CAMuHMdW4itFCtVsRk6t1xj7KLmTbRwR8gMGhALa4kd09XF4F6A@mail.gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c3ac69cc-7e75-ab03-ec98-95d1fb9f6e46@gmail.com>
Date: Tue, 10 Jan 2017 19:29:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW4itFCtVsRk6t1xj7KLmTbRwR8gMGhALa4kd09XF4F6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 01/10/2017 07:19 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi!

> On Tue, Jan 10, 2017 at 6:47 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Add driver for IDT VersaClock 5 5P49V5923B and 5P49V5933 chips. These
>> chips have two clock inputs, XTAL or CLK, which are muxed into single
>> PLL/VCO input. In case of 5P49V5923B, the XTAL in built into the chip
>> while the 5P49V5923B requires external XTAL.
>>
>> The PLL feeds two fractional dividers. Each fractional divider feeds
>> output mux, which allows selecting between clock from the fractional
>> divider itself or from output mux on output N-1. In case of output
>> mux 0, the output N-1 is instead connected to the output from the mux
>> feeding the PLL.
>>
>> The driver thus far supports only the 5P49V5923B and 5P49V5933, while
>> it should be easily extensible to the whole 5P49V59xx family of chips
>> as they are all pretty similar.
> 
> According to the datasheet, r8a7795/salvator-x has '5923A, while
> r8a7796-salvator-x has '5923B. I guess the driver is supposed to work with
> both, as the first version was tested on r8a7795/salvator-x?
> Shouldn't that be reflected in the bindings and compatible value?
>
> Do you know what's the difference between the '5923A and '5923B
> variants?

Look at this update notice:
https://www.idt.com/document/pcn/pcn-mm1510-01-programming-configuration-change-versa-clock

TLDR the VCO monitoring bit is turned off on rev. B, which shouldn't
affect the behavior of the chip.

I only tested the patch with rev B chip, but it should work with rev A
too and I'd love to have a single binding for both, ie "idt,5p49v5923".
I think I'll just send a V4 patch and update the compat string to drop
the B at the end. Agreed ?

>> --- /dev/null
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -0,0 +1,823 @@
> 
>> +static int vc5_probe(struct i2c_client *client,
>> +                    const struct i2c_device_id *id)
>> +{
>> +       const struct of_device_id *of_id =
>> +               of_match_device(clk_vc5_of_match, &client->dev);
>> +       struct vc5_driver_data *vc5;
>> +       struct clk_init_data init;
>> +       const char *parent_names[2];
>> +       unsigned int n, idx;
>> +       int ret;
>> +
>> +       vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
>> +       if (vc5 == NULL)
>> +               return -ENOMEM;
>> +
>> +       i2c_set_clientdata(client, vc5);
>> +       vc5->client = client;
>> +       vc5->model = (enum vc5_model)of_id->data;
>> +
>> +       vc5->pin_xin = devm_clk_get(&client->dev, "xin");
>> +       if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
>> +               return -EPROBE_DEFER;
>> +
>> +       vc5->pin_clkin = devm_clk_get(&client->dev, "clkin");
>> +       if (PTR_ERR(vc5->pin_clkin) == -EPROBE_DEFER)
>> +               return -EPROBE_DEFER;
>> +
>> +       vc5->regmap = devm_regmap_init_i2c(client, &vc5_regmap_config);
>> +       if (IS_ERR(vc5->regmap)) {
>> +               dev_err(&client->dev, "failed to allocate register map\n");
>> +               return PTR_ERR(vc5->regmap);
>> +       }
>> +
>> +       /* Register clock input mux */
>> +       memset(&init, 0, sizeof(init));
>> +
>> +       if (!IS_ERR(vc5->pin_xin)) {
>> +               clk_prepare_enable(vc5->pin_xin);
>> +               vc5->clk_mux_ins |= VC5_MUX_IN_XIN;
>> +               parent_names[init.num_parents++] = __clk_get_name(vc5->pin_xin);
>> +       } else if (vc5->model == IDT_VC5_5P49V5933) {
>> +               /* IDT VC5 5P49V5933 has built-in oscilator. */
>> +               vc5->pin_xin = clk_register_fixed_rate(&client->dev,
>> +                                                      "internal-xtal", NULL,
>> +                                                      0, 25000000);
> 
> What happens if you have two VC5 instances, each creating their own
> "internal-xtal" using the same clock name?

The fixed rate clock will have different device node (client->dev)
associated with them, so you'll have two internal-xtal clock in the
clock tree, but represented with two different kernel objects.

-- 
Best regards,
Marek Vasut
