Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:46:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 4/8] clk: Replace four seq_printf() calls by seq_putc()
Message-ID: <20170422024617.GM7065@codeaurora.org>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
 <3f7979fe-3dc0-e6d1-b13b-ea3d990ecf91@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3f7979fe-3dc0-e6d1-b13b-ea3d990ecf91@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/20, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Apr 2017 08:45:43 +0200
> 
> Four single characters should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
