Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <b3825de9-16e8-94a4-0b23-bf0caf87a343@cogentembedded.com>
References: <1508162116-5043-1-git-send-email-geert+renesas@glider.be>
 <1508162116-5043-10-git-send-email-geert+renesas@glider.be> <b3825de9-16e8-94a4-0b23-bf0caf87a343@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2017 09:10:21 +0200
Message-ID: <CAMuHMdWtYrhU9RstX2ajasfD-psUK2zdUQcXWTa3FjnrwEFfJw@mail.gmail.com>
Subject: Re: [PATCH 09/10] [RFC] ravb: Remove obsolete explicit clock handling
 for WoL
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Mon, Oct 16, 2017 at 10:17 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 10/16/2017 04:55 PM, Geert Uytterhoeven wrote:
>> Currently, if Wake-on-LAN is enabled, the EtherAVB device's module clock
>> is manually kept running during system suspend, to make sure the device
>> stays active.
>>
>> Since "soc: renesas: rcar-sysc: Keep wakeup sources active during system
>> suspend", this workaround is no longer needed.  Hence remove all
>> explicit clock handling to keep the device active.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> [...]
>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>> b/drivers/net/ethernet/renesas/ravb_main.c
>> index fdf30bfa403bf416..11ffccca11d56df5 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>
> [...]
>>
>> @@ -2289,8 +2283,6 @@ static int __maybe_unused ravb_resume(struct device
>> *dev)
>>                  *       this clock dance should be removed.
>>                  */
>>                 clk_disable(priv->clk);
>> -               clk_disable(priv->clk);
>> -               clk_enable(priv->clk);
>>                 clk_enable(priv->clk);
>
>
>    I thought the entire clock dance could be removed now? Not yet?

The remaining clock dance steps work around PSCI powering down the SoC,
after which the hardware and Linux disagree about the clock state.
They can be removed after "[PATCH v3 0/5] clk: renesas: rcar-gen3: Restore
clocks during resume" has hit upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
