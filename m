Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 18:16:56 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/8] clk: fixed-rate: Convert into a module platform
 driver
Message-ID: <20160813011656.GQ361@codeaurora.org>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
 <1467735814-23518-11-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1467735814-23518-11-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/05, Ricardo Ribalda Delgado wrote:
> Adds support for fixed-rate clock providers which have not been
> enabled via of_clk_init().
> 
> This is required by Device trees overlays that introduce clocks
> providers.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
