Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-db5eur01on0087.outbound.protection.outlook.com ([104.47.2.87]:32352
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750742AbeCIFAu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 9 Mar 2018 00:00:50 -0500
From: Jacky Bai <ping.bai@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
CC: "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>
Subject: RE: [PATCH v4 1/4] driver: clk: imx: Add CLK_IS_CRITICAL flag for
 busy divider and busy mux
Date: Fri, 9 Mar 2018 05:00:45 +0000
Message-ID: <HE1PR04MB311302F75DB42DEB034EF61F87DE0@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <1520502445-22576-1-git-send-email-ping.bai@nxp.com>
 <20180309023136.GD3217@dragon>
In-Reply-To: <20180309023136.GD3217@dragon>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> Subject: Re: [PATCH v4 1/4] driver: clk: imx: Add CLK_IS_CRITICAL flag fo=
r busy
> divider and busy mux
>=20
> On Thu, Mar 08, 2018 at 05:47:22PM +0800, Bai Ping wrote:
> > The busy divider and busy mux is actually used by the system critical
> > clocks, so add 'CLK_IS_CRITICAL' to clocks registered with these two ty=
pe.
> >
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
>=20
> "clk: imx: ..." for patch prefix is good enough.
>=20

OK, will be updated in V5.

Jacky
> Shawn
