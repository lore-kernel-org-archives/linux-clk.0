Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <SG2PR06MB116595E38DF9C7E4CE0083CD8A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20161215021134.14902-1-chris.brandt@renesas.com>
 <87bmwdoreh.wl%kuninori.morimoto.gx@renesas.com> <SG2PR06MB116595E38DF9C7E4CE0083CD8A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2016 09:42:51 +0100
Message-ID: <CAMuHMdX1Uvna+zi+N=TEYMqFUt1CRfTjjbLsTg_H2C4GJnLenA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: mstp: Support 8-bit registers for r7s72100
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Thu, Dec 15, 2016 at 3:58 AM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Dec 14, 2016, Kuninori Morimoto wrote:
>> I don't think using global variable is a good idea.
>> For example, how about add reg_width_8bit into mstp_clock_group, and
>> cpg_mstp_read/write requests it, or something like that ?
>
> If I make a separate CLK_OF_DECLARE like this:
>
> static void __init cpg_mstp_clocks_init8(struct device_node *np) {
>         reg_width_8bit = true;
>         cpg_mstp_clocks_init(np);
> }
> CLK_OF_DECLARE(cpg_mstp_clks8, "renesas,r7s72100-mstp-clocks",
>                cpg_mstp_clocks_init8);
>
>
> The only way I can pass the 8-bit/32-bit choice into cpg_mstp_clocks_init()
> is using a global variable.
>
>
> Unless, I change the API to cpg_mstp_clocks_init(np, reg_width_8bit)
>
> But, that means adding another function:
>
> CLK_OF_DECLARE(cpg_mstp_clks32, "renesas,cpg-mstp-clocks",
>                cpg_mstp_clocks_init32);
>
> CLK_OF_DECLARE(cpg_mstp_clks8, "renesas,r7s72100-mstp-clocks",
>                cpg_mstp_clocks_init8);
>
> static void __init cpg_mstp_clocks_init32(struct device_node *np)
> {
>         cpg_mstp_clocks_init(np, false);
> }
> static void __init cpg_mstp_clocks_init8(struct device_node *np)
> {
>         cpg_mstp_clocks_init(np, true);
> }

Or you can add an of_device_is_compatible(np, "renesas,r7s72100-mstp-clocks")
check to cpg_mstp_clocks_init(), keeping the single CLK_OF_DECLARE().

I think that would also performs slightly better, as only nodes compatible
with "renesas,cpg-mstp-clocks" would be subject to the additional check.

> A global variable is much easier, but if no one likes it, I can change to
> mstp_clock_group.reg_width_8bit instead.

Personally, I have no problem with the global variable: either you're running
on RZ/A1, and all MSTP clocks need 8-bit accesses, or you're not.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
