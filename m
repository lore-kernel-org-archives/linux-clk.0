Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Sep 2016 16:13:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/4] clk/Renesas-MSTP: Use kmalloc_array() in
 cpg_mstp_clocks_init()
Message-ID: <20160916231313.GY7243@codeaurora.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <2f96a36e-fae9-5992-7259-67c92692bbc3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2f96a36e-fae9-5992-7259-67c92692bbc3@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/14, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Sep 2016 21:10:47 +0200
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
