Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-he1eur01on0076.outbound.protection.outlook.com ([104.47.0.76]:32359
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751847AbeCWJtn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Mar 2018 05:49:43 -0400
From: Abel Vesa <abel.vesa@nxp.com>
To: "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC: Anson Huang <anson.huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Adriana Reus <adriana.reus@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "abelvesa@linux.com" <abelvesa@linux.com>
Subject: Return checks for clock calls
Date: Fri, 23 Mar 2018 09:49:38 +0000
Message-ID: <20180323094937.5wx5exah6tfyl43u@fsr-ub1664-175>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Shawn, Fabio,

I'm trying to get the imx clks changes upstreamed. To that end, I reached t=
his
old commit that adds some wrappers over the generic clk API. Here is the co=
mmit
message:

	ARM: imx6: add return check for clock calls

	There are a bunch of clk_enable_prepare, clk_set_parent and clk_set_rate
	calls in imx6 clock driver's initialization.  They are called without
	retunr check.  If there is something going wrong with the calls, they
	will just fail silently.

	The patch creates a set of helper functions imx_clk_enable_prepare,
	imx_clk_set_parent and imx_clk_set_rate, and use them instead from clock
	initialization to check the return and print error message to tell
	failures if any.

	Signed-off-by: Shawn Guo <shawn.guo@freescale.com>

And it adds the imx_clk_set_parent, imx_clk_prepare_enable and
imx_clk_set_rate which basically just print an error message if the generic
functions have failed.

The only plus of these wrappers is that we at least see that the generic
functions have failed, but the behaviour is not changed in any way.

Question is, do we want this upstreamed considering that we need to replace=
 the
calls throughout all the older imx socs ?

Abel=
