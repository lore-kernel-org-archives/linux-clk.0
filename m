Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:44:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/8] clk: si5351: Use devm_kcalloc() in si5351_i2c_probe()
Message-ID: <20170422024444.GK7065@codeaurora.org>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
 <b72a7329-0920-385d-008d-37dfc258f24d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <b72a7329-0920-385d-008d-37dfc258f24d@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/20, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Apr 2017 22:37:30 +0200
> 
> Multiplications for the size determination of memory allocations
> indicated that array data structures should be processed.
> Thus use the corresponding function "devm_kcalloc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
