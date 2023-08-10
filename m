Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D065C001DB
	for <linux-clk@archiver.kernel.org>; Thu, 10 Aug 2023 10:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbjHJKaQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 06:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbjHJKaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 06:30:15 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B23E83;
        Thu, 10 Aug 2023 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IRD6HqxGhJnuitXIWeZDqxMqag7w8CYSo4tEAx8jmkE=; b=EkGY8AcBtIn/WQ3aZleVm5YukM
        IX6AgJQlFSJ8kgfSLOZHHLaTeIIJSHD8TUTQwYeRDg+dthVGZcPbg1LJPQsYwwWgbmKPqkL5M9XxB
        ylK7ZD+3Z4Zyi/IJVymtBHXScPVdbBaBsKau5lcQQlTisbSyMl2GWDzPD9Fh20goNh7RM7tFO0EYI
        Xyn+hGgSSNOm/Hgri5QPgNRhdArtfwo8VSwXz/CV0Mjcw/G4avLHk2ie0eEFqh9iIFuiBup/XFChy
        8zu+kdEUv/5stGXRKh2K1s/U5QwKJtxWWAh8sE0JnE2sfEgBRQS5eQTZ9RoHsAYR766OE5AHZ83ob
        OBa7FECA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48818)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qU2vd-0003oS-2M;
        Thu, 10 Aug 2023 11:30:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qU2vc-0001hB-Ho; Thu, 10 Aug 2023 11:30:04 +0100
Date:   Thu, 10 Aug 2023 11:30:04 +0100
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
Message-ID: <ZNS8LEiuwsv660EC@shell.armlinux.org.uk>
References: <20230804175842.209537-1-marex@denx.de>
 <AM5PR04MB3139793206F9101A552FADA0880DA@AM5PR04MB3139.eurprd04.prod.outlook.com>
 <45b1ee70-8330-0b18-2de1-c94ddd35d817@denx.de>
 <AM5PR04MB31392C770BA3101BDFBA80318812A@AM5PR04MB3139.eurprd04.prod.outlook.com>
 <20230809043626.GG5736@pengutronix.de>
 <AM5PR04MB3139D8C0EBC9D2DFB0C778348812A@AM5PR04MB3139.eurprd04.prod.outlook.com>
 <20230809060836.GA13300@pengutronix.de>
 <ZNNRxY4z7HroDurv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNNRxY4z7HroDurv@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 09, 2023 at 09:43:49AM +0100, Russell King (Oracle) wrote:
> On Wed, Aug 09, 2023 at 08:08:36AM +0200, Oleksij Rempel wrote:
> > If fully functional external clock provider is need to initialize the
> > MAC, just disabling this clock on already initialized HW without doing
> > proper re-initialization sequence is usually bad idea. HW may get some
> > glitch which will make troubleshooting a pain.
> 
> There are cases where the PHY sits on a MDIO bus that is created
> by the ethernet MAC driver, which means the PHY only exists during
> the ethernet MAC driver probe.
> 
> I think that provided the clock is only obtained after we know the
> PHY is present, that would probably be fine - but doing it before
> the MDIO bus has been created will of course cause problems.
> 
> We've had these issues before with stmmac, so this "stmmac needs the
> PHY receive clock" is nothing new - it's had problems with system
> suspend/resume in the past, and I've made suggestions... and when
> there's been two people trying to work on it, I've attempted to get
> them to talk to each other which resulted in nothing further
> happening.
> 
> Another solution could possibly be that we reserve bit 30 on the
> PHY dev_flags to indicate that the receive clock must always be
> provided. I suspect that would have an advantage in another
> situation - for EEE, there's a control bit which allows the
> receive clock to be stopped while the link is in low-power state.
> If the MAC always needs the receive clock, then obviously that
> should be blocked.

Something like this for starters:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fcab363d8dfa..a954f1d61709 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1254,6 +1254,11 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
 	priv->phylink_config.mac_managed_pm = true;
 
+	/* stmmac always requires a receive clock in order for things like
+	 * hardware reset to work.
+	 */
+	priv->phylink_config.mac_requires_rxc = true;
+
 	phylink = phylink_create(&priv->phylink_config, fwnode,
 				 mode, &stmmac_phylink_mac_ops);
 	if (IS_ERR(phylink))
diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index 13c4121fa309..619a63a0d14f 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -990,7 +990,8 @@ static int at803x_hibernation_mode_config(struct phy_device *phydev)
 	/* The default after hardware reset is hibernation mode enabled. After
 	 * software reset, the value is retained.
 	 */
-	if (!(priv->flags & AT803X_DISABLE_HIBERNATION_MODE))
+	if (!(priv->flags & AT803X_DISABLE_HIBERNATION_MODE) &&
+	    !(phydev->dev_flags & PHY_F_RXC_ALWAYS_ON))
 		return 0;
 
 	return at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_HIB_CTRL,
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 3e9909b30938..4d1a37487923 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3216,6 +3216,8 @@ static int phy_probe(struct device *dev)
 			goto out;
 	}
 
+        phy_disable_interrupts(phydev);
+
 	/* Start out supporting everything. Eventually,
 	 * a controller will attach, and may modify one
 	 * or both of these values
@@ -3333,16 +3335,6 @@ static int phy_remove(struct device *dev)
 	return 0;
 }
 
-static void phy_shutdown(struct device *dev)
-{
-	struct phy_device *phydev = to_phy_device(dev);
-
-	if (phydev->state == PHY_READY || !phydev->attached_dev)
-		return;
-
-	phy_disable_interrupts(phydev);
-}
-
 /**
  * phy_driver_register - register a phy_driver with the PHY layer
  * @new_driver: new phy_driver to register
@@ -3376,7 +3368,6 @@ int phy_driver_register(struct phy_driver *new_driver, struct module *owner)
 	new_driver->mdiodrv.driver.bus = &mdio_bus_type;
 	new_driver->mdiodrv.driver.probe = phy_probe;
 	new_driver->mdiodrv.driver.remove = phy_remove;
-	new_driver->mdiodrv.driver.shutdown = phy_shutdown;
 	new_driver->mdiodrv.driver.owner = owner;
 	new_driver->mdiodrv.driver.probe_type = PROBE_FORCE_SYNCHRONOUS;
 
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4f1c8bb199e9..6568a2759101 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1830,6 +1830,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 			      phy_interface_t interface)
 {
+	u32 flags = 0;
+
 	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
 		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
 		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
@@ -1838,7 +1840,10 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 	if (pl->phydev)
 		return -EBUSY;
 
-	return phy_attach_direct(pl->netdev, phy, 0, interface);
+	if (pl->config.mac_requires_rxc)
+		flags |= PHY_F_RXC_ALWAYS_ON;
+
+	return phy_attach_direct(pl->netdev, phy, flags, interface);
 }
 
 /**
@@ -1941,6 +1946,9 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 		pl->link_config.interface = pl->link_interface;
 	}
 
+	if (pl->config.mac_requires_rxc)
+		flags |= PHY_F_RXC_ALWAYS_ON;
+
 	ret = phy_attach_direct(pl->netdev, phy_dev, flags,
 				pl->link_interface);
 	phy_device_free(phy_dev);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index ba08b0e60279..79df5e01707d 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -761,6 +761,7 @@ struct phy_device {
 
 /* Generic phy_device::dev_flags */
 #define PHY_F_NO_IRQ		0x80000000
+#define PHY_F_RXC_ALWAYS_ON	BIT(30)
 
 static inline struct phy_device *to_phy_device(const struct device *dev)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 789c516c6b4a..a83c1a77338f 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -204,6 +204,7 @@ enum phylink_op_type {
  * @poll_fixed_state: if true, starts link_poll,
  *		      if MAC link is at %MLO_AN_FIXED mode.
  * @mac_managed_pm: if true, indicate the MAC driver is responsible for PHY PM.
+ * @mac_requires_rxc: if true, the MAC always requires a receive clock from PHY.
  * @ovr_an_inband: if true, override PCS to MLO_AN_INBAND
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
@@ -216,6 +217,7 @@ struct phylink_config {
 	enum phylink_op_type type;
 	bool poll_fixed_state;
 	bool mac_managed_pm;
+	bool mac_requires_rxc;
 	bool ovr_an_inband;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
