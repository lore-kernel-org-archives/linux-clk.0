Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jan 2017 11:49:09 -0600
From: Rob Herring <robh@kernel.org>
To: Bai Ping <ping.bai@nxp.com>
Cc: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	mark.rutland@arm.com, linus.walleij@linaro.org,
	kernel@pengutronix.de, fabio.estevam@nxp.com,
	daniel.lezcano@linaro.org, tglx@linutronix.de,
	p.zabel@pengutronix.de, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacky.baip@gmail.com
Subject: Re: [PATCH v2 04/12] driver: clk: imx: Add clock driver for imx6sll
Message-ID: <20170103174909.3a5qtds4fpmgzhxs@rob-hp-laptop>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-5-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482832070-22668-5-git-send-email-ping.bai@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Dec 27, 2016 at 05:47:42PM +0800, Bai Ping wrote:
> Add clk driver support for imx6sll.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  drivers/clk/imx/Makefile                  |   1 +
>  drivers/clk/imx/clk-imx6sll.c             | 369 ++++++++++++++++++++++++++++++

>  include/dt-bindings/clock/imx6sll-clock.h | 204 +++++++++++++++++

This should be part of the binding doc patch.

>  3 files changed, 574 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-imx6sll.c
>  create mode 100644 include/dt-bindings/clock/imx6sll-clock.h
