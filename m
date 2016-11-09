Return-Path: <sboyd@codeaurora.org>
Date: Wed, 9 Nov 2016 12:04:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: pxa: fix pxa2xx_determine_rate return
Message-ID: <20161109200444.GR16026@codeaurora.org>
References: <20161108144950.3472058-1-arnd@arndb.de>
 <20161108144950.3472058-2-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161108144950.3472058-2-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 11/08, Arnd Bergmann wrote:
> The new pxa2xx_determine_rate() function seems lacking in a few
> regards:
> 
> - For an exact match or no match at all, the rate is uninitialized
>   as reported by gcc -Wmaybe-unintialized:
>    drivers/clk/pxa/clk-pxa.c: In function 'pxa2xx_determine_rate':
>    drivers/clk/pxa/clk-pxa.c:243:5: error: 'rate' may be used uninitialized in this function
> 
> - If we get a non-exact match, the req->rate output is never set
>   to the actual rate but remains at the requested rate.
> 
> - We should not attempt to print a rate if none could be found
> 
> This rewrites the logic accordingly.
> 
> Fixes: 9fe694295098 ("clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
