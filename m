Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9D4C7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 20:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjB0UBG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 15:01:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjB0UBE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 15:01:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3672917B
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 12:00:59 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWjft-00049g-4x; Mon, 27 Feb 2023 21:00:41 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWjfr-0002JA-Od; Mon, 27 Feb 2023 21:00:39 +0100
Date:   Mon, 27 Feb 2023 21:00:39 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
Message-ID: <20230227200039.ugmtvpli6gvux3fi@pengutronix.de>
References: <20230227174535.87657-1-marex@denx.de>
 <20230227190123.znifdqympsantpt6@pengutronix.de>
 <a519eb0b-dc40-deec-03d3-676648a52f15@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a519eb0b-dc40-deec-03d3-676648a52f15@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-02-27, Marek Vasut wrote:
> On 2/27/23 20:01, Marco Felsch wrote:
> > Hi Marek,
> > 
> > On 23-02-27, Marek Vasut wrote:
> > > Add #sound-dai-cells properties to SAI nodes.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Abel Vesa <abelvesa@kernel.org>
> > > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Jacky Bai <ping.bai@nxp.com>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Cc: Peng Fan <peng.fan@nxp.com>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Richard Cochran <richardcochran@gmail.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-clk@vger.kernel.org
> > > ---
> > >   arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> > > index ed9ac6c5047c0..bbec860ef8548 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> > > @@ -294,6 +294,7 @@ spba2: spba-bus@30000000 {
> > >   				ranges;
> > >   				sai2: sai@30020000 {
> > > +					#sound-dai-cells = <0>;
> > 
> > Please don't add it in front of the compatible and the reg property.
> 
> The #address-cells and #size-cells are also always on top, why should the
> #sound-dai-cells be any different ? Where should they be ?

As of now my understanding of specifying a devicetree node was:

node-name@reg-nr {
	compatible = "";
	reg = <>;
	// all pending properties below
	...
};

@Rob, @Krzysztof:
Is this a (unwritten) rule/policy?

Marekt please ignore my comment if this is not the case.

Regards,
  Marco
