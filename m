Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:48:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 8/8] clk: nomadik: Delete error messages for a failed
 memory allocation in two functions
Message-ID: <20170422024818.GO7065@codeaurora.org>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
 <fd5dc7a7-2ab0-b39f-248b-7191984c6666@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <fd5dc7a7-2ab0-b39f-248b-7191984c6666@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/20, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Apr 2017 10:04:00 +0200
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
