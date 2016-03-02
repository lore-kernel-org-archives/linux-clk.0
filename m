Return-Path: <viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Date: Wed, 2 Mar 2016 08:24:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 15/41] clk: spear: Remove CLK_IS_ROOT
Message-ID: <20160302025424.GN16437@vireshk-i7>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-16-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-16-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 01-03-16, 11:00, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/spear/spear1310_clock.c | 21 ++++++++-------------
>  drivers/clk/spear/spear1340_clock.c | 16 ++++++----------
>  drivers/clk/spear/spear3xx_clock.c  |  8 +++-----
>  drivers/clk/spear/spear6xx_clock.c  |  6 ++----
>  4 files changed, 19 insertions(+), 32 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
