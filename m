Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:57:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] clk-mux: Improve a size determination in
 clk_hw_register_mux_table()
Message-ID: <20171114015727.GD11955@codeaurora.org>
References: <0d223969-36c3-6f78-97cb-46c074207d2f@users.sourceforge.net>
 <7d70d3de-ba3b-3619-05a8-9a4abe0dacfe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <7d70d3de-ba3b-3619-05a8-9a4abe0dacfe@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 17:30:06 +0200
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
