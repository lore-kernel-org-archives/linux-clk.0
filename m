Return-Path: <afaerber@suse.de>
Subject: Re: [PATCH v6 1/5] clk: actions: Add missing REGMAP_MMIO dependency
To: Saravanan Sekar <sravanhome@gmail.com>, manivannan.sadhasivam@linaro.org,
 sboyd@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com,
 support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com,
 will.deacon@arm.com, linux-kernel@vger.kernel.org,
 thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org,
 jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
References: <20180715203524.11948-1-sravanhome@gmail.com>
 <20180715203524.11948-2-sravanhome@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Message-ID: <9b580b0c-3cbe-a608-fb21-e8950e259c2f@suse.de>
Date: Sun, 15 Jul 2018 23:39:41 +0200
MIME-Version: 1.0
In-Reply-To: <20180715203524.11948-2-sravanhome@gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Am 15.07.2018 um 22:35 schrieb Saravanan Sekar:
> Add REGMAP_MMIO as dependency to avoid undefined
> reference to regmap symbols.
> 
> Fixes: d85d20053e19 ("clk: actions: Add S900 SoC clock support")
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>

Reviewed-by: Andreas Färber <afaerber@suse.de>

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
