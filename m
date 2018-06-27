Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v2 06/13] ARM: davinci: omapl138-hawk: add aemif & nand
 support
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        David Lechner <david@lechnology.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180626092537.6737-1-brgl@bgdev.pl>
 <20180626092537.6737-7-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <11b55553-435b-c363-9194-aebf47302198@ti.com>
Date: Wed, 27 Jun 2018 15:41:24 +0530
MIME-Version: 1.0
In-Reply-To: <20180626092537.6737-7-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Tuesday 26 June 2018 02:55 PM, Bartosz Golaszewski wrote:
>  arch/arm/mach-davinci/board-omapl138-hawk.c | 132 ++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/arch/arm/mach-davinci/board-omapl138-hawk.c b/arch/arm/mach-davinci/board-omapl138-hawk.c
> index 466e87b24e9a..8d8e3165a45c 100644
> --- a/arch/arm/mach-davinci/board-omapl138-hawk.c
> +++ b/arch/arm/mach-davinci/board-omapl138-hawk.c
> @@ -16,6 +16,11 @@
>  #include <linux/gpio.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/platform_data/gpio-davinci.h>
> +#include <linux/platform_data/ti-aemif.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/partitions.h>

can you keep this (roughly) sorted by moving these above?

> +#include <linux/platform_data/mtd-davinci.h>
> +#include <linux/platform_data/mtd-davinci-aemif.h>
>  #include <linux/regulator/machine.h>
>  
>  #include <asm/mach-types.h>
> @@ -166,6 +171,129 @@ static __init void omapl138_hawk_mmc_init(void)
>  	gpiod_remove_lookup_table(&mmc_gpios_table);
>  }
>  

> +static struct platform_device omapl138_hawk_aemif_devices[] = {
> +	{
> +		.name		= "davinci_nand",
> +		.id		= 1,

This can be -1 now since you got "mtd: rawnand: davinci: stop using
pdev->id as chipselect" merged.

We cannot change for older platforms, but this is fresh support.

> +		.dev		= {
> +			.platform_data	= &omapl138_hawk_nandflash_data,
> +		},
> +		.resource	= omapl138_hawk_nandflash_resource,
> +		.num_resources	= ARRAY_SIZE(omapl138_hawk_nandflash_resource),
> +	}
> +};

Thanks,
Sekhar
