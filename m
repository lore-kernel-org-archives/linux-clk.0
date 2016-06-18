Return-Path: <tomasz.figa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1462968736-7568-1-git-send-email-k.kozlowski@samsung.com>
References: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com> <1462968736-7568-1-git-send-email-k.kozlowski@samsung.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Sat, 18 Jun 2016 23:35:55 +0900
Message-ID: <CA+Ln22HyYd=SqBk_U1_zdiFmFc4tftEKYiibxnrtVA2cQZUX3g@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos3250: Move PLL rates data to init section
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

2016-05-11 21:12 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> The arrays with initialization data of PLLs can be moved to initconst
> section because they are referenced only from other initconst-level
> symbols.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos3250.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
