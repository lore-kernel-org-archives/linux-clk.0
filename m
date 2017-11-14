Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:59:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Chao Xie <chao.xie@marvell.com>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/3] clk/mmp: Delete an error message for a failed memory
 allocation in three functions
Message-ID: <20171114015907.GN11955@codeaurora.org>
References: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
 <5a3e0b55-1eda-87a4-c4e3-d142d64830a5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5a3e0b55-1eda-87a4-c4e3-d142d64830a5@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/27, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 22:25:38 +0200
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
