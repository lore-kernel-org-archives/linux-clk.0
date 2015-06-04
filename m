Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Jun 2015 14:27:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] clk: make several parent names const
Message-ID: <20150604212725.GR676@codeaurora.org>
References: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 05/28, Uwe Kleine-König wrote:
> Since commit 2893c379461a ("clk: make strings in parent name arrays
> const") the name of parent clocks can be const. So add more const in
> several clock drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
