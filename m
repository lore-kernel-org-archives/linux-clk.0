Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F559C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 09:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjCAJJV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCAJJV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 04:09:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200781CAEA
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 01:09:20 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXISE-0002Ur-2o; Wed, 01 Mar 2023 10:08:54 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXISB-00030N-Oz; Wed, 01 Mar 2023 10:08:51 +0100
Date:   Wed, 1 Mar 2023 10:08:51 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
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
Message-ID: <20230301090851.giyqbfh4iwtzys4d@pengutronix.de>
References: <20230227174535.87657-1-marex@denx.de>
 <20230227190123.znifdqympsantpt6@pengutronix.de>
 <a519eb0b-dc40-deec-03d3-676648a52f15@denx.de>
 <20230227200039.ugmtvpli6gvux3fi@pengutronix.de>
 <947af937-3178-48ad-998f-b048245f3ffe@linaro.org>
 <5aa6d956-f00b-faa2-e189-12cf1274962b@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aa6d956-f00b-faa2-e189-12cf1274962b@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-02-28, Marek Vasut wrote:
> On 2/28/23 09:10, Krzysztof Kozlowski wrote:
> > On 27/02/2023 21:00, Marco Felsch wrote:
> > > > > > +					#sound-dai-cells = <0>;
> > > > > 
> > > > > Please don't add it in front of the compatible and the reg property.
> > > > 
> > > > The #address-cells and #size-cells are also always on top, why should the
> > > > #sound-dai-cells be any different ? Where should they be ?
> > > 
> > > As of now my understanding of specifying a devicetree node was:
> > > 
> > > node-name@reg-nr {
> > > 	compatible = "";
> > > 	reg = <>;
> > > 	// all pending properties below
> > > 	...
> > > };
> > > 
> > > @Rob, @Krzysztof:
> > > Is this a (unwritten) rule/policy?
> > > 
> > 
> > Each platform has its own coding style around this but I am not aware of
> > a coding style which puts address and size cells at the top.
> 
> DTspec 0.3 and 0.4-rc agrees with the below.
> 
> Linux seems to be full of counter-examples though:
> $ git grep -A 1 ' {$' arch/*/boot/dts/ | grep -B 1 cells
> 
> > To me it is
> > really odd placement. First property is always "compatible", as the most
> > important. Then for most platforms second is "reg", as the one easiest
> > to compare with unit address. Some platforms put status as last property.
> 
> All right, so:
> 
> - compatible
> - reg
> - #whatever-cells
> - properties
> - status
> 
> Does that order look right ?

I would swap the #whatever-cells with the properties, but that's just my
opinion. The rest looks good to me. Thanks for the research.

Regards,
  Marco

> 
> [...]
> 
