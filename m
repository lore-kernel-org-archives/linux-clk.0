Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: add common R-Car Gen2 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
 <3797605.lKJkRScdp8@wasted.cogentembedded.com>
 <CAMuHMdWZ4uCMinq_RbmimH0Gz72a51ac0sCoBMZo97x2mGyJLQ@mail.gmail.com>
 <CAMuHMdW-X6jxcyV1GKtUZEAuiLiCqC47cB6ZcFys6mODRbYq8Q@mail.gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cb5ebfa8-f9c7-e211-aded-1dc65291a31a@cogentembedded.com>
Date: Wed, 2 Nov 2016 21:11:20 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW-X6jxcyV1GKtUZEAuiLiCqC47cB6ZcFys6mODRbYq8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 11/02/2016 02:38 PM, Geert Uytterhoeven wrote:

>>> Add the common R-Car  Gen2 (and RZ/G) Clock Pulse Generator / Module Standby
>>> and Software Reset support code, using the CPG/MSSR driver core.
>>>
>>> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
>>> <geert+renesas@glider.be>.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> ---
>>> This patch is against the 'clk-next' branch of CLK group's 'linux.git' repo.
>>>
>>> Changes in version 2:
>>> - added support  for non-existing PLL0CR;
>>> - removed the function reading the mode pins;
>>> - added/used the #define's for PLL0CR.STC;
>>> - used CPG_FRQCRC_ZFC_SHIFT to #define CPG_FRQCRC_ZFC_MASK;
>>> - removed rcar_gen2_read_modemr();
>>> - added Geert's tag.
>>>
>>>  drivers/clk/renesas/rcar-gen2-cpg.c |  369 ++++++++++++++++++++++++++++++++++++
>>>  drivers/clk/renesas/rcar-gen2-cpg.h |   42 ++++
>>>  2 files changed, 411 insertions(+)
>>>
>>> Index: linux/drivers/clk/renesas/rcar-gen2-cpg.c
>>> ===================================================================
>>> --- /dev/null
>>> +++ linux/drivers/clk/renesas/rcar-gen2-cpg.c
>>> @@ -0,0 +1,369 @@
>>
>>> +struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
>>> +                                              const struct cpg_core_clk *core,
>>> +                                              const struct cpg_mssr_info *info,
>>> +                                              struct clk **clks,
>>> +                                              void __iomem *base)
>>> +{
>>
>>> +       case CLK_TYPE_GEN2_PLL0:
>>> +               /*
>>> +                * PLL0  is a configurable multiplier clock except on  R-Car E2.
>>
>> ... and V2H.
>>
>>> +                * Register the PLL0 clock as a fixed factor clock for now as
>>> +                * there's  no generic multiplier clock implementation and we
>>> +                * currently have no need to change the multiplier value.
>>> +                */
>>> +               mult = cpg_pll_config->pll0_mult;
>>> +               if (mult) {
>>> +                       /* PLL0 is VCO/3 on R-Car E2 */
>>
>> ... and V2H.
>>
>>> +                       div  = 3;
>
> After seeing the r8a7745 driver, I think it would be better to use a divider
> value of 1 here (dropping the need for this branch), and handle the /3 in the
> SoC-specific driver.
> This would make it more similar to the other SoCs here (div = 1 in the else
> branch below), and to similar clocks in the SoC-specific driver
> (e.g. DEF_FIXED("zg", ..., 3, 1) in r8a7743-cpg-mssr.c).

    We'll then have to lie about the PLL0 output freq? I don't like it...

MBR, Sergei
