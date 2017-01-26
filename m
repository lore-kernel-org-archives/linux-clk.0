Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 15:44:21 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>, linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: gxbb: fix CLKID_ETH defined twice
Message-ID: <20170126234421.GG8801@codeaurora.org>
References: <1485446749-12679-1-git-send-email-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485446749-12679-1-git-send-email-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/26, Jerome Brunet wrote:
> CLKID_ETH is define in the dt-bindings but has not be commented out in the
> clock driver. Just do it now.
> 
> Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
