Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:59:16 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Tero Kristo <t-kristo@ti.com>, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk/ti: Delete an error message for a failed memory
 allocation in two functions
Message-ID: <20171114015916.GO11955@codeaurora.org>
References: <120d01e4-5e58-e740-f6c7-c6835752aed3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <120d01e4-5e58-e740-f6c7-c6835752aed3@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/27, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 19:14:01 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
