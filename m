Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:48:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 7/8] clk: nomadik: Use seq_puts() in
 nomadik_src_clk_show()
Message-ID: <20170422024831.GP7065@codeaurora.org>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
 <d3be1f2b-f3c4-0d1b-4fa0-84589bfc3f70@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d3be1f2b-f3c4-0d1b-4fa0-84589bfc3f70@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/20, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Apr 2017 09:45:04 +0200
> 
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function "seq_puts".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
