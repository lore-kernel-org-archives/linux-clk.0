Return-Path: <s.nawrocki@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Message-id: <5566DA1B.8090205@samsung.com>
Date: Thu, 28 May 2015 11:04:27 +0200
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Tomasz Figa <tomasz.figa@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 kernel@pengutronix.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] clk: make several parent names const
References: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-reply-to: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 28/05/15 10:45, Uwe Kleine-König wrote:
> Since commit 2893c379461a ("clk: make strings in parent name arrays
> const") the name of parent clocks can be const. So add more const in
> several clock drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks for the patch,
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
