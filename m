Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Anson Huang <Anson.Huang@nxp.com>, aisheng.dong@nxp.com,
 fabio.estevam@nxp.com, kernel@pengutronix.de, mark.rutland@arm.com,
 mturquette@baylibre.com, ping.bai@nxp.com, robh+dt@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1529649154-5724-1-git-send-email-Anson.Huang@nxp.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1529649154-5724-1-git-send-email-Anson.Huang@nxp.com>
Message-ID: <153091072630.143105.2849049240391576710@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: imx6sll: add GPIO LPCGs
Date: Fri, 06 Jul 2018 13:58:46 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Anson Huang (2018-06-21 23:32:33)
> According to Reference Manual Rev.0, 06/2017,
> there are GPIO LPCGs defined in CCM CCGRs,
> add them into clock tree.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
