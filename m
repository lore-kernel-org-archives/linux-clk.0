Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/1] clk: renesas: cpg-mssr: r8a7796: add IMR clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170218213936.142813519@cogentembedded.com>
 <CAMuHMdV1x2voYKnMKv8x3XvmGwBA8SgwkhJZcnkycypdPhVjzA@mail.gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b66b04dc-44d4-216f-54aa-1db01a84bcb9@cogentembedded.com>
Date: Mon, 20 Feb 2017 23:11:56 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV1x2voYKnMKv8x3XvmGwBA8SgwkhJZcnkycypdPhVjzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02/20/2017 11:38 AM, Geert Uytterhoeven wrote:

>> Add the IMR[0-1] clocks to the R8A7796 CPG/MSSR driver.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> --- linux.orig/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> +++ linux/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> @@ -179,6 +179,8 @@ static const struct mssr_mod_clk r8a7796
>>         DEF_MOD("vin1",                  810,   R8A7796_CLK_S0D2),
>>         DEF_MOD("vin0",                  811,   R8A7796_CLK_S0D2),
>>         DEF_MOD("etheravb",              812,   R8A7796_CLK_S0D6),
>> +       DEF_MOD("imr1",                  822,   R8A7796_CLK_S2D1),
>> +       DEF_MOD("imr0",                  823,   R8A7796_CLK_S2D1),
>
> According to R-Car Gen3 Hardware Users Manual Rev.0.53E, the parent
> clock is S0D2, like on H3 ES2.0.

    I only have 0.51E here, doesn't seem to contain much of the clock info...

> Will queue in clk-renesas-for-v4.12 with corrected parent clock.

    Thank you!

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
