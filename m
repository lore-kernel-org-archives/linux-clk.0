Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160213011855.GL4847@codeaurora.org>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
	<1455225554-13267-6-git-send-email-mturquette@baylibre.com>
	<20160213011855.GL4847@codeaurora.org>
Date: Sun, 14 Feb 2016 15:51:56 +0100
Message-ID: <CAMuHMdX55j+-5SzMdsew_iBfxpnAWNoBQfr-tGMW_Xduf-x=WA@mail.gmail.com>
Subject: Re: [PATCH v42 5/6] clk: clk_put WARNs if user has not disabled clk
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Maxime Coquelin <maxime.coquelin@st.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Andre Przywara <andre.przywara@arm.com>, rklein@nvidia.com,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Mike,

On Sat, Feb 13, 2016 at 2:18 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 02/11, Michael Turquette wrote:
>> >From the clk_put kerneldoc in include/linux/clk.h:
>>
>> """
>> Note: drivers must ensure that all clk_enable calls made on this clock
>> source are balanced by clk_disable calls prior to calling this function.
>> """
>>
>> The common clock framework implementation of the clk.h api has per-user
>> reference counts for calls to clk_prepare and clk_disable. As such it
>> can enforce the requirement to properly call clk_disable and
>> clk_unprepare before calling clk_put.
>>
>> Because this requirement is probably violated in many places, this patch
>> starts with a simple warning. Once offending code has been fixed this
>> check could additionally release the reference counts automatically.
>
> Do we have any fixes for pm code in the works? I'm worried we're
> going to be giving a warning and nobody will fix them or has a
> plan to fix them.
drivers/base/power/clock_ops.c
AFAIK not.

I've been running with the above patch for several months, and I had
to remove the two clk_put() calls in {en,dis}able_clock() in
drivers/base/power/clock_ops.c to get rid of the warnings when using the
legacy clock domain.

Fixing drivers/base/power/clock_ops.c is non-trivial though, as you need a
place to store the clk's reference obtained in enable_clock(), for later use in
disable_clock().

However, the plan is to make CONFIG_PM=y mandatory for Renesas ARM
SoCs with clock domains, which makes us no longer users of the legacy clock
domain.

Legacy SH and Davinci/Keystone/OMAP1 users may care, though...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
