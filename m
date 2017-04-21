Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH v3] clk/axs10x: introduce AXS10X pll driver
To: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>,
	<linux-clk@vger.kernel.org>
References: <1492775151-20059-1-git-send-email-vzakhar@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <55592751-9de4-af5a-792c-2209be535f44@synopsys.com>
Date: Fri, 21 Apr 2017 13:25:25 +0100
MIME-Version: 1.0
In-Reply-To: <1492775151-20059-1-git-send-email-vzakhar@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Vlad,


On 21-04-2017 12:45, Vlad Zakharov wrote:
> AXS10X boards manages it's clocks using various PLLs. These PLL has same
> dividers and corresponding control registers mapped to different addresses.
> So we add one common driver for such PLLs.
>
> Each PLL on AXS10X board consist of three dividers: IDIV, FBDIV and
> ODIV. Output clock value is managed using these dividers.
>
> We add pre-defined tables with supported rate values and appropriate
> configurations of IDIV, FBDIV and ODIV for each value.
>
> As of today we add support for PLLs that generate clock for the
> following devices:
>  * ARC core on AXC CPU tiles.
>  * ARC PGU on ARC SDP Mainboard.
> and more to come later.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
> Changes v2..v3
>   - replaced complex data structures with simple cfg tables
>   - replaced non-hw based provider and clk registration functions with hw-based
>   - fixed typos and minor code styling issues
>
>  .../devicetree/bindings/clock/snps,pll-clock.txt   |  28 ++
>  MAINTAINERS                                        |   6 +
>  drivers/clk/axs10x/Makefile                        |   1 +
>  drivers/clk/axs10x/pll_clock.c                     | 334 +++++++++++++++++++++
>  4 files changed, 369 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/snps,pll-clock.txt
>  create mode 100644 drivers/clk/axs10x/pll_clock.c
>

[snip]

>  
> +SYNOPSYS ARC SDP clock driver
> +M:	Vlad Zakharov <vzakhar@synopsys.com>
> +S:	Supported
> +F:	drivers/clk/axs10x/*

Acked-by: Jose Abreu <joabreu@synopsys.com>

Best regards,
Jose Miguel Abreu

> +F:	Documentation/devicetree/bindings/clock/snps,pll-clock.txt
> +
>  SYSTEM CONFIGURATION (SYSCON)
>  M:	Lee Jones <lee.jones@linaro.org>
>  M:	Arnd Bergmann <arnd@arndb.de>
>
