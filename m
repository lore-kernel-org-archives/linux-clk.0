Return-Path: <sboyd@codeaurora.org>
Date: Fri, 10 Nov 2017 18:45:05 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
	Leo Yan <leo.yan@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: hisilicon: Delete an error message for a failed
 memory allocation in hisi_register_clkgate_sep()
Message-ID: <20171111024505.GE22441@codeaurora.org>
References: <920f1461-2c2a-430f-28ef-18af18788889@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <920f1461-2c2a-430f-28ef-18af18788889@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 22:00:05 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
