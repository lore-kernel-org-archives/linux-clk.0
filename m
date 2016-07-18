Return-Path: <ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 18 Jul 2016 22:19:20 +0200
Message-ID: <CAPybu_3++N26xYPAW9quVR2MT=R8_b89kEJmgJk9HM+VB9nVYA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] clk: Don't duplicate initialization on platform_dev
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen


It is anything that am I missing? Can I help you somehow?


Regards!

On Tue, Jul 5, 2016 at 6:23 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Clock providers can be probed as a normal platform device, or via
> of_clk_init() before the rest of the platform devices are initialized
> using the CLK_OF_DECLARE() macro.
>
> If a driver required both initialization methodologies, the core would call
> both probe/init functions.
>
> This changeset prevent the dual initialization using the OF_POPULATE flag.
>
> It also creates a new macro, CLK_OF_DECLARE_DRIVER, used by drivers that
> require double initialization.
>
> Finally, it adds module platform driver initialization to fixed-factor
> and fixed-rate, enabling its use in dt overlays.
>
> The order of the patches allows future bisects of the change. This explains
> why  Avoid double initialization of clocks() is done almost at the end.
>
> v5: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
> -Create CLK_OF_DECLARE_DRIVER() macro
> -use it in clk-artpec6, sunxi,nxp
>
> v4: Huge MACRO(), not posted to the list
>
> v3: Use OF_POPULATE flag inside fixed-rate and fixed-factor
>
> v2: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
> -Add error check
> -CodeStyle on of_device_ide
> -Use builtin_platform_driver()
>
> When clock providers are added to the device tree after of_clk_init is called
> they are not added to the clock provider list. This makes that drivers such
> as i2c-xiic.c fail to init, as they may depend on the unadded clock provider.
>
> Ricardo Ribalda Delgado (8):
>   clk: core: New macro CLK_OF_DECLARE_DRIVER
>   clk: axis: Use new macro CLK_OF_DECLARE_DRIVER
>   clk: npx: Use new macro CLK_OF_DECLARE_DRIVER
>   clk: sunxi: mod0: Use new macro CLK_OF_DECLARE_DRIVER
>   clk: sunxi: apb0: Use new macro CLK_OF_DECLARE_DRIVER
>   clk: core: Avoid double initialization of clocks
>   clk: fixed-factor: Convert into a module platform driver
>   clk: fixed-rate: Convert into a module platform driver
>
>  drivers/clk/axis/clk-artpec6.c     |  4 +--
>  drivers/clk/clk-fixed-factor.c     | 72 +++++++++++++++++++++++++++++++++++---
>  drivers/clk/clk-fixed-rate.c       | 69 +++++++++++++++++++++++++++++++++---
>  drivers/clk/clk.c                  |  4 +++
>  drivers/clk/nxp/clk-lpc18xx-creg.c |  3 +-
>  drivers/clk/sunxi/clk-mod0.c       |  3 +-
>  drivers/clk/sunxi/clk-sun8i-apb0.c |  4 +--
>  include/linux/clk-provider.h       | 12 +++++++
>  8 files changed, 156 insertions(+), 15 deletions(-)
>
> --
> 2.8.1
>



-- 
Ricardo Ribalda
