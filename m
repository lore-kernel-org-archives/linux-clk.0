Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Shawn Lin <shawn.lin@rock-chips.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1520987311-114705-1-git-send-email-shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Shawn Lin <shawn.lin@rock-chips.com>
References: <1520987311-114705-1-git-send-email-shawn.lin@rock-chips.com>
Message-ID: <152149340796.242365.15153468447096242685@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3] clk: Don't show the incorrect clock phase
Date: Mon, 19 Mar 2018 14:03:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Shawn Lin (2018-03-13 17:28:31)
> It's found that the clock phase output from clk_summary is
> wrong compared to the actual phase reading from the register.
> =

> cat /sys/kernel/debug/clk/clk_summary | grep sdio_sample
> sdio_sample     0        1        0 50000000          0 -22
> =

> It exposes an issue that clk core, clk_core_get_phase, always
> returns the cached core->phase which should be either updated
> by calling clk_set_phase or directly from the first place the
> clk was registered.
> =

> When registering the clk, the core->phase geting from ->get_phase()
> may return negative value indicating error. This is quite common
> since the clk's phase may be highly related to its parent chain,
> but it was temporarily orphan when registered, since its parent
> chains hadn't be ready at that time, so the clk drivers decide to
> return error in this case. However, if no clk_set_phase is called or
> maybe the ->set_phase() isn't even implemented, the core->phase would
> never be updated. This is wrong, and we should try to update it when
> all its parent chains are settled down, like the way of updating clock
> rate for that. But it's not deserved to complicate the code now and
> just update it anyway when calling clk_core_get_phase, which would be
> much simple and enough.
> =

> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next
