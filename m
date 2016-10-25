Return-Path: <k.kozlowski.k@gmail.com>
Return-Path: <k.kozlowski.k@gmail.com>
Date: Tue, 25 Oct 2016 19:07:24 +0300
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] clk/samsung: Clear OF_POPULATED flag from clkout node in
 init callback
Message-ID: <20161025160724.GA3535@kozik-lap>
References: <CGME20161025123519eucas1p1f8d2efba82ebd101e8fa0697a5708a28@eucas1p1.samsung.com>
 <1477398861-2270-1-git-send-email-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1477398861-2270-1-git-send-email-m.szyprowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 25, 2016 at 02:34:21PM +0200, Marek Szyprowski wrote:
> The Exynos PMU node is an interrupt, clock and PMU (Power Management Unit)
> controller, and these functionalities are supported by different drivers
> that matches the same compatible strings.
> 
> Since commit 989eafd0b609 ("clk: core: Avoid double initialization of
> clocks") the OF core flags clock controllers registered with the
> CLK_OF_DECLARE() macro as OF_POPULATED, so platform devices with the same
> compatible string as the interrupt controller will not be registered.
> 
> This prevents the PMU platform device to be registered so the Exynos PMU
> driver is never probed. This breaks (among other things) Suspend-to-RAM.
> 
> Fix this by clearing the OF_POPULATED flag in the clkout driver init
> callback, to allow the Exynos PMU platform driver to be probed. The patch
> is based on similar patch from Javier Martinez Canillas: b030485220ca
> "ARM: EXYNOS: Clear OF_POPULATED flag from PMU node in IRQ init callback".
> 
> Fixes: 989eafd0b609 ("clk: core: Avoid double initialization of clocks")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Yes, one could expect this sooner or later...
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
