Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 13:47:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	Alex Elder <elder@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matt Porter <mporter@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Vaishali Thakkar <vaishali.thakkar@oracle.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH] clk-kona-setup: Use kmalloc_array() in parent_process()
Message-ID: <20160914204757.GX7243@codeaurora.org>
References: <1fb2e894-93d3-3dbe-ca05-7e29e4c60e2a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1fb2e894-93d3-3dbe-ca05-7e29e4c60e2a@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/14, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Sep 2016 20:26:05 +0200
> 
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kmalloc_array".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
