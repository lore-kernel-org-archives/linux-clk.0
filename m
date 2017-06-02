Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 15:40:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson-gxbb: Add const to some parent name arrays
Message-ID: <20170602224048.GY20170@codeaurora.org>
References: <20170602175831.29100-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170602175831.29100-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/02, Stephen Boyd wrote:
> These can be marked as const * const.
> 
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
