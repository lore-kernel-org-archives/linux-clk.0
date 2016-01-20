Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <569B631B.80708@gmail.com>
References: <1450951761-3160-1-git-send-email-dirk.behme@gmail.com>
	<5690ABCC.3090909@gmail.com>
	<CAMuHMdXa4qdrqu-RjPuxAHQwBJ5LZ+JsfWH83vcvp6EQ+M1-aA@mail.gmail.com>
	<5698C5E8.4040107@de.bosch.com>
	<CAMuHMdWb-mQ=Q53Bzr7wwYtvg6iA2xoVecTTnJj18Sp428r-jw@mail.gmail.com>
	<569B631B.80708@gmail.com>
Date: Wed, 20 Jan 2016 09:16:27 +0100
Message-ID: <CAMuHMdU+8QCje=C98neja31yjMR4H6Bz-_hN0ihk3WC=JXdVuQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: shmobile: r8a7795: Add SDHI clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Linux-sh list <linux-sh@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Dirk,

On Sun, Jan 17, 2016 at 10:47 AM, Dirk Behme <dirk.behme@gmail.com> wrote:
> On 15.01.2016 11:20, Geert Uytterhoeven wrote:
>> On Fri, Jan 15, 2016 at 11:11 AM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>> On 14.01.2016 19:24, Geert Uytterhoeven wrote:
>>>> On Sat, Jan 9, 2016 at 7:42 AM, Dirk Behme <dirk.behme@gmail.com> wrote:
>>>>> On 24.12.2015 11:09, Dirk Behme wrote:
>>>>>> Add R8A7795 SDHI clocks.
>>>>>> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
>>>>>> ---
>>>>>> Changes in v2: Add the missing *H clocks and correct the dividers.

>>>> The dividers for these clocks are not fixed, they are controlled by the
>>>> SDnCKCR registers.
>>>>
>>>> Unfortunately the register layout is more complicated than on R-Car
>>>> Gen2,
>>>> so
>>>> you can no longer use clk_register_divider_table(), but have to write a
>>>> custom
>>>> clock driver.
>>>>
>>>> For an initial version, a simple "read-only" version that just calls
>>>> clk_register_fixed_factor() with divider values read from the hardware
>>>> registers may be good enough. But for full support, you need a driver
>>>> that
>>>> can program the registers, too.
>>>
>>> Anything like
>>>
>>> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas-bsp.git/commit/drivers/clk/shmobile/clk-rcar-gen3.c?h=v4.2/rcar-3.0.x&id=cd10385afc15cef6bfbaea4aa5da41193b24fe82
>
> I've had a look to that.
>
> I think we can pick all the functions
>
> +static const struct clk_ops cpg_sd_clock_ops = {
> +       .enable = cpg_sd_clock_enable,
> +       .disable = cpg_sd_clock_disable,
> +       .is_enabled = cpg_sd_clock_is_enabled,
> +       .recalc_rate = cpg_sd_clock_recalc_rate,
> +       .round_rate = cpg_sd_clock_round_rate,
> +       .set_rate = cpg_sd_clock_set_rate,
> +};
>
> unchanged from that patch.
>
> However, I'm not sure how to interface this to cpg_mssr_probe()? It's
> similar to cpg_mssr_register_mod_clk(), but not identical so that this could
> be reused.
>
> We could extend r8a7795_cpg_mssr_info by anything like an additional
>
> /* Dynamic clocks */
> .dyn_clks = /* Add an array allowing to pass various clk_ops structs */
> ...
>
> ?
>
> Or we could hard code it like
>
> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas-bsp.git/commit/drivers/clk/shmobile/clk-rcar-gen3.c?h=v4.2/rcar-3.0.x&id=cd10385afc15cef6bfbaea4aa5da41193b24fe82
>
> is doing it with
>
> +       } else if (!strcmp(name, "sd0")) {
> +               return cpg_sd_clk_register(name, cpg->reg + CPG_SD0CKCR,
> np);
> +       } else if (!strcmp(name, "sd1")) {
> +               return cpg_sd_clk_register(name, cpg->reg + CPG_SD1CKCR,
> np);
> +       } else if (!strcmp(name, "sd2")) {
> +               return cpg_sd_clk_register(name, cpg->reg + CPG_SD2CKCR,
> np);
> +       } else if (!strcmp(name, "sd3")) {
> +               return cpg_sd_clk_register(name, cpg->reg + CPG_SD3CKCR,
> np);
>
> and add this to e.g. r8a7795_cpg_clk_register(). But, hmm.
>
>
> What do you think? Opinions? Examples?

Please extend enum r8a7795_clk_types, and handle them in
r8a7795_cpg_clk_register() based on the enum values.

You can find an (old) example in the prototype I did for r8a7791:
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/clk/shmobile/clk-r8a7791-cpg-mssr.c?h=topic/cpg-mssr-v4

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
