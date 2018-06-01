Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Anson Huang <Anson.Huang@nxp.com>, adriana.reus@nxp.com,
 fabio.estevam@nxp.com, kernel@pengutronix.de, mark.rutland@arm.com,
 mturquette@baylibre.com, robh+dt@kernel.org, rui.silva@linaro.org,
 shawnguo@kernel.org, stefan@agner.ch
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1526605266-18464-3-git-send-email-Anson.Huang@nxp.com>
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <1526605266-18464-1-git-send-email-Anson.Huang@nxp.com>
 <1526605266-18464-3-git-send-email-Anson.Huang@nxp.com>
Message-ID: <152788068714.225090.5079106153189288626@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH V2 3/3] ARM: dts: imx7: correct enet ipg clock
Date: Fri, 01 Jun 2018 12:18:07 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Anson Huang (2018-05-17 18:01:06)
> ENET "ipg" clock should be IMX7D_ENETx_IPG_ROOT_CLK
> rather than IMX7D_ENET_AXI_ROOT_CLK which is for ENET bus
> clock.
> =

> Based on Andy Duan's patch from the NXP kernel tree.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
