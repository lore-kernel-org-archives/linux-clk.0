Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Brian Starkey <brian.starkey@arm.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1510586871-27478-1-git-send-email-brian.starkey@arm.com>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, sudeep.holla@arm.com
References: <1510586871-27478-1-git-send-email-brian.starkey@arm.com>
Message-ID: <152123950398.242365.1602988149994517949@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: versatile: Remove WARNs in ->round_rate()
Date: Fri, 16 Mar 2018 15:31:43 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Brian Starkey (2017-11-13 07:27:51)
> clk_round_rate() is intended to be used to round a given clock rate to
> the closest one achievable by the actual clock. This implies that the
> input to clk_round_rate() is expected to be unachievable - and such
> cases shouldn't be treated as exceptional.
> =

> To reflect this, remove the WARN_ONs which trigger when an unachievable
> clock rate is passed to vexpress_osc_round_rate().
> =

> Reported-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Applied to clk-next
