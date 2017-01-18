Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 18 Jan 2017 17:14:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Inki Dae <inki.dae@samsung.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/4] drm: exynos: Remove support for Exynos4415 (SoC not
 supported anymore)
Message-ID: <20170118231402.xxje54gag3mb6b3x@rob-hp-laptop>
References: <20170114123642.15581-1-krzk@kernel.org>
 <20170114123642.15581-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170114123642.15581-5-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jan 14, 2017 at 02:36:42PM +0200, Krzysztof Kozlowski wrote:
> Support for Exynos4415 is going away because there are no internal nor
> external users.
> 
> Since commit 46dcf0ff0de3 ("ARM: dts: exynos: Remove exynos4415.dtsi"),
> the platform cannot be instantiated so remove also the drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/display/exynos/exynos_dsim.txt |  1 -
>  .../bindings/display/exynos/samsung-fimd.txt           |  1 -

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/exynos/exynos_drm_dsi.c                | 15 +--------------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c               | 18 ++----------------
>  4 files changed, 3 insertions(+), 32 deletions(-)
