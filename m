Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S971292AbeCSUsu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 16:48:50 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "A.s. Dong" <aisheng.dong@nxp.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM3PR04MB3065CB215B6264649D64C9B80D70@AM3PR04MB306.eurprd04.prod.outlook.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>
References: <1520846957-22348-1-git-send-email-ping.bai@nxp.com>
 <1520846957-22348-2-git-send-email-ping.bai@nxp.com>
 <AM3PR04MB3065CB215B6264649D64C9B80D70@AM3PR04MB306.eurprd04.prod.outlook.com>
Message-ID: <152149252893.242365.10879210224353918456@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v5 2/4] clk: imx: add new gate/gate2 wrapper funtion
Date: Mon, 19 Mar 2018 13:48:48 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting A.s. Dong (2018-03-15 23:30:13)
> > -----Original Message-----
> > From: Jacky Bai
> > Sent: Monday, March 12, 2018 5:29 PM
> > To: sboyd@kernel.org; robh+dt@kernel.org; shawnguo@kernel.org;
> > kernel@pengutronix.de
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>; linux-clk@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>;
> > A.s. Dong <aisheng.dong@nxp.com>; jacky.baip@gmail.com
> > Subject: [PATCH v5 2/4] clk: imx: add new gate/gate2 wrapper funtion
> > 
> > Add new gate/gate2 wrapper function to register clocks with optional flags.
> > 
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
> 
> AFAIK Stephen requested to switch to clk_hw based APIs when reviewing my
> mx7ulp clk driver. We may need some comments from Stephen here.
> 
> Hi Stefen,
> 
> Do you have any comments about this?
> 

Using clk_hw based APIs is preferred. If there's existing usage of
non-hw based APIs then it's OK to keep same style and change later.
