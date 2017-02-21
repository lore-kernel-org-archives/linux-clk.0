Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/1] clk: renesas: cpg-mssr: r8a7796: add IMR clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170218213936.142813519@cogentembedded.com>
 <CAMuHMdV1x2voYKnMKv8x3XvmGwBA8SgwkhJZcnkycypdPhVjzA@mail.gmail.com>
 <1b4f2247-d3cf-fcab-deaa-045db17a43bd@cogentembedded.com>
 <CAMuHMdWJ4svcghFzNaTAUGBCmH+fCGjm8Chsr29gDeAiu6Xmew@mail.gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6f1c2a2b-a7ac-6bf0-e753-4627598b7901@cogentembedded.com>
Date: Tue, 21 Feb 2017 22:49:41 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWJ4svcghFzNaTAUGBCmH+fCGjm8Chsr29gDeAiu6Xmew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02/21/2017 10:39 PM, Geert Uytterhoeven wrote:

>> On 02/20/2017 11:38 AM, Geert Uytterhoeven wrote:
>>>> Add the IMR[0-1] clocks to the R8A7796 CPG/MSSR driver.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>>> --- linux.orig/drivers/clk/renesas/r8a7796-cpg-mssr.c
>>>> +++ linux/drivers/clk/renesas/r8a7796-cpg-mssr.c
>>>> @@ -179,6 +179,8 @@ static const struct mssr_mod_clk r8a7796
>>>>         DEF_MOD("vin1",                  810,   R8A7796_CLK_S0D2),
>>>>         DEF_MOD("vin0",                  811,   R8A7796_CLK_S0D2),
>>>>         DEF_MOD("etheravb",              812,   R8A7796_CLK_S0D6),
>>>> +       DEF_MOD("imr1",                  822,   R8A7796_CLK_S2D1),
>>>> +       DEF_MOD("imr0",                  823,   R8A7796_CLK_S2D1),
>>>
>>>
>>> According to R-Car Gen3 Hardware Users Manual Rev.0.53E, the parent
>>> clock is S0D2, like on H3 ES2.0.
>>
>>    Not S0D4? I'd expect that what they call "register access" to be
>> controlled by the MSSR bits...
>
> Good question...
>
>>> Will queue in clk-renesas-for-v4.12 with corrected parent clock.
>>
>>    So, what have you used for 7795 and 7796?
>
> S2D1 for r8a7795 (H3 ES1.0)
> S0D2 for r8a7796 (M3-W)
>
> And I planned to use S0D2 for H3 ES2.0, too.

    Looks to me we should be using S0D4 for both. And perhaps the 2nd 
specifier for S0D2.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
