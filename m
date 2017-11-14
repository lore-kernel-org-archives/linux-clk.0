Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:59:05 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Chao Xie <chao.xie@marvell.com>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/3] clk/mmp: Use common error handling code in
 mmp_clk_register_mix()
Message-ID: <20171114015905.GM11955@codeaurora.org>
References: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
 <4dbb54c0-e2f9-b021-fe0a-35b39bff8865@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4dbb54c0-e2f9-b021-fe0a-35b39bff8865@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/27, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 22:33:18 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
