Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751532AbeDFSdJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Apr 2018 14:33:09 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Bai Ping <ping.bai@nxp.com>, kernel@pengutronix.de,
        robh+dt@kernel.org, shawnguo@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521512644-25265-1-git-send-email-ping.bai@nxp.com>
Cc: fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        aisheng.dong@nxp.com, jacky.baip@gmail.com
References: <1521512644-25265-1-git-send-email-ping.bai@nxp.com>
Message-ID: <152303958867.94378.5765405972950548052@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v6 1/4] clk: imx: Add CLK_IS_CRITICAL flag for busy divider and
 busy mux
Date: Fri, 06 Apr 2018 11:33:08 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Bai Ping (2018-03-19 19:24:01)
> The busy divider and busy mux is actually used by the system critical clocks,
> so add 'CLK_IS_CRITICAL' to clocks registered with these two type.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> Acked-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

