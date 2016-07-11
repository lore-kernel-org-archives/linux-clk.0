Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/7] bindings: spi-samsung: add exynos5433 spi compatible
To: Andi Shyti <andi.shyti@samsung.com>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <1467989201-14661-1-git-send-email-andi.shyti@samsung.com>
 <1467989201-14661-2-git-send-email-andi.shyti@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, Andi Shyti <andi@etezian.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <578379BA.3090501@samsung.com>
Date: Mon, 11 Jul 2016 12:49:30 +0200
MIME-version: 1.0
In-reply-to: <1467989201-14661-2-git-send-email-andi.shyti@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 07/08/2016 04:46 PM, Andi Shyti wrote:
> The samsung,exynos5433-spi has some peculiarities that bring the
> need of creating a new compatible in the binding.
> 
> One of those is the 3-clocks controller management where the spi
> is fed with three clocks: "spi", "busclkN" and "ioclk".
> 
> By adding the exynos5433-spi, we deprecate the exynos7 compatible
> and discourage its use.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
