Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 15:40:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	broonie@kernel.org, yibin.gong@nxp.com, rjw@rjwysocki.net,
	viresh.kumar@linaro.org, mturquette@baylibre.com,
	shawnguo@kernel.org, fabio.estevam@nxp.com, anson.huang@nxp.com,
	ping.bai@nxp.com, leonard.crestez@nxp.com, octavian.purdila@nxp.com,
	linux@armlinux.org.uk, geert@linux-m68k.org, f.fainelli@gmail.com,
	dongas86@gmail.com
Subject: Re: [PATCH V3 0/3] clk: introduce clk_bulk_get accessories
Message-ID: <20170602224034.GX20170@codeaurora.org>
References: <1495201746-31841-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1495201746-31841-1-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/19, Dong Aisheng wrote:
> These helper function allows drivers to get several clk consumers in
> one operation.  If any of the clk cannot be acquired then any clks
> that were got will be put before returning to the caller.
> 

I've merged the first two into a stable branch and merged to
clk-next. The third one can go via cpufreq.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
