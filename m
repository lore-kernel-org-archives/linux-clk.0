Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170714142559.p6xp6dp4whlqcr5n@ninjato>
References: <1492624001-3758-13-git-send-email-ykaneko0929@gmail.com> <20170714142559.p6xp6dp4whlqcr5n@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 10:00:22 +0200
Message-ID: <CAMuHMdV0fLG6m5hdyMpeKxb1nz_L+xEmyjvZV0iotXMSK517zw@mail.gmail.com>
Subject: Re: clk: renesas: rcar-gen3: Fix error return code in cpg_sd_clock_recalc_rate
To: Wolfram Sang <wsa@the-dreams.de>, Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram, Kaneko-san,

On Fri, Jul 14, 2017 at 4:25 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, Apr 20, 2017 at 02:46:33AM +0900, Yoshihiro Kaneko wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> In .recalc_rate of struct clk_ops, it is desirable to return 0 if an
>> error occurs, but -EINVAL is returned. This patch fixes it.
>>
>> Fixes: 5b1defde7054 ("clk: renesas: cpg-mssr: Extract common R-Car Gen3 support code")
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Why is it desirable to return 0 if an error occurs? Because the return type is
unsigned long?

Is this routine allowed to fail? I don't see any handling of zero by
its callers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
