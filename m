Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH V2 3/4] clk: max77686: Add DT binding details for PMIC
 MAX77620
To: Laxman Dewangan <ldewangan@nvidia.com>, k.kozlowski@samsung.com,
 mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
References: <1466083407-28793-1-git-send-email-ldewangan@nvidia.com>
 <1466083407-28793-4-git-send-email-ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Javier Martinez Canillas <javier@dowhile0.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <4973c738-f270-e7d1-9ac1-ab0d6eaece88@osg.samsung.com>
Date: Thu, 16 Jun 2016 10:02:18 -0400
MIME-Version: 1.0
In-Reply-To: <1466083407-28793-4-git-send-email-ldewangan@nvidia.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Laxman,

On 06/16/2016 09:23 AM, Laxman Dewangan wrote:
> Maxim has used the same clock IP on multiple PMICs like MAX77686,
> MAX77802, MAX77620. Only differences are the number of clocks
> from these PMICs like MAX77686 has 3 clocks output, MAX776802 have
> two clock output and MAX77620 has one clock output.
> 
> Add clock binding details and DT example for the MAX77620.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> 
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
