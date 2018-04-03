Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <TY1PR01MB1770B77B715CF949AC551EE9C0A50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1522344790-20061-1-git-send-email-geert+renesas@glider.be>
 <1522344790-20061-5-git-send-email-geert+renesas@glider.be> <TY1PR01MB1770B77B715CF949AC551EE9C0A50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Apr 2018 13:49:19 +0200
Message-ID: <CAMuHMdWSVh5EKwivGth=C=YkXObg_N8wNZ0VTBWgZ3k8Dmtveg@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: renesas: r8a7792: Fix LB clock divider
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Fabrizio,

On Tue, Apr 3, 2018 at 12:17 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>> Subject: [PATCH 4/5] clk: renesas: r8a7792: Fix LB clock divider
>>
>> The CLK_TYPE_GEN2_LB clock type is meant for SoCs like R-Car H2, where
>> the LB clock divider depends on the value of the MD18 pin.
>>
>> On R-Car V2H, the LB clock divider is fixed to 24.  Hence model the
>> clock as a fixed factor clock instead.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  drivers/clk/renesas/r8a7792-cpg-mssr.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/renesas/r8a7792-cpg-mssr.c b/drivers/clk/renesas/r8a7792-cpg-mssr.c
>> index 609a540804965c40..8b66e6f4b4584de1 100644
>> --- a/drivers/clk/renesas/r8a7792-cpg-mssr.c
>> +++ b/drivers/clk/renesas/r8a7792-cpg-mssr.c
>> @@ -53,7 +53,6 @@ static const struct cpg_core_clk r8a7792_core_clks[] __initconst = {
>>  DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2, CLK_PLL1, 2, 1),
>>
>>  /* Core Clock Outputs */
>> -DEF_BASE("lb",   R8A7792_CLK_LB,   CLK_TYPE_GEN2_LB,   CLK_PLL1),
>>  DEF_BASE("qspi", R8A7792_CLK_QSPI, CLK_TYPE_GEN2_QSPI, CLK_PLL1_DIV2),
>>
>>  DEF_FIXED("z",      R8A7792_CLK_Z,     CLK_PLL0,          1, 1),
>> @@ -63,6 +62,7 @@ static const struct cpg_core_clk r8a7792_core_clks[] __initconst = {
>>  DEF_FIXED("hp",     R8A7792_CLK_HP,    CLK_PLL1,         12, 1),
>>  DEF_FIXED("i",      R8A7792_CLK_I,     CLK_PLL1,          3, 1),
>>  DEF_FIXED("b",      R8A7792_CLK_B,     CLK_PLL1,         12, 1),
>> +DEF_FIXED("lb",     R8A7792_CLK_B,     CLK_PLL1,         24, 1),
>
> s/ R8A7792_CLK_B/ R8A7792_CLK_LB/
>
> With that fixed:
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, nice catch. Fixing up (also for r8a7794).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
