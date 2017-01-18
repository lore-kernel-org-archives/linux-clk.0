Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170114123642.15581-4-krzk@kernel.org>
References: <20170114123642.15581-1-krzk@kernel.org> <20170114123642.15581-4-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jan 2017 11:37:04 +0100
Message-ID: <CACRpkdZh+kPUwf56XskzCUPh89h5a_2_-=EFw=NFKYY_zD4jfw@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: samsung: Remove support for Exynos4415 (SoC
 not supported anymore)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jan 14, 2017 at 1:36 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Support for Exynos4415 is going away because there are no internal nor
> external users.
>
> Since commit 46dcf0ff0de3 ("ARM: dts: exynos: Remove exynos4415.dtsi"),
> the platform cannot be instantiated so remove also the drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

It can certainly be instantiated (from old DTBs...) but has
no DTS upstream. But I get what you mean.

Patch applied, if someone is unhappy they can always start
sending reverts.

Yours,
Linus Walleij
