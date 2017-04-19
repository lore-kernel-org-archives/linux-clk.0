Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 11:31:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 5/6] clk: hi3620: Delete error messages for a failed
 memory allocation in two functions
Message-ID: <20170419183146.GU7065@codeaurora.org>
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
 <fa6898a1-8068-2b46-24c2-995329831358@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <fa6898a1-8068-2b46-24c2-995329831358@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/18, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 18 Apr 2017 10:50:53 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: Possible unnecessary 'out of memory' message
> 
> Thus remove such statements here.
> 
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
