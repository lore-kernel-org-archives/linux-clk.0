Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH v2 16/22] ARM: dts: exynos: Move Exynos5250 and Exynos5420
 nodes under soc
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-17-git-send-email-krzk@kernel.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <4d0516dc-bed4-8017-374b-bd197a64026f@osg.samsung.com>
Date: Mon, 9 May 2016 17:35:03 -0400
MIME-Version: 1.0
In-Reply-To: <1462734367-5619-17-git-send-email-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Krzysztof,

On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
> The conventions it to put SoC devices under 'soc' node. In fact other

s/it/is

> our DTSes (like exynos3250.dtsi or exynos5410.dtsi) already follows it.
> Adjust exynos5250 and exynos5420 DTSI to follow this convention. This is
> also necessary for the upcoming change in exynos5410.dtsi to inherit
> from common exynos5.dtsi.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
