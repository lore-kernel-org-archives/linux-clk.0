Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Message-ID: <5b8e8a77.1c69fb81.971e7.095e@mx.google.com>
Date: Tue, 04 Sep 2018 08:36:54 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/7] clk: imx6sl: add mmdc ipg clocks
References: <1535701998-20443-1-git-send-email-Anson.Huang@nxp.com> <1535701998-20443-6-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1535701998-20443-6-git-send-email-Anson.Huang@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,         fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com,         linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,         colin.didier@devialet.com, clement.peron@devialet.com,         ping.bai@nxp.com, aisheng.dong@nxp.com, shengjiu.wang@nxp.com,         matteo.lisi@engicam.com, michael@amarulasolutions.com,         linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,         linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
To: Anson Huang <Anson.Huang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, 31 Aug 2018 15:53:16 +0800, Anson Huang wrote:
> i.MX6SL has MMDC0 and MMDC1 ipg clock in CCM CCGR, add them into
> clock tree for clock management.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/clk/imx/clk-imx6sl.c             | 2 ++
>  include/dt-bindings/clock/imx6sl-clock.h | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
