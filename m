Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 11:31:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: hi3620: Use kcalloc() in hi3620_mmc_clk_init()
Message-ID: <20170419183139.GT7065@codeaurora.org>
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
 <9c35e91c-36c6-f33e-a283-4304ad118a22@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9c35e91c-36c6-f33e-a283-4304ad118a22@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/18, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 18 Apr 2017 10:30:04 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "kcalloc".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data type by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
