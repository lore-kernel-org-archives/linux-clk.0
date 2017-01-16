Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/4] clk: samsung: Remove Exynos4415 driver (SoC not
 supported anymore)
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <c9b51cb6-f798-d41e-afff-f779b963345c@samsung.com>
Date: Mon, 16 Jan 2017 11:32:40 +0100
MIME-version: 1.0
In-reply-to: <20170114123642.15581-3-krzk@kernel.org>
Content-type: text/plain; charset=windows-1252
References: <20170114123642.15581-1-krzk@kernel.org>
 <CGME20170114123727epcas2p296aae6459c8575d7e5def74f18e5c64d@epcas2p2.samsung.com>
 <20170114123642.15581-3-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/14/2017 01:36 PM, Krzysztof Kozlowski wrote:
> Support for Exynos4415 is going away because there are no internal nor
> external users.
> 
> Since commit 46dcf0ff0de3 ("ARM: dts: exynos: Remove exynos4415.dtsi"),
> the platform cannot be instantiated so remove also the drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thanks.
