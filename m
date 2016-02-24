Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Feb 2016 15:03:00 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: shmobile: check for failure
Message-ID: <20160224230300.GH4847@codeaurora.org>
References: <1456219803-24824-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456219803-24824-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/23, Sudip Mukherjee wrote:
> We were not checking the return from devm_add_action() which can fail.
> Start using the helper devm_add_action_or_reset() and return directly
> as we know that the cleanup has been done by this helper.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> ---

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
