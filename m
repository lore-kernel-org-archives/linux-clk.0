Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764C6C0015E
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 08:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjHIIoB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 04:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjHIIoB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 04:44:01 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D387F0;
        Wed,  9 Aug 2023 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cKdDAwuN7ArSFpLCXAKyPip8XfBoVOsaEIFRLY8h5c4=; b=1WRK5YM/39NWfX9X9AYMRiU8TT
        KRQCraZfpzMNslYyy7mhaOM4AsqzEmk4JsJQnfgsugI9D7bx3iry5jbZIOGzFqd3lDW1+oOYaTjKU
        Uv3t4LFV27snMeyWZovjEzZoOwyyEhHOlFvWMY9IVXRTQyM0zpVaeTrqeTTB4ObTUw1ZGAJSFvPBH
        dhDJrzuowtSaziHZWVcXnb0aheZlGya5bCVCdBCX65spwvexne8YWIxADbFua8bKikBhudLlaZTIG
        tB+b3DU+BS6eQVLt5e4JponNufPSB6bOB8T6gmhb0HIkvnRFv+CcF+CnTj+9pXwtr+U0UMCWqyqhi
        rDbJne6Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36380)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qTenI-0002Hc-2G;
        Wed, 09 Aug 2023 09:43:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qTenF-0000aY-Od; Wed, 09 Aug 2023 09:43:49 +0100
Date:   Wed, 9 Aug 2023 09:43:49 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Wei Fang <wei.fang@nxp.com>, Marek Vasut <marex@denx.de>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Eric Dumazet <edumazet@google.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] net: phy: at803x: Improve hibernation support on start up
Message-ID: <ZNNRxY4z7HroDurv@shell.armlinux.org.uk>
References: <20230804175842.209537-1-marex@denx.de>
 <AM5PR04MB3139793206F9101A552FADA0880DA@AM5PR04MB3139.eurprd04.prod.outlook.com>
 <45b1ee70-8330-0b18-2de1-c94ddd35d817@denx.de>
 <AM5PR04MB31392C770BA3101BDFBA80318812A@AM5PR04MB3139.eurprd04.prod.outlook.com>
 <20230809043626.GG5736@pengutronix.de>
 <AM5PR04MB3139D8C0EBC9D2DFB0C778348812A@AM5PR04MB3139.eurprd04.prod.outlook.com>
 <20230809060836.GA13300@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809060836.GA13300@pengutronix.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 09, 2023 at 08:08:36AM +0200, Oleksij Rempel wrote:
> If fully functional external clock provider is need to initialize the
> MAC, just disabling this clock on already initialized HW without doing
> proper re-initialization sequence is usually bad idea. HW may get some
> glitch which will make troubleshooting a pain.

There are cases where the PHY sits on a MDIO bus that is created
by the ethernet MAC driver, which means the PHY only exists during
the ethernet MAC driver probe.

I think that provided the clock is only obtained after we know the
PHY is present, that would probably be fine - but doing it before
the MDIO bus has been created will of course cause problems.

We've had these issues before with stmmac, so this "stmmac needs the
PHY receive clock" is nothing new - it's had problems with system
suspend/resume in the past, and I've made suggestions... and when
there's been two people trying to work on it, I've attempted to get
them to talk to each other which resulted in nothing further
happening.

Another solution could possibly be that we reserve bit 30 on the
PHY dev_flags to indicate that the receive clock must always be
provided. I suspect that would have an advantage in another
situation - for EEE, there's a control bit which allows the
receive clock to be stopped while the link is in low-power state.
If the MAC always needs the receive clock, then obviously that
should be blocked.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
