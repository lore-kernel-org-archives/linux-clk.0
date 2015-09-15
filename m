Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 02/12] clk: samsung: exynos7: Adds missing clocks gates
 of CMU_TOPC
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
 <1441874677-24148-3-git-send-email-alim.akhtar@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
 mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com,
 sboyd@codeaurora.org, linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <55F7B5CD.90600@samsung.com>
Date: Tue, 15 Sep 2015 15:08:13 +0900
MIME-version: 1.0
In-reply-to: <1441874677-24148-3-git-send-email-alim.akhtar@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 10.09.2015 17:44, Alim Akhtar wrote:
> This adds some of the missing GATE clocks of CMU_TOPC block.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c       |   27 +++++++++++++++++++++++++++
>  include/dt-bindings/clock/exynos7-clk.h |   13 ++++++++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
