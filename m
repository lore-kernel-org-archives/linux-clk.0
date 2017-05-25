Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Anup Patel <anup.patel@broadcom.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1495454307-23464-4-git-send-email-anup.patel@broadcom.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will.deacon@arm.com>, "Ray Jui" <rjui@broadcom.com>,
 "Scott Branden" <sbranden@broadcom.com>, "Jon Mason" <jonmason@broadcom.com>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 "Oza Pawandeep" <oza.oza@broadcom.com>,
 "Srinath Mannam" <srinath.mannam@broadcom.com>,
 "Pramod Kumar" <pramod.kumar@broadcom.com>,
 "Sandeep Tripathy" <sandeep.tripathy@broadcom.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
References: <1495454307-23464-1-git-send-email-anup.patel@broadcom.com>
 <1495454307-23464-4-git-send-email-anup.patel@broadcom.com>
Message-ID: <149574798866.52617.17864487502272102012@resonance>
Subject: Re: [PATCH v4 03/11] clk: bcm: Add clocks for Stingray SOC
Date: Thu, 25 May 2017 14:33:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Hello Anup,

Quoting Anup Patel (2017-05-22 04:58:19)
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>

Are all of those headers really needed?

> +CLK_OF_DECLARE(sr_genpll3_clk, "brcm,sr-genpll3",
> +                       sr_genpll3_clk_init);

Why use CLK_OF_DECLARE here? You've got a proper platform driver here.

Regards,
Mike
