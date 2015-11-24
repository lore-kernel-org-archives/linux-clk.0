Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, lee.jones@linaro.org, maxime.ripard@free-electrons.com, s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and implement hand-off
Date: Tue, 24 Nov 2015 10:48:01 +0100
Message-ID: <2729647.3T7P7ViWpB@diego>
In-Reply-To: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

Am Freitag, 7. August 2015, 12:09:27 schrieb Michael Turquette:
> This is an alternative solution to Lee's "clk: Provide support for
> always-on clocks" series[0].
> 
> The first two patches introduce run-time checks to ensure that clock
> consumer drivers are respecting the clk.h api. The former patch checks
> for prepare and enable imbalances. The latter checks for calls to
> clk_put without first disabling and unpreparing the clk.
> 
> The third patch introduces a new flag, CLK_ENABLE_HAND_OFF, which
> prepares and enables a clk at registration-time. The reference counts
> (prepare & enable) are transferred to the first clock consumer driver
> that clk_get's the clk with this flag set AND calls clk_prepare or
> clk_enable.
> 
> The net result is that a clock with this flag set will be enabled at
> boot and neither the clk_disable_unused garbage collector or the
> "sibling clock disables a shared parent" scenario will cause the flagged
> clock to be disabled. The first driver to come along and explicitly
> claim, prepare and enable this clock will inherit those reference
> counts. No change to clock consumer drivers is required for this to
> work. Please continue to use the clk.h api properly.

just out of curiosity, did this move anywhere yet? (Last message from october 
1st it seems)

It looks like it is needed to fix the orphan-deferral I need on Rockchip that 
breaks sunxi in its current state.


Thanks
Heiko
