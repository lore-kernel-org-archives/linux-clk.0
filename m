Return-Path: <shawnguo@kernel.org>
Date: Tue, 22 Sep 2015 17:58:18 -0700
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: imx35: Do not call mxc_timer_init twice when
 booting with DT
Message-ID: <20150923005817.GE3529@tiger>
References: <1441791315-25390-1-git-send-email-alexander.stein@systec-electronic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1441791315-25390-1-git-send-email-alexander.stein@systec-electronic.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 09, 2015 at 11:35:14AM +0200, Alexander Stein wrote:
> mxc_timer_init must not be called from within mx35_clocks_init_dt. It will
> eventually be called by imx31_timer_init_dt
> (drivers/clocksource/timer-imx-gpt.c).
> This arranges the initialization code similar to clk-imx27.c
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> Change in v2:
> * Fix typo

Applied this one, thanks.
