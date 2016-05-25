Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] clk: samsung: exynos5433: add CPU clocks configuration
 data and instantiate CPU clocks
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>
References: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com>
 <1464095957-25851-4-git-send-email-b.zolnierkie@samsung.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <5745719C.4000106@samsung.com>
Date: Wed, 25 May 2016 11:34:20 +0200
MIME-version: 1.0
In-reply-to: <1464095957-25851-4-git-send-email-b.zolnierkie@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/24/2016 03:19 PM, Bartlomiej Zolnierkiewicz wrote:
> Add the CPU clocks configuration data and instantiate the CPU clocks
> type for Exynos5433.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 72 ++++++++++++++++++++++++++++++++----
>  1 file changed, 64 insertions(+), 8 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
