Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170426071120.GB25517@verge.net.au>
References: <1493141638-28940-1-git-send-email-geert+renesas@glider.be> <20170426071120.GB25517@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2017 11:00:33 +0200
Message-ID: <CAMuHMdW7ZrYd8tr0iHB5p1zO_cY=kro+HVc+jNEe1b1Bz0S-Fw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Use pm_clk_no_clocks() helper i.s.o. direct access
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 26, 2017 at 9:11 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Apr 25, 2017 at 07:33:58PM +0200, Geert Uytterhoeven wrote:
>> The pm_subsys_data.clock_list member exists only if CONFIG_PM_CLK=y.
>> Hence direct accesses to this field break compile-testing on platforms
>> where CONFIG_PM_CLK=n.
>>
>> To fix this, use the pm_clk_no_clocks() helper instead, for which a
>> dummy version is provided if CONFIG_PM_CLK=n.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <simon.horman@netronome.com>

Thanks, queued in clk-renesas-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
