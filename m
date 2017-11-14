Return-Path: <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 15:56:01 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: pxa: fix building on older compilers
Message-ID: <20171114235601.GH11955@codeaurora.org>
References: <20170915195402.1469159-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170915195402.1469159-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/15, Arnd Bergmann wrote:
> gcc-4.4 got confused by the inline assembler statement:
> 
> drivers/clk/pxa/clk-pxa.c: In function 'pxa2xx_core_turbo_switch':
> drivers/clk/pxa/clk-pxa.c:152: error: expected string literal before ')' token
> 
> This removes the extraneous ':' to let all compilers parse the
> driver correctly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
