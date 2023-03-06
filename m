Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D60C678D4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 14:02:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjCFOCT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjCFOCS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 09:02:18 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E344B1980
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 06:02:16 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pZBPl-0003Iq-1w; Mon, 06 Mar 2023 15:02:09 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pZBPj-0004cy-Hd; Mon, 06 Mar 2023 15:02:07 +0100
Date:   Mon, 6 Mar 2023 15:02:07 +0100
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
Message-ID: <20230306140207.GA11936@pengutronix.de>
References: <3ceda169-de1b-2c1f-9ee8-bc8fdb547433@i2se.com>
 <20230306052531.GA30081@pengutronix.de>
 <8a178040-ef52-d9ab-e704-69208d34f915@i2se.com>
 <20230306094737.GA11506@pengutronix.de>
 <953ee705-47a7-3f6b-408e-9d74f3bc30b4@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <953ee705-47a7-3f6b-408e-9d74f3bc30b4@i2se.com>
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

On Mon, Mar 06, 2023 at 02:33:24PM +0100, Stefan Wahren wrote:
> Hi Oleksij,
> 
> Am 06.03.23 um 10:47 schrieb Oleksij Rempel:
> > On Mon, Mar 06, 2023 at 10:13:57AM +0100, Stefan Wahren wrote:
> > > Hi Oleksij,
> > > 
> > > Am 06.03.23 um 06:25 schrieb Oleksij Rempel:
> > > > Hi Stefan,
> > > > 
> > > > On Sun, Mar 05, 2023 at 11:16:17PM +0100, Stefan Wahren wrote:
> > > > > Hi,
> > > > > 
> > > > > we planned to submit our custom i.MX6ULL board [1] to mainline after release
> > > > > of Linux 6.3-rc1, but the recent enet refclock changes breaks our Ethernet
> > > > > phy:
> > > > > 
> > > > > [    0.000000] imx:clk-gpr-mux: failed to get parent (-EINVAL)
> > > > > 
> > > > > ...
> > > > > 
> > > > > [   18.574595] SMSC LAN8710/LAN8720 2188000.ethernet-1:00: phy_poll_reset
> > > > > failed: -110
> > > > > [   18.581064] fec 2188000.ethernet eth0: Unable to connect to phy
> > > > > 
> > > > > I narrow down the PHY issue to this first bad commit:
> > > > > 
> > > > > 5f82bfced611 ("clk: imx6ul: fix enet1 gate configuration")
> > > > > 
> > > > > The clock issues seems to be cause by the following commit. If i revert
> > > > > 5f82bfced611 and 4e197ee880c24 or use Linux 6.2 everything is fine.
> > > > It looks like in your kernel version are some missing patches. Can you please
> > > > rebase your patches on top of this branch:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/log/?h=for-next
> > > thanks for your fast reply. But i rebased my patches against Linux v6.3-rc1
> > > since this was released yesterday and should contain all patches from Shawn.
> > No, it is not. Related DTS changes are not included in to v6.3-rc1.
> 
> Sorry, i didn't noticed that Shawn already rebased his for-next changes on
> top of v6.3-rc1.
> 
> So, the problem is that your clk changes has been applied for 6.3, but the
> necessary arm changes will land in 6.4? :-(

I hope it will go as fixes to 6.3-rcX. Shawn?

> > > I also changed the clockref in my DTSI file:
> > > 
> > > https://github.com/chargebyte/linux/commits/v6.3-tarragon-v3
> > > 
> > > Now the PHY issue disappeared and ethernet is working, but the
> > > 
> > > imx:clk-gpr-mux: failed to get parent (-EINVAL)
> > I need to take a look at it. It should not be critical.
> 
> I prepared a patch [1] to improve the debugging here:
> 
> [    0.000000] Entry 262144 != val 0
> [    0.000000] Entry 16384 != val 0
> [    0.000000] imx:clk-gpr-mux: val 0, num_parents 2
> [    0.000000] imx:clk-gpr-mux: failed to get parent of enet2_ref_sel
> (-EINVAL)
> 
> It seems that val 0 is unexpected for the driver. Maybe it's worth to
> mention that we use an older U-Boot [2]. But Linux should make any
> assumptions here.

There are two configuration bits per Ethernet interface:
- BIT(17) ENET1_TX_CLK_DIR
- BIT(13) ENET1_CLK_SEL

With this bits we have following variants:
1. internal clock source with output on ENET1_TX_CLK
2. internal clock source without output on ENET1_TX_CLK. Are there any
   use cases need to support this mode?
3. external clock source without output on ENET1_TX_CLK
4. external clock source with output on ENET1_TX_CLK, well ENET1_TX_CLK
   is input it can't be out put on this case.

Current kernel supports modes 1 and 3. For mode 2 I do not have a use
case and mode 4 make no sense.

In your case, the boot loader configures clocks to mode 2 which is not
correct for this HW. It should be mode 1.

Probably, the way to go is do register dummy parents for not supported
modes. It would silent the kernel. Other ideas?

> > Can you please confirm it? Revert yourdtsi back to IMX6UL_CLK_ENET_REF
> > and include [1]?
> 
> I rebased all changes on top of Shawn's branch and reverted to
> IMX6UL_CLK_ENET_REF [3]. So yes, i confirm that Ethernet works in this case.

Thx! So, there should be no regressions if this patch will to as fix for
6.3-rcX. Except of kernel warning wrong parent configuration.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
