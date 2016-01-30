Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 17:20:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: st: avoid uninitialized variable use
Message-ID: <20160130012040.GE4848@codeaurora.org>
References: <1453737255-1959849-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1453737255-1959849-1-git-send-email-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 01/25, Arnd Bergmann wrote:
> My previous patch fixed some warnings about printing a couple
> of variables that are always uninitialized in quadfs_pll_fs660c32_set_rate(),
> but I now got a warning that only shows up in some configurations (i.e.
> without gcc -Os) about the params.ndiv being used uninitialized in the
> error case:
> 
> drivers/clk/st/clkgen-fsyn.c: In function 'quadfs_pll_fs660c32_set_rate':
> drivers/clk/st/clkgen-fsyn.c:584:75: warning: 'params.ndiv' may be used uninitialized in this function [-Wmaybe-uninitialized]
> drivers/clk/st/clkgen-fsyn.c:574:16: note: 'params.ndiv' was declared here
> 
> This changes the error handling so we bail for invalid arguments rather
> than continuing with uninitialized data.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
