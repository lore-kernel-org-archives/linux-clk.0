Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 30/41] ARM: davinci: switch to common clock framework
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz
 Golaszewski <bgolaszewski@baylibre.com>,
        Adam Ford <aford173@gmail.com>, <linux-kernel@vger.kernel.org>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-31-git-send-email-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <4268330e-25a7-e11d-7863-6a6004419b07@ti.com>
Date: Wed, 7 Feb 2018 18:50:59 +0530
MIME-Version: 1.0
In-Reply-To: <1516468460-4908-31-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Saturday 20 January 2018 10:44 PM, David Lechner wrote:
> This switches ARCH_DAVINCI to use the common clock framework. The legacy
> clock code in arch/arm/mach-davinci/ is no longer used. New drivers in
> drivers/clk/davinci/ are used instead.
> 
> A few macros had to be moved to prevent compile errors.

s/compile/compilation

> Signed-off-by: David Lechner <david@lechnology.com>

> --- a/arch/arm/mach-davinci/davinci.h
> +++ b/arch/arm/mach-davinci/davinci.h
> @@ -35,6 +35,10 @@
>  #include <media/davinci/vpbe.h>
>  #include <media/davinci/vpbe_osd.h>
>  
> +#define DAVINCI_PLL1_BASE		0x01c40800
> +#define DAVINCI_PLL2_BASE		0x01c40c00
> +#define	DAVINCI_PWR_SLEEP_CNTRL_BASE	0x01c41000

Please drop the tab after #define

With that.

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
