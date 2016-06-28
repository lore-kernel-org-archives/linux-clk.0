Return-Path: <cwchoi00@gmail.com>
MIME-Version: 1.0
Reply-To: cw00.choi@samsung.com
In-Reply-To: <1467032594-7643-2-git-send-email-andi.shyti@samsung.com>
References: <1467032594-7643-1-git-send-email-andi.shyti@samsung.com> <1467032594-7643-2-git-send-email-andi.shyti@samsung.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 28 Jun 2016 22:12:16 +0900
Message-ID: <CAGTfZH0jv0C0VTjDr8ZWEaokyapTHHsHEUeRUSyeHgdBT_dW3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: exynos5433: enable sclk_ioclk for SPI3
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Andi Shyti <andi@etezian.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Andi,

2016-06-27 22:03 GMT+09:00 Andi Shyti <andi.shyti@samsung.com>:
> enable SPI3 iosclk by using the CLK_IS_CRITICAL flag.

s/iosclk/ioclk

> There is no device which is supposed to enable this clock when
> needed, therefore, the only way to use the SPI bus is to enable
> it in boot time.
>
> Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>
> Hi,
>
> V1 -> V2
>
> - the "sclk_spi3" doesn't need to be enabled in boot time as it
>   is handled by the spi driver itself.
>
> - use the CLK_IS_CRITICAL flag for the ioclk
>
> Andi
>
>  drivers/clk/samsung/clk-exynos5433.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index dcb4391..c33150e 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -1641,7 +1641,8 @@ static struct samsung_gate_clock peric_gate_clks[] __initdata = {
>         GATE(CLK_SCLK_IOCLK_SPI4, "sclk_ioclk_spi4", "ioclk_spi4_clk_in",
>                         ENABLE_SCLK_PERIC, 21, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_SCLK_IOCLK_SPI3, "sclk_ioclk_spi3", "ioclk_spi3_clk_in",
> -                       ENABLE_SCLK_PERIC, 20, CLK_SET_RATE_PARENT, 0),
> +                       ENABLE_SCLK_PERIC, 20,
> +                       CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_SCLK_SPI4, "sclk_spi4", "sclk_spi4_peric", ENABLE_SCLK_PERIC,
>                         19, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_SCLK_SPI3, "sclk_spi3", "sclk_spi3_peric", ENABLE_SCLK_PERIC,

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
