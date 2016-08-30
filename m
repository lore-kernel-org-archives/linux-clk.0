Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/5] clk: samsung: exynos5410: Expose the peripheral DMA
 gate clocks
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-3-git-send-email-s.nawrocki@samsung.com>
Cc: tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com,
 kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <bf796084-3187-7095-8a9c-022153198f9c@samsung.com>
Date: Tue, 30 Aug 2016 11:56:07 +0200
MIME-version: 1.0
In-reply-to: <1471883463-1950-3-git-send-email-s.nawrocki@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/22/2016 06:31 PM, Sylwester Nawrocki wrote:
> These clocks are needed in order to use the PL330 peripheral
> DMA controllers.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5410.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
