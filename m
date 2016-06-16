Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/5] clk: max77686: Add support for MAX77620 clocks
To: Laxman Dewangan <ldewangan@nvidia.com>, javier@osg.samsung.com,
 mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com>
 <1466000018-16784-5-git-send-email-ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Javier Martinez Canillas <javier@dowhile0.org>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <5762A36C.3040703@samsung.com>
Date: Thu, 16 Jun 2016 15:02:36 +0200
MIME-version: 1.0
In-reply-to: <1466000018-16784-5-git-send-email-ldewangan@nvidia.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/15/2016 04:13 PM, Laxman Dewangan wrote:
> Maxim Max77620 has one 32KHz clock output and the clock HW
> IP used on this PMIC is same as what it is there in the MAX77686.
> 
> Add clock driver support for MAX77620 on the MAX77686 driver.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> ---
>  drivers/clk/Kconfig        |  7 ++++---
>  drivers/clk/clk-max77686.c | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)

Tested on max77686 and max77802:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
