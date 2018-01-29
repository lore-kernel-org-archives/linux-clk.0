Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 29 Jan 2018 11:31:15 -0600
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 4/4] clk: imx: add clock driver for i.MX8MQ CCM
Message-ID: <20180129173115.hy6dmnj2m2mdyznp@rob-hp-laptop>
References: <20180117182950.26460-1-l.stach@pengutronix.de>
 <20180117182950.26460-4-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180117182950.26460-4-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 17, 2018 at 07:29:50PM +0100, Lucas Stach wrote:
> Add driver for the Clock Control Module found on i.MX8MQ.
> 
> This is largely based on the downstream driver from Anson Huang and
> Bai Ping at NXP, with only some small adaptions to mainline from me.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/clk/imx/Makefile                 |   1 +
>  drivers/clk/imx/clk-imx8mq.c             | 861 +++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk.h                    |  43 ++
>  include/dt-bindings/clock/imx8mq-clock.h | 632 +++++++++++++++++++++++
>  4 files changed, 1537 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-imx8mq.c
>  create mode 100644 include/dt-bindings/clock/imx8mq-clock.h

> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> new file mode 100644
> index 000000000000..9932b52452cb
> --- /dev/null
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -0,0 +1,632 @@
> +/*
> + * Copyright 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Use SPDX tag.
