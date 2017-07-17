Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170717091801.GA2129@katana>
References: <1492624001-3758-13-git-send-email-ykaneko0929@gmail.com>
 <20170714142559.p6xp6dp4whlqcr5n@ninjato> <CAMuHMdV0fLG6m5hdyMpeKxb1nz_L+xEmyjvZV0iotXMSK517zw@mail.gmail.com>
 <20170717091801.GA2129@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 12:18:39 +0200
Message-ID: <CAMuHMdVhuN1ozEmtDJnn63rvktE7Aj4FACzweaJzCMzP1q8BKw@mail.gmail.com>
Subject: Re: clk: renesas: rcar-gen3: Fix error return code in cpg_sd_clock_recalc_rate
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram,

On Mon, Jul 17, 2017 at 11:18 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> >> In .recalc_rate of struct clk_ops, it is desirable to return 0 if an
>> >> error occurs, but -EINVAL is returned. This patch fixes it.
>> >>
>> >> Fixes: 5b1defde7054 ("clk: renesas: cpg-mssr: Extract common R-Car Gen3 support code")
>> >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> >> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> >
>> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> Why is it desirable to return 0 if an error occurs? Because the return type is
>> unsigned long?
>
> Yes, I'd think so. Instead of an arbitrary high, kind-of-random, number, just
> return 0 which also indicates that something unexpected happened? Also, all
> other drivers return zero in an error case (did some quick coccinelle
> grepping before).

OK.

>> Is this routine allowed to fail? I don't see any handling of zero by
>> its callers.
>
> From clk-provider.h:
>
>  * @recalc_rate Recalculate the rate of this clock, by querying hardware. The
>  *              parent rate is an input parameter.  It is up to the caller to
>  *              ensure that the prepare_mutex is held across this call.
>  *              Returns the calculated rate.  Optional, but recommended - if
>  *              this op is not set then clock rate will be initialized to 0.
>
> What would be the benefit of keeping -EINVAL in an unsigned long?

I do not mean that -EINVAL is correct. Obviously it isn't. But blindly
replacing -EINVAL by zero may not be the right solution neither.

If recalc_rate cannot return an error value, perhaps there is a good reason
for that?

I see there's a similar check in cpg_sd_clock_enable(), so the clock also
cannot be enabled if this condition is met?

When does this happen? If the firmware leaves a invalid/unsupported setting
in the register? If we can't recover from that, perhaps the clock's probe
should just fail instead?

It looks like the only writer of that field is cpg_sd_clock_set_rate(),
which always writes a valid/supported value. Is it guaranteed that this
function is always called first?
If yes, the checks can just be removed instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
