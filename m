Return-Path: <k.kozlowski.k@gmail.com>
Return-Path: <k.kozlowski.k@gmail.com>
Date: Sat, 22 Apr 2017 17:08:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: exynos-clkout: Convert to the new
 clk_hw API
Message-ID: <20170422150859.plofehrvh3fs4afq@kozik-lap>
References: <1492694199-9553-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170420131647eucas1p27a8e65eb92f64f872bfce611ac031700@eucas1p2.samsung.com>
 <1492694199-9553-4-git-send-email-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1492694199-9553-4-git-send-email-m.szyprowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 20, 2017 at 03:16:38PM +0200, Marek Szyprowski wrote:
> Clock providers should use the new struct clk_hw based API, so convert
> Exynos CLKOUT clock provider to the new approach.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
