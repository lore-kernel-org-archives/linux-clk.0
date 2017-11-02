Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 22:55:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 009/102] clk: sunxi: explicitly request exclusive reset
 control
Message-ID: <20171102055502.GP30645@codeaurora.org>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
 <20170719152646.25903-10-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20170719152646.25903-10-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 07/19, Philipp Zabel wrote:
> Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
> reset lines") started to transition the reset control request API calls
> to explicitly state whether the driver needs exclusive or shared reset
> control behavior. Convert all drivers requesting exclusive resets to the
> explicit API call so the temporary transition helpers can be removed.
> 
> No functional changes.
> 
> Cc: "Emilio López" <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
