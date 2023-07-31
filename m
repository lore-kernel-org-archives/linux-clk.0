Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6271C001DE
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 14:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjGaOYU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 10:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjGaOYT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 10:24:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1383B3
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 07:24:18 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qQTog-0004Re-GZ; Mon, 31 Jul 2023 16:24:10 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qQTof-00051m-Nd; Mon, 31 Jul 2023 16:24:09 +0200
Date:   Mon, 31 Jul 2023 16:24:09 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Anson.Huang@nxp.com, abelvesa@kernel.org, festevam@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] clk: imx8mp: fix sai4 clock
Message-ID: <20230731142409.fjbjjqkjyi7upajg@pengutronix.de>
References: <20221219171058.164381-1-m.felsch@pengutronix.de>
 <7687837da16c41ffca3cda747483f2d1.sboyd@kernel.org>
 <20230421091649.7sihfhq62p5qstom@pengutronix.de>
 <a9e1fc3eae03aafd93602842abc80c81.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9e1fc3eae03aafd93602842abc80c81.sboyd@kernel.org>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-06-12, Stephen Boyd wrote:
> Quoting Marco Felsch (2023-04-21 02:16:49)
> > Hi,
> > 
> > On 23-01-12, Stephen Boyd wrote:
> > > Quoting Marco Felsch (2022-12-19 09:10:57)
> > > > The reference manual don't mention a SAI4 hardware block. This would be
> > > > clock slice 78 which is skipped (TRM, page 237). Remove any reference to
> > > > this clock to align the driver with the reality.
> > > > 
> > > > Fixes: 9c140d992676 ("clk: imx: Add support for i.MX8MP clock driver")
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > 
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > 
> > I noticed that this isn't part of v6.3. @Abel can you add your rb or
> > comments please?
> > 
> 
> Please resend and Cc linux-imx@nxp.com

Done
