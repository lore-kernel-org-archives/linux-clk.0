Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Jul 2017 19:02:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 08/10] clk: cosmetic changes to clk_summary debugfs
 entry
Message-ID: <20170712020253.GW22780@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-9-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170612194438.12298-9-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/12, Jerome Brunet wrote:
> clk_summary debugfs entry was already well over the traditional 80
> characters per line limit but it grew even larger with the addition of
> clock protection.
> 

Before/after example output perhaps?

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
