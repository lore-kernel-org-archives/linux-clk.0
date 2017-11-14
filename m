Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:57:40 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	Alex Elder <elder@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] [media] clk-kona-setup: Delete two error messages for a
 failed memory allocation in parent_process()
Message-ID: <20171114015740.GE11955@codeaurora.org>
References: <022c9ba4-f3c4-e4e3-f804-2bd54937a138@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <022c9ba4-f3c4-e4e3-f804-2bd54937a138@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 16:54:20 +0200
> 
> Omit extra messages for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
