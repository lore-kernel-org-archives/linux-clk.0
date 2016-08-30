Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/5] clk: samsung: Use common registration function for
 pll2550x
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-4-git-send-email-s.nawrocki@samsung.com>
Cc: tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com,
 kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <3b04357c-2978-9200-b289-c3c2d80da5d1@samsung.com>
Date: Tue, 30 Aug 2016 12:13:20 +0200
MIME-version: 1.0
In-reply-to: <1471883463-1950-4-git-send-email-s.nawrocki@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/22/2016 06:31 PM, Sylwester Nawrocki wrote:
> There is no such significant differences in pll2550x PLL type
> to justify a separate registration function.  This patch adapts
> exynos5440 driver to use the common function and removes
> samsung_clk_register_pll2550x().
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> This patch is untested as I don't have access to any exynos5440
> SoC based board.
> ---
>  drivers/clk/samsung/clk-exynos5440.c   |  9 ++++--
>  drivers/clk/samsung/clk-pll.c          | 52 ++++------------------------------
>  drivers/clk/samsung/clk-pll.h          |  1 +
>  include/dt-bindings/clock/exynos5440.h |  2 ++
>  4 files changed, 15 insertions(+), 49 deletions(-)
> 

Looks correct although testing would be nice.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
