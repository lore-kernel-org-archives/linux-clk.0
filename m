Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754214AbeGIGWB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Jul 2018 02:22:01 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "A.s. Dong" <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180615095107.24610-2-o.rempel@pengutronix.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-2-o.rempel@pengutronix.de>
Message-ID: <153111732039.143105.423209769011221751@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
Date: Sun, 08 Jul 2018 23:22:00 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Oleksij Rempel (2018-06-15 02:51:04)
> This clock is needed for iMX mailbox driver
> =

> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

but I think you'll want some imx maintainer to review it still.
