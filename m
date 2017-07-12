Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:04:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	"open list:CLK API" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: Provide bulk prepare_enable disable_unprepare
 variants
Message-ID: <20170712230432.GD22780@codeaurora.org>
References: <20170712220416.31785-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170712220416.31785-1-bjorn.andersson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/12, Bjorn Andersson wrote:
> This extends the existing set of bulk helpers with prepare_enable and
> disable_unprepare variants.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Looks good. I can stick this under a tag in clk tree if you like
so that it can be pulled into various driver trees?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
