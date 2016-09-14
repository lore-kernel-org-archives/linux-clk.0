Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 11:17:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Alexander =?iso-8859-1?Q?M=FCller?= <serveralex@gmail.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: fix CLKID_GCLK_VENCI_INT typo
Message-ID: <20160914181717.GQ7243@codeaurora.org>
References: <20160906130130.1645496-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160906130130.1645496-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/06, Arnd Bergmann wrote:
> The addition of many gate clocks added two entries in an array for
> the same value:
> 
> drivers/clk/meson/meson8b.c:479:10: error: initialized field overwritten [-Werror=override-init]
>    [CLKID_GCLK_VENCI_INT]     = &meson8b_gclk_venci_int.hw,
>    [CLKID_GCLK_VENCI_INT]     = &meson8b_gclk_vencp_int.hw,
> 
> This was clearly an accident, and since all other identifiers are
> listed in the order in which they are defined, I'm changing the
> first one to CLKID_GCLK_VENCI_INT0, making it all consistent again.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: e31a1900c1ff ("meson: clk: Add support for clock gates")
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
