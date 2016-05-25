Return-Path: <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/2] ARM: dts: Fix imprecise external abort error when
 accessing Exynos MFC
To: Javier Martinez Canillas <javier@osg.samsung.com>,
 linux-kernel@vger.kernel.org
References: <1464111662-15336-1-git-send-email-javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Shuah Khan <shuahkh@osg.samsung.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-id: <6479e0c0-97fb-ca3b-1337-6ed11410d94f@samsung.com>
Date: Wed, 25 May 2016 08:51:05 +0200
MIME-version: 1.0
In-reply-to: <1464111662-15336-1-git-send-email-javier@osg.samsung.com>
Content-type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello,


On 2016-05-24 19:41, Javier Martinez Canillas wrote:
> This series fixes an imprecise external abort error when accessing the
> Exynos MFC registers due the power domain configuration requiring the
> aclk333 clock to be enabled during a domain switch.
>
> There isn't a dependency between the clock and Linux Samsung SoC trees
> because the CLK_ACLK333 clock ID is already defined so the patches can
> be picked indepedently by the relevant subsystem maintainers.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

I'm really curious what kind of async-bridge is there, but this patch
really fixes the problem with mfc power domain.

> Best regards,
> Javier
>
>
> Javier Martinez Canillas (2):
>    clk: exynos5420: Set ID for aclk333 gate clock
>    ARM: dts: Add async-bridge clock to MFC power domain for Exynos5420
>
>   arch/arm/boot/dts/exynos5420.dtsi    | 5 +++--
>   drivers/clk/samsung/clk-exynos5420.c | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
