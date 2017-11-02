Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 23:38:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Tirupathi Reddy <tirupath@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: common: Migrate to devm_* APIs for resets
 and clk providers
Message-ID: <20171102063828.GB30645@codeaurora.org>
References: <20170901231641.19141-1-sboyd@codeaurora.org>
 <20170901231641.19141-3-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170901231641.19141-3-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/01, Stephen Boyd wrote:
> Now that we have devm APIs for the reset controller and of clk hw
> provider APIs we can remove the custom code here.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
