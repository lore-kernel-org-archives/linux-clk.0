Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:57:23 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] clk-mux: Delete an error message for a failed memory
 allocation in clk_hw_register_mux_table()
Message-ID: <20171114015723.GC11955@codeaurora.org>
References: <0d223969-36c3-6f78-97cb-46c074207d2f@users.sourceforge.net>
 <31bc9968-20e9-1fd0-0f16-80cb0f2bffe0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <31bc9968-20e9-1fd0-0f16-80cb0f2bffe0@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 17:23:04 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
