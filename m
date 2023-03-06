Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C88C61DA4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 09:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjCFJrq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 04:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjCFJrq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 04:47:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890343ABF
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 01:47:44 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pZ7RS-00047V-0Q; Mon, 06 Mar 2023 10:47:38 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pZ7RR-0002Rp-4f; Mon, 06 Mar 2023 10:47:37 +0100
Date:   Mon, 6 Mar 2023 10:47:37 +0100
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
Message-ID: <20230306094737.GA11506@pengutronix.de>
References: <3ceda169-de1b-2c1f-9ee8-bc8fdb547433@i2se.com>
 <20230306052531.GA30081@pengutronix.de>
 <8a178040-ef52-d9ab-e704-69208d34f915@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a178040-ef52-d9ab-e704-69208d34f915@i2se.com>
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

On Mon, Mar 06, 2023 at 10:13:57AM +0100, Stefan Wahren wrote:
> Hi Oleksij,
> 
> Am 06.03.23 um 06:25 schrieb Oleksij Rempel:
> > Hi Stefan,
> > 
> > On Sun, Mar 05, 2023 at 11:16:17PM +0100, Stefan Wahren wrote:
> > > Hi,
> > > 
> > > we planned to submit our custom i.MX6ULL board [1] to mainline after release
> > > of Linux 6.3-rc1, but the recent enet refclock changes breaks our Ethernet
> > > phy:
> > > 
> > > [    0.000000] imx:clk-gpr-mux: failed to get parent (-EINVAL)
> > > 
> > > ...
> > > 
> > > [   18.574595] SMSC LAN8710/LAN8720 2188000.ethernet-1:00: phy_poll_reset
> > > failed: -110
> > > [   18.581064] fec 2188000.ethernet eth0: Unable to connect to phy
> > > 
> > > I narrow down the PHY issue to this first bad commit:
> > > 
> > > 5f82bfced611 ("clk: imx6ul: fix enet1 gate configuration")
> > > 
> > > The clock issues seems to be cause by the following commit. If i revert
> > > 5f82bfced611 and 4e197ee880c24 or use Linux 6.2 everything is fine.
> > It looks like in your kernel version are some missing patches. Can you please
> > rebase your patches on top of this branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/log/?h=for-next
> 
> thanks for your fast reply. But i rebased my patches against Linux v6.3-rc1
> since this was released yesterday and should contain all patches from Shawn.

No, it is not. Related DTS changes are not included in to v6.3-rc1.

> I also changed the clockref in my DTSI file:
> 
> https://github.com/chargebyte/linux/commits/v6.3-tarragon-v3
> 
> Now the PHY issue disappeared and ethernet is working, but the
> 
> imx:clk-gpr-mux: failed to get parent (-EINVAL)

I need to take a look at it. It should not be critical.

> 
> is still there.
> 
> > and please rename IMX6UL_CLK_ENET_REF to IMX6UL_CLK_ENET1_REF_SEL in
> > your dtsi.
> 
> Yes, this seems to be the issue in my case.
> 
> Does this mean a Linux 6.3 kernel doesn't work with a i.MX6ULL Linux 6.2
> devicetree?

If I see it correctly. Since you do not have patch [1] related clock is not
enabled by the fec controller. Since this PHY is not addressable without
running rmii clock, the PHY can't be probed.

> So there is no fallback?

With [1] it should not be needed.

> 
> What about these other dtsi in Linux 6.3rc-1?
> 
> $ grep IMX6UL_CLK_ENET_REF *
> imx6ul-14x14-evk.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
> ..
> imx6ul-kontron-bl-common.dtsi:            clocks = <&clks
> IMX6UL_CLK_ENET_REF>;
> imx6ul-kontron-sl-common.dtsi:            clocks = <&clks
> IMX6UL_CLK_ENET_REF>;
> imx6ull-dhcom-picoitx.dts:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
> imx6ull-dhcom-som.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
> imx6ull-jozacp.dts:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
> imx6ull-myir-mys-6ulx.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
> imx6ul-phytec-phycore-som.dtsi:            clocks = <&clks
> IMX6UL_CLK_ENET_REF>;
> mba6ulx.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;

It is nice to convert all of them to proper clock. But all of them are
expected to work with [1].

Can you please confirm it? Revert yourdtsi back to IMX6UL_CLK_ENET_REF
and include [1]?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?h=for-next&id=8940c105273fcde00a60023f68f8a5b75e1df0cc

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
