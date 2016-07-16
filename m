Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Sat, 16 Jul 2016 15:26:32 -0500
From: Rob Herring <robh@kernel.org>
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
	Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH v3 1/7] bindings: spi-samsung: add exynos5433 spi
 compatible
Message-ID: <20160716202632.GA12145@rob-hp-laptop>
References: <1468317736-18841-1-git-send-email-andi.shyti@samsung.com>
 <1468317736-18841-2-git-send-email-andi.shyti@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1468317736-18841-2-git-send-email-andi.shyti@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 12, 2016 at 07:02:10PM +0900, Andi Shyti wrote:
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
> Reviewed-by: Michael Turquette <mturquette@baylibre.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-samsung.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
