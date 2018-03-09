Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750902AbeCICcU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Mar 2018 21:32:20 -0500
Date: Fri, 9 Mar 2018 10:31:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Bai Ping <ping.bai@nxp.com>
Cc: sboyd@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de,
        fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        aisheng.dong@nxp.com, jacky.baip@gmail.com
Subject: Re: [PATCH v4 1/4] driver: clk: imx: Add CLK_IS_CRITICAL flag for
 busy divider and busy mux
Message-ID: <20180309023136.GD3217@dragon>
References: <1520502445-22576-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1520502445-22576-1-git-send-email-ping.bai@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 08, 2018 at 05:47:22PM +0800, Bai Ping wrote:
> The busy divider and busy mux is actually used by the system critical clocks,
> so add 'CLK_IS_CRITICAL' to clocks registered with these two type.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>

"clk: imx: ..." for patch prefix is good enough.

Shawn
