Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93EBC64ED6
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 09:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjCAJmh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjCAJmg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 04:42:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CE9E063
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 01:42:35 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIyd-0007Z5-MW; Wed, 01 Mar 2023 10:42:23 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIyc-0005LU-L2; Wed, 01 Mar 2023 10:42:22 +0100
Date:   Wed, 1 Mar 2023 10:42:22 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
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
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Message-ID: <20230301094222.uihp4e5yfasaidys@pengutronix.de>
References: <20230228215739.171071-1-marex@denx.de>
 <20230228215739.171071-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228215739.171071-5-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-02-28, Marek Vasut wrote:
> Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
> This is all that is needed to get analog audio output operational
> on i.MX8MP EVK.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
