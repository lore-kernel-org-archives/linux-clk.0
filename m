Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 16:29:10 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org
Subject: Re: clk: scpi: Fix checking return value of
 platform_device_register_simple()
Message-ID: <20160130002910.GY12841@codeaurora.org>
References: <1449211896.14226.2.camel@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1449211896.14226.2.camel@ingics.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/04, Axel Lin wrote:
> platform_device_register_simple() returns ERR_PTR on error.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
