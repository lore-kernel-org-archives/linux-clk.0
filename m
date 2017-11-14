Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:59:48 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] clk/versatile: Delete two error messages for a
 failed memory allocation in icst_clk_setup()
Message-ID: <20171114015948.GT11955@codeaurora.org>
References: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
 <fe677e31-35b3-fc18-e63a-0f3d24c9f926@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <fe677e31-35b3-fc18-e63a-0f3d24c9f926@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/27, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 21:21:23 +0200
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
