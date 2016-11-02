Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <cb5ebfa8-f9c7-e211-aded-1dc65291a31a@cogentembedded.com>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
 <3797605.lKJkRScdp8@wasted.cogentembedded.com> <CAMuHMdWZ4uCMinq_RbmimH0Gz72a51ac0sCoBMZo97x2mGyJLQ@mail.gmail.com>
 <CAMuHMdW-X6jxcyV1GKtUZEAuiLiCqC47cB6ZcFys6mODRbYq8Q@mail.gmail.com> <cb5ebfa8-f9c7-e211-aded-1dc65291a31a@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Nov 2016 19:19:35 +0100
Message-ID: <CAMuHMdV-9HsW+Twpaeah62e4-aGeiLAY8eoNsXDxCYwDECPOng@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: add common R-Car Gen2 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Wed, Nov 2, 2016 at 7:11 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 11/02/2016 02:38 PM, Geert Uytterhoeven wrote:
>>>> Changes in version 2:
>>>> - added support  for non-existing PLL0CR;
>>>> - removed the function reading the mode pins;
>>>> - added/used the #define's for PLL0CR.STC;
>>>> - used CPG_FRQCRC_ZFC_SHIFT to #define CPG_FRQCRC_ZFC_MASK;
>>>> - removed rcar_gen2_read_modemr();
>>>> - added Geert's tag.
>>>>
>>>>  drivers/clk/renesas/rcar-gen2-cpg.c |  369
>>>> ++++++++++++++++++++++++++++++++++++
>>>>  drivers/clk/renesas/rcar-gen2-cpg.h |   42 ++++
>>>>  2 files changed, 411 insertions(+)
>>>>
>>>> Index: linux/drivers/clk/renesas/rcar-gen2-cpg.c
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> --- /dev/null
>>>> +++ linux/drivers/clk/renesas/rcar-gen2-cpg.c
>>>> @@ -0,0 +1,369 @@
>>>
>>>
>>>> +struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
>>>> +                                              const struct cpg_core_c=
lk
>>>> *core,
>>>> +                                              const struct
>>>> cpg_mssr_info *info,
>>>> +                                              struct clk **clks,
>>>> +                                              void __iomem *base)
>>>> +{
>>>
>>>
>>>> +       case CLK_TYPE_GEN2_PLL0:
>>>> +               /*
>>>> +                * PLL0  is a configurable multiplier clock except on
>>>> R-Car E2.
>>>
>>>
>>> ... and V2H.
>>>
>>>> +                * Register the PLL0 clock as a fixed factor clock for
>>>> now as
>>>> +                * there's  no generic multiplier clock implementation
>>>> and we
>>>> +                * currently have no need to change the multiplier
>>>> value.
>>>> +                */
>>>> +               mult =3D cpg_pll_config->pll0_mult;
>>>> +               if (mult) {
>>>> +                       /* PLL0 is VCO/3 on R-Car E2 */
>>>
>>>
>>> ... and V2H.
>>>
>>>> +                       div  =3D 3;
>>
>>
>> After seeing the r8a7745 driver, I think it would be better to use a
>> divider
>> value of 1 here (dropping the need for this branch), and handle the /3 i=
n
>> the
>> SoC-specific driver.
>> This would make it more similar to the other SoCs here (div =3D 1 in the
>> else
>> branch below), and to similar clocks in the SoC-specific driver
>> (e.g. DEF_FIXED("zg", ..., 3, 1) in r8a7743-cpg-mssr.c).
>
>    We'll then have to lie about the PLL0 output freq? I don't like it...

Do we? The divisor is not part of PLL0. The datasheet says:

  - For V2H/E2:
    "PLL circuit 0 multiplies EXTAL or EXTAL/2 clock."
  - For the other SoCs:
    "PLL circuit 0 multiplies EXTAL or EXTAL/2 clock. The
multiplication ratio is set by the PLL0CR."

Division is done _after_ PLL0, using the SYS-CPU clock divider.

 - For e.g. E2:
   "The SYS-CPU clock divider 1 divides PLL0 output clock. This
divider generates the AP-System core clocks (Z2=CF=86)."

AFAIU, this SYS-CPU clock divider is "/3" on E2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
