Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <6f1c2a2b-a7ac-6bf0-e753-4627598b7901@cogentembedded.com>
References: <20170218213936.142813519@cogentembedded.com> <CAMuHMdV1x2voYKnMKv8x3XvmGwBA8SgwkhJZcnkycypdPhVjzA@mail.gmail.com>
 <1b4f2247-d3cf-fcab-deaa-045db17a43bd@cogentembedded.com> <CAMuHMdWJ4svcghFzNaTAUGBCmH+fCGjm8Chsr29gDeAiu6Xmew@mail.gmail.com>
 <6f1c2a2b-a7ac-6bf0-e753-4627598b7901@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Feb 2017 21:09:42 +0100
Message-ID: <CAMuHMdVKn3JwcXy=MwEUb9nZdAbkzTH5K5Dcg5+LXG67Q36kYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: cpg-mssr: r8a7796: add IMR clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Tue, Feb 21, 2017 at 8:49 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 02/21/2017 10:39 PM, Geert Uytterhoeven wrote:
>>> On 02/20/2017 11:38 AM, Geert Uytterhoeven wrote:
>>>>> Add the IMR[0-1] clocks to the R8A7796 CPG/MSSR driver.
>>>>>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> --- linux.orig/drivers/clk/renesas/r8a7796-cpg-mssr.c
>>>>> +++ linux/drivers/clk/renesas/r8a7796-cpg-mssr.c
>>>>> @@ -179,6 +179,8 @@ static const struct mssr_mod_clk r8a7796
>>>>>         DEF_MOD("vin1",                  810,   R8A7796_CLK_S0D2),
>>>>>         DEF_MOD("vin0",                  811,   R8A7796_CLK_S0D2),
>>>>>         DEF_MOD("etheravb",              812,   R8A7796_CLK_S0D6),
>>>>> +       DEF_MOD("imr1",                  822,   R8A7796_CLK_S2D1),
>>>>> +       DEF_MOD("imr0",                  823,   R8A7796_CLK_S2D1),
>>>>
>>>> According to R-Car Gen3 Hardware Users Manual Rev.0.53E, the parent
>>>> clock is S0D2, like on H3 ES2.0.
>>>
>>>    Not S0D4? I'd expect that what they call "register access" to be
>>> controlled by the MSSR bits...

I think in reality, both are gated by the same MSSR bit ;-)

However, if the driver needs to know the frequency of the clock, or control it
(e.g. it's driving some external interface), it's always interested in the
module's internal clock, not the clock used for register access.  The latter
is just an artifact of synchronous hardware.

>> Good question...

I've just finished going over all modules and their (known) parents on R-Car
H3 (ES1.x and ES2.0), and M3-W.
If multiple clock inputs are known, we always use the internal clock, which
is consistent with my comment above.

>>>> Will queue in clk-renesas-for-v4.12 with corrected parent clock.
>>>
>>>    So, what have you used for 7795 and 7796?
>>
>> S2D1 for r8a7795 (H3 ES1.0)
>> S0D2 for r8a7796 (M3-W)
>>
>> And I planned to use S0D2 for H3 ES2.0, too.
>
>    Looks to me we should be using S0D4 for both. And perhaps the 2nd
> specifier for S0D2.

We typically don't list all other parents clocks, unless we need to
query/control them (especially if they can't be gated from Linux, like the
internal SxDy clocks).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
