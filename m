Return-Path: <niklas.soderlund@ragnatech.se>
Return-Path: <niklas.soderlund@ragnatech.se>
Date: Fri, 28 Apr 2017 14:49:59 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/10] clk: renesas: Add r8a7794 CPG Core Clock
 Definitions
Message-ID: <20170428124959.GJ1532@bigcity.dyn.berto.se>
References: <1493139200-27396-1-git-send-email-geert+renesas@glider.be>
 <1493139200-27396-7-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1493139200-27396-7-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On 2017-04-25 18:53:16 +0200, Geert Uytterhoeven wrote:
> Add all R-Car E2 Clock Pulse Generator Core Clock Outputs, as listed in
> Table 7.2d ("List of Clocks [R-Car E2]") of the R-Car Gen2 Hardware
> User's Manual rev. 2.00.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/dt-bindings/clock/r8a7794-cpg-mssr.h | 47 ++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r8a7794-cpg-mssr.h
> 
> diff --git a/include/dt-bindings/clock/r8a7794-cpg-mssr.h b/include/dt-bindings/clock/r8a7794-cpg-mssr.h
> new file mode 100644
> index 0000000000000000..9d720311ae3a229a
> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a7794-cpg-mssr.h
> @@ -0,0 +1,47 @@
> +/*
> + * Copyright (C) 2015 Renesas Electronics Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_R8A7794_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A7794_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a7794 CPG Core Clocks */
> +#define R8A7794_CLK_Z2			0
> +#define R8A7794_CLK_ZG			1
> +#define R8A7794_CLK_ZTR			2
> +#define R8A7794_CLK_ZTRD2		3
> +#define R8A7794_CLK_ZT			4
> +#define R8A7794_CLK_ZX			5
> +#define R8A7794_CLK_ZS			6
> +#define R8A7794_CLK_HP			7
> +#define R8A7794_CLK_I			8
> +#define R8A7794_CLK_B			9
> +#define R8A7794_CLK_LB			10
> +#define R8A7794_CLK_P			11
> +#define R8A7794_CLK_CL			12
> +#define R8A7794_CLK_CP			13
> +#define R8A7794_CLK_M2			14
> +#define R8A7794_CLK_ADSP		15
> +#define R8A7794_CLK_ZB3			16
> +#define R8A7794_CLK_ZB3D2		17
> +#define R8A7794_CLK_DDR			18
> +#define R8A7794_CLK_SDH			19
> +#define R8A7794_CLK_SD0			20
> +#define R8A7794_CLK_SD2			21
> +#define R8A7794_CLK_SD3			22
> +#define R8A7794_CLK_MMC0		23
> +#define R8A7794_CLK_MP			24
> +#define R8A7794_CLK_QSPI		25
> +#define R8A7794_CLK_CPEX		26
> +#define R8A7794_CLK_RCAN		27
> +#define R8A7794_CLK_R			28
> +#define R8A7794_CLK_OSC			29

The last two are called RCLK and OSCCLK in the Table 7.2d ("List of 
Clocks [R-Car E2]"). I'm  sure this is intentional on your side, and if 
so:

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A7794_CPG_MSSR_H__ */
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
