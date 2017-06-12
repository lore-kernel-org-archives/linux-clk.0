Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 1/4] clk: bcm2835: More flexible IO register remapping
To: Phil Elwell <phil@raspberrypi.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <28279803-78d2-4231-939b-89a8c895aba9@raspberrypi.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0643c2ba-9cd3-b985-99d4-af02715aab85@gmail.com>
Date: Mon, 12 Jun 2017 11:19:38 -0700
MIME-Version: 1.0
In-Reply-To: <28279803-78d2-4231-939b-89a8c895aba9@raspberrypi.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 06/12/2017 07:25 AM, Phil Elwell wrote:
> The BCM2835 AUX block contains two registers - AUXIRQ and AUXENB.
> The addition of an irqchip driver using AUXIRQ is hampered by
> the current DT node reserving both registers with a compatible string
> claimed by this bcm2835-aux-clk driver.
> 
> Ease the transition to separate DT nodes by detecting and handling
> the case where this driver's MEM resource has been reduced to include
> only the AUXENB register. Otherwise, use devm_ioremap to remap the
> region without reserving it.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---
>  drivers/clk/bcm/clk-bcm2835-aux.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
> index bd750cf..70d389e 100644
> --- a/drivers/clk/bcm/clk-bcm2835-aux.c
> +++ b/drivers/clk/bcm/clk-bcm2835-aux.c
> @@ -37,9 +37,22 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
>  	parent = __clk_get_name(parent_clk);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(reg))
> -		return PTR_ERR(reg);
> +	/*
> +	 * If the MEM resource is only 4 bytes long it covers just the
> +	 * AUXENB register, otherwise it is the entire AUX block.
> +	 */

Would be worth commenting why devm_ioremap_resource() is used here (to
avoid the implicit request mem_region) and not in the other case. Might
also be worth adding a comment that explains that this is temporary and
this kludge should be removed in the future in favor of the new bindings
only.

Thanks!
-- 
Florian
