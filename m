Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 15:11:04 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <ray.jui@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Subject: Re: [PATCH] clk: bcm: Make COMMON_CLK_IPROC into a library
Message-ID: <20161208231104.GW5423@codeaurora.org>
References: <20161123224159.9988-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161123224159.9988-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/23, Stephen Boyd wrote:
> The broadcom clk driver Kconfig file selects and depends on the
> COMMON_CLK_IPROC config for different SoC specific drivers. Let's
> simplify this by always selecting the COMMON_CLK_IPROC config,
> turning it into a set of library code. We still want to retain
> the SoC specific options, so we leave those in place. Since we're
> here we also drop COMMON_CLK dependency because that's implicitly
> handled by including this file in drivers/clk/Kconfig in the
> right place and also make CLK_BCM_KONA default to y on the
> architecture it exists for instead of plain default y.
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <ray.jui@broadcom.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
