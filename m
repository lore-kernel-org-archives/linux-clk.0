Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 23:38:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Tirupathi Reddy <tirupath@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: Add
 devm_of_clk_add_hw_provider()/del_provider() APIs
Message-ID: <20171102063824.GA30645@codeaurora.org>
References: <20170901231641.19141-1-sboyd@codeaurora.org>
 <20170901231641.19141-2-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170901231641.19141-2-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/01, Stephen Boyd wrote:
> Sometimes we only have one of_clk_del_provider() call in driver
> error and remove paths, because we're missing a
> devm_of_clk_add_hw_provider() API. Introduce the API so we can
> convert drivers to use this and potentially reduce the amount of
> code needed to remove providers in drivers.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
