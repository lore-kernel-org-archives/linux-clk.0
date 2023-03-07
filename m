Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BE9C678D4
	for <linux-clk@archiver.kernel.org>; Tue,  7 Mar 2023 10:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjCGKFV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Mar 2023 05:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCGKFM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 05:05:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E060739CC
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 02:04:53 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pZUBb-0005Gr-KS; Tue, 07 Mar 2023 11:04:47 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pZQSz-00032U-0c; Tue, 07 Mar 2023 07:06:29 +0100
Date:   Tue, 7 Mar 2023 07:06:28 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michael Heimpold <mhei@heimpold.de>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: imx6ul: Recent enet refclock changes breaks custom i.mx6ull board
Message-ID: <20230307060628.GC11936@pengutronix.de>
References: <3ceda169-de1b-2c1f-9ee8-bc8fdb547433@i2se.com>
 <20230306052531.GA30081@pengutronix.de>
 <8a178040-ef52-d9ab-e704-69208d34f915@i2se.com>
 <20230306094737.GA11506@pengutronix.de>
 <953ee705-47a7-3f6b-408e-9d74f3bc30b4@i2se.com>
 <20230306140207.GA11936@pengutronix.de>
 <a1646cc8-0830-5add-2957-b9bdbb094b23@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a1646cc8-0830-5add-2957-b9bdbb094b23@i2se.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stefan,

On Mon, Mar 06, 2023 at 04:50:18PM +0100, Stefan Wahren wrote:
> Did you noticed that the error is caused for enet2_ref_sel?
> 
> On our board variants master/slave/slaveXT only ENET1 is used, so ENET2 is
> kept to the defaults (ENET2_TX_CLK_DIR = 0, ENET2_CLK_SEL = 0) and the
> bootloader won't touch those bits.

Ok, i see. It makes sense.

> > With this bits we have following variants:
> > 1. internal clock source with output on ENET1_TX_CLK
> > 2. internal clock source without output on ENET1_TX_CLK. Are there any
> >     use cases need to support this mode?
> After reading the reference manual, this mode refers to ENET1_TX_CLK_DIR =
> 0, ENET1_CLK_SEL = 0. Is my understanding correct?
> > 3. external clock source without output on ENET1_TX_CLK
> > 4. external clock source with output on ENET1_TX_CLK, well ENET1_TX_CLK
> >     is input it can't be out put on this case.
> > 
> > Current kernel supports modes 1 and 3. For mode 2 I do not have a use
> > case and mode 4 make no sense.
> > 
> > In your case, the boot loader configures clocks to mode 2 which is not
> > correct for this HW. It should be mode 1.
> As written above the bootloader doesn't touch this. It's the reset default
> according to the reference manual. So i consider mode 2 as disabled clock,
> which is the right mode for boards without using this particular Ethernet
> interface. For EMC reasons we don't want to enable ENET1 and ENET2 clock
> output unconditionally.
> > Probably, the way to go is do register dummy parents for not supported
> > modes. It would silent the kernel. Other ideas?
> 
> Sorry, i don't have no idea how to properly achieve this.

can you please test this patch:

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 2836adb817b7..e3696a88b5a3 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -95,14 +95,16 @@ static const struct clk_div_table video_div_table[] = {
 	{ }
 };
 
-static const char * enet1_ref_sels[] = { "enet1_ref_125m", "enet1_ref_pad", };
+static const char * enet1_ref_sels[] = { "enet1_ref_125m", "enet1_ref_pad", "dummy", "dummy"};
 static const u32 enet1_ref_sels_table[] = { IMX6UL_GPR1_ENET1_TX_CLK_DIR,
-					    IMX6UL_GPR1_ENET1_CLK_SEL };
+					    IMX6UL_GPR1_ENET1_CLK_SEL, 0,
+					    IMX6UL_GPR1_ENET1_TX_CLK_DIR | IMX6UL_GPR1_ENET1_CLK_SEL };
 static const u32 enet1_ref_sels_table_mask = IMX6UL_GPR1_ENET1_TX_CLK_DIR |
 					     IMX6UL_GPR1_ENET1_CLK_SEL;
-static const char * enet2_ref_sels[] = { "enet2_ref_125m", "enet2_ref_pad", };
+static const char * enet2_ref_sels[] = { "enet2_ref_125m", "enet2_ref_pad", "dummy", "dummy"};
 static const u32 enet2_ref_sels_table[] = { IMX6UL_GPR1_ENET2_TX_CLK_DIR,
-					    IMX6UL_GPR1_ENET2_CLK_SEL };
+					    IMX6UL_GPR1_ENET2_CLK_SEL, 0,
+					    IMX6UL_GPR1_ENET2_TX_CLK_DIR | IMX6UL_GPR1_ENET2_CLK_SEL };
 static const u32 enet2_ref_sels_table_mask = IMX6UL_GPR1_ENET2_TX_CLK_DIR |
 					     IMX6UL_GPR1_ENET2_CLK_SEL;
 
Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
