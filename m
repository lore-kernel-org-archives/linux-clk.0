Return-Path: <sboyd@codeaurora.org>
Date: Tue, 18 Jul 2017 16:24:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Carlo Caione <carlo@caione.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	dvhart@infradead.org, pierre-louis.bossart@linux.intel.com,
	linux@endlessm.com, eballetbo@gmail.com,
	andriy.shevchenko@linux.intel.com,
	Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH v3] clk: x86: Do not gate clocks enabled by the firmware
Message-ID: <20170718232451.GI18179@codeaurora.org>
References: <20170714082356.28117-1-carlo@caione.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170714082356.28117-1-carlo@caione.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/14, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> Read the enable register to determine if the clock is already in use by
> the firmware. In this case avoid gating the clock.
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Darren Hart (VMware) <dvhart@infradead.org>
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---

Applied to clk-fixes and added a Fixes tag.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
