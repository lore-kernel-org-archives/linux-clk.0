Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 2/4] clk: Combine DT binding doc for max77686 and
 max77802
To: Laxman Dewangan <ldewangan@nvidia.com>, javier@osg.samsung.com,
 mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
References: <1466083407-28793-1-git-send-email-ldewangan@nvidia.com>
 <1466083407-28793-3-git-send-email-ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Javier Martinez Canillas <javier@dowhile0.org>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <57639183.2070508@samsung.com>
Date: Fri, 17 Jun 2016 07:58:27 +0200
MIME-version: 1.0
In-reply-to: <1466083407-28793-3-git-send-email-ldewangan@nvidia.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/16/2016 03:23 PM, Laxman Dewangan wrote:
> The clock IP used on the Maxim PMICs max77686 and max77802 are
> same. The configuration of clock register is also same except
> the number of clocks.
> 
> Define the common DT binding file for the clocks of Maxim PMICs
> MAX77686 and MAX77802. For this, remove the separate DT binding
> document file for maxim,max77802 and move all information to
> maxim,max77686 DT binding document.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> 
> ---
> Changes from V1:
> - Rewrite description to remvoe ref to driver.
> - Taken care of comment from Krzysztof on the supported clocks and
>   DT bindings.
> ---
>  .../devicetree/bindings/clock/maxim,max77686.txt   | 82 ++++++++++++++++------
>  .../devicetree/bindings/clock/maxim,max77802.txt   | 44 ------------
>  2 files changed, 59 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/maxim,max77802.txt

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
