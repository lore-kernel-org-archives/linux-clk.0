Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH v2 15/22] ARM: dts: exynos: Use phandle to get parent node
 in exynos5250-snow
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-16-git-send-email-krzk@kernel.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <a978eba1-5dc9-0b20-d131-b180047cc143@osg.samsung.com>
Date: Mon, 9 May 2016 17:29:48 -0400
MIME-Version: 1.0
In-Reply-To: <1462734367-5619-16-git-send-email-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Krzysztof,

On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
> The i2c-arbitrator node in exynos5250-snow-common used absolute path to
> reference other node (the i2c parent). Use phandle instead, because the
> depth of the other node may be changed (like moving it under 'soc'
> node).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
