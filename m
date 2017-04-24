Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAMuHMdUM=7-tMajOCUWjDTpSZO+EtDzWYz1+a2h-m=sodjTiBA@mail.gmail.com>
References: <1492624001-3758-8-git-send-email-ykaneko0929@gmail.com> <CAMuHMdUM=7-tMajOCUWjDTpSZO+EtDzWYz1+a2h-m=sodjTiBA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2017 10:10:30 +0200
Message-ID: <CAMuHMdXAkprpLHpnQVEDAWjom7UBYgiJ+5-nyCccQBc=toqOeQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add Audio-DMAC clocks
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 20, 2017 at 8:35 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 19, 2017 at 7:46 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>
>> This patch adds A-DMAC{0,1} clocks for R8A7796 SoC.
>>
>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>> This patch is based on the clk-next branch of linux-clk tree.
>>
>>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> index c6c5026..f217796 100644
>> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> @@ -138,6 +138,8 @@ enum clk_ids {
>>         DEF_MOD("sdif0",                 314,   R8A7796_CLK_SD0),
>>         DEF_MOD("rwdt",                  402,   R8A7796_CLK_R),
>>         DEF_MOD("intc-ap",               408,   R8A7796_CLK_S3D1),
>> +       DEF_MOD("audmac0",               502,   R8A7796_CLK_S3D4),
>> +       DEF_MOD("audmac1",               501,   R8A7796_CLK_S3D4),
>
> I believe the parent clock should be S0D3, like on R-Car H3 ES2.0,
> cfr. commits
> 5573d194128b4733 ("clk: renesas: r8a7795: Add support for R-Car H3 ES2.0")
> a843ed3f6c3e856f ("clk: renesas: r8a7795: Correct parent clock and
> sort order for Audio DMACs")
>
> Please sort by module clock number.

Fixing those up while applying.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
