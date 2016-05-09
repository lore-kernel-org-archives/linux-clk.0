Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH v2 08/22] clk: samsung: exynos5410: Add serial3, USB and
 PWM clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-9-git-send-email-krzk@kernel.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <7a1772c3-d81a-3133-d775-0e8034fcee9d@osg.samsung.com>
Date: Mon, 9 May 2016 16:50:58 -0400
MIME-Version: 1.0
In-Reply-To: <1462734367-5619-9-git-send-email-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Krzysztof,

On 05/08/2016 03:05 PM, Krzysztof Kozlowski wrote:
> Just like other Exynos5 family SoCs, this one has four UARTs. Add
> missing UART3 clocks to the Exynso5410 clock driver.
> 
> Add clocks for USB and PWM.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

I don't have an Exynos5410 SoC user manual to double check all values
but assuming that are correct, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
