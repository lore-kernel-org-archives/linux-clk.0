Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 17:04:33 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Fix reset offset for the A23 and A33
Message-ID: <20160921000433.GK8319@codeaurora.org>
References: <20160919200015.23641-1-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160919200015.23641-1-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/19, Maxime Ripard wrote:
> There's been a copy and paste mistake in the A23 and A33 from the H3,
> leading in the reset offset for the UART and I2C.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
