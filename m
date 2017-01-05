Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH] clk: vc5: Add support for IDT VersaClock 5P49V5923B
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20161228000045.4540-1-marek.vasut@gmail.com>
 <2015482.2Xx0FSfo4q@avalon> <a94799ce-0030-ee4b-3d07-b3c190d79ba5@gmail.com>
 <7398143.JfNZUDgVyk@avalon>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <69c22af5-717c-ce9d-5f4c-c1751894b885@gmail.com>
Date: Thu, 5 Jan 2017 16:44:42 +0100
MIME-Version: 1.0
In-Reply-To: <7398143.JfNZUDgVyk@avalon>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 01/05/2017 03:13 PM, Laurent Pinchart wrote:
> Hi Marek,

Hi!

[...]

>>>>> +static unsigned long vc5_mux_recalc_rate(struct clk_hw *hw,
>>>>> +                                        unsigned long parent_rate)
>>>>> +{
>>>>> +       struct vc5_driver_data *vc5 =
>>>>> +               container_of(hw, struct vc5_driver_data, clk_mux);
>>>>> +       unsigned long idiv;
>>>>> +       u8 div;
>>>>> +
>>>>> +       /* FIXME: Needs locking ? */
>>>
>>> Let's fix it then :-)
>>
>> I would like to get feedback on this one, does it ?
> 
> That's a question for Mike or Stephen I believe.

OK

>>>>> +       /* CLKIN within range of PLL input, feed directly to PLL. */
>>>>> +       if (parent_rate <= 50000000) {
>>>>> +               regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
>>>>> +                                 
>>>>> VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV,
>>>>> +                                 
>>>>> VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
>>>>> +               regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff,
>>>>> 0x00);
>>>>> +               return parent_rate;
>>>>> +       }
>>>>> +
>>>>> +       idiv = DIV_ROUND_UP(parent_rate, 50000000);
>>>>> +       if (idiv > 127)
>>>>> +               return -EINVAL;
>>>>> +
>>>>> +       /* We have dedicated div-2 predivider. */
>>>>> +       if (idiv == 2)
>>>>> +               div = VC5_REF_DIVIDER_SEL_PREDIV2;
>>>>> +       else
>>>>> +               div = VC5_REF_DIVIDER_REF_DIV(idiv);
>>>>> +
>>>>> +       regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, div);
>>>>> +       regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
>>>>> +                          VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV, 0);
>>>>> +
>>>>> +       return parent_rate / idiv;
>>>>> +}
> 
> [snip]
> 
>>>>> +static int vc5_clk_out_set_parent(struct clk_hw *hw, u8 index)
>>>>> +{
>>>>> +       struct vc5_hw_data *hwdata = container_of(hw, struct
>>>>> vc5_hw_data, hw);
>>>>> +       struct vc5_driver_data *vc5 = hwdata->vc5;
>>>>> +       const u8 mask = VC5_OUT_DIV_CONTROL_RESET |
>>>>> +                       VC5_OUT_DIV_CONTROL_SELB_NORM |
>>>>> +                       VC5_OUT_DIV_CONTROL_SEL_EXT |
>>>>> +                       VC5_OUT_DIV_CONTROL_EN_FOD;
>>>>> +       const u8 extclk = VC5_OUT_DIV_CONTROL_SELB_NORM |
>>>>> +                         VC5_OUT_DIV_CONTROL_SEL_EXT;
>>>>> +       u8 src = VC5_OUT_DIV_CONTROL_RESET;
>>>>> +
>>>>> +       if (index == 0)
>>>>> +               src |= VC5_OUT_DIV_CONTROL_EN_FOD;
>>>>> +       else if (index == 1)
>>>>> +               src |= extclk;
>>>>> +       else
>>>>> +               return -EINVAL;
>>>
>>> Can this happen given that the number of parents is set to 2 ?
>>
>> I believe it should not happen, but I'd rather sanitize the input here
>> to be safe. Shall I remove it ?
> 
> I'd remove it as it can't happen. Being called with index > 1 would be similar 
> to being called with hw == NULL, which you don't check explicitly. I don't 
> think we should sanitize every input parameter value in every driver when the 
> core is supposed to take care of that.

Dropped

The rest is done and I'll sort out the remaining bits (pm, gating) and
repost once I receive the kit.

-- 
Best regards,
Marek Vasut
