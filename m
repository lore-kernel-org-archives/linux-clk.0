Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72177C77B7F
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 08:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjEHIau (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 04:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEHIat (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 04:30:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E7A137
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 01:30:48 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pvwGZ-0001JB-3v; Mon, 08 May 2023 10:30:43 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pvwGW-0003y3-LM; Mon, 08 May 2023 10:30:40 +0200
Date:   Mon, 8 May 2023 10:30:40 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        Abel Vesa <abelvesa@kernel.org>, Marek Vasut <marex@denx.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Richard Cochran <richardcochran@gmail.com>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Leitner <richard.leitner@linux.dev>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v7 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Message-ID: <20230508083040.rjxlxopim2xkypet@pengutronix.de>
References: <20230301163257.49005-1-marex@denx.de>
 <20230301163257.49005-4-marex@denx.de>
 <ZACNuAOJd+uXBKyJ@g0hl1n.net>
 <20230421092623.jz7qxd7pkj2egzts@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421092623.jz7qxd7pkj2egzts@pengutronix.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-21, Marco Felsch wrote:
> Hi Shawn,
> 
> On 23-03-02, Richard Leitner wrote:
> > On Wed, Mar 01, 2023 at 05:32:56PM +0100, Marek Vasut wrote:
> > > Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> > > needed to get audio operational on i.MX8MP .
> > > 
> > > Acked-by: Peng Fan <peng.fan@nxp.com>
> > > Reviewed-by: Fabio Estevam <festevam@gmail.com>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> > > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > 
> > Hi Marek,
> > I've successfully tested this patch on a custom i.MX8MP board. Therefore
> > please feel free to add:
> > 
> > Tested-by: Richard Leitner <richard.leitner@skidata.com>
> 
> Can you please pick patch 4 and 5? Patch 1-3 is already picked by Abel.

Gentle ping.

Regards,
  Marco
