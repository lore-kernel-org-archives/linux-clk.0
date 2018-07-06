Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751517AbeGFVEm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Jul 2018 17:04:42 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1530712163-16130-1-git-send-email-festevam@gmail.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <fabio.estevam@nxp.com>
References: <1530712163-16130-1-git-send-email-festevam@gmail.com>
Message-ID: <153091108141.143105.12717931012017305757@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: imx51-imx53: Annotate critical clocks as CLK_IS_CRITICAL
Date: Fri, 06 Jul 2018 14:04:41 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Fabio Estevam (2018-07-04 06:49:23)
> From: Fabio Estevam <fabio.estevam@nxp.com>
> =

> Instead of explicitly enabling critical clocks via clk_prepare_enable(),
> let's use the standard CLK_IS_CRITICAL flag instead, which makes the code
> a bit shorter.
> =

> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-next

