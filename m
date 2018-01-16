Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:45728 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750802AbeAPKGe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Jan 2018 05:06:34 -0500
Received: by mail-oi0-f54.google.com with SMTP id j129so10205813oib.12
        for <linux-clk@vger.kernel.org>; Tue, 16 Jan 2018 02:06:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516023719.10524.6.camel@pengutronix.de>
References: <1516022463-12953-1-git-send-email-festevam@gmail.com> <1516023719.10524.6.camel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Jan 2018 08:06:33 -0200
Message-ID: <CAOMZO5DxRJ1JY-uVcU9zXbFGEYrMxjEyPrxSsdKC5+oKA2SVMA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx51-imx53: Fix UART4/5 registration on i.MX50 and i.MX53
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Philipp,

On Mon, Jan 15, 2018 at 11:41 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> I think the cleanest solution would be to add the UART[123] gates
> to the uart_clks_mx50_mx53 array as well, to remove the remaining
> imx_register_uart_clocks from common init, and add it to
> mx51_clocks_init instead.

Yes, I did as you suggested in v2.

Thanks
