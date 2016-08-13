Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 18:16:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/8] clk: core: New macro CLK_OF_DECLARE_DRIVER
Message-ID: <20160813011632.GH361@codeaurora.org>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
 <1467735814-23518-2-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1467735814-23518-2-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/05, Ricardo Ribalda Delgado wrote:
> This will be used by drivers that requires initialization at
> of_clk_init() time and also during platform device probing.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
