Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:49:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: mvebu: Use kcalloc() in two functions
Message-ID: <20170422024936.GR7065@codeaurora.org>
References: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
 <6d6837ee-ea98-00cc-faea-cfa2a556109b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6d6837ee-ea98-00cc-faea-cfa2a556109b@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/19, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Apr 2017 21:08:54 +0200
> 
> * Multiplications for the size determination of memory allocations
>   indicated that array data structures should be processed.
>   Thus use the corresponding function "kcalloc".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of data types by pointer dereferences
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
