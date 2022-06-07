Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BE9C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Jun 2022 11:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242042AbiFGLmy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Jun 2022 07:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiFGLmw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jun 2022 07:42:52 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9AE6564
        for <linux-clk@vger.kernel.org>; Tue,  7 Jun 2022 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gqrlsoup18zCUDhYrYfeAFvJhSPNPk8wDK4xnSZ81P8=; b=XAAZo76hhWP9Hy6NqW7m5/PbzW
        hc7Z5+GNmDkFuCIoLLwa5RK1yBllPWP33nYtSRkE+Xmt9nSE/O59u/+BiKcKOHSp4xO5SX46IZWUW
        McWKHDSW2hn7GWWAhU0gT4BXMTBA36LUvq5xyWzeca6ArpRGBdcvKmH78OV+MCnth7ckpk1vJMdFe
        wxrG6iu+CZhoCDiv34N18Ik+osrRgCnvgp0CHfoF6m+W82te6ct9EZcIhL+j2FVpl40seotIkZfQa
        zSS3G3bIQC4zjBWqKdyYGutwJ9sTpBr/6ME56KDESRtY3LGiJFTKZCRRdnpBbKwtx0duOq/mFoutH
        OOaf5FLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60994)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1nyXbi-0003LJ-1k; Tue, 07 Jun 2022 12:42:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1nyXbg-0000lf-I0; Tue, 07 Jun 2022 12:42:44 +0100
Date:   Tue, 7 Jun 2022 12:42:44 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v9 0/4] clk: provide new devm helpers for prepared and
 enabled clocks
Message-ID: <Yp85tHIltGSy647o@shell.armlinux.org.uk>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
 <20220607110816.hjacgojgmf2p7xdq@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607110816.hjacgojgmf2p7xdq@pengutronix.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 07, 2022 at 01:08:16PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, May 20, 2022 at 09:57:33AM +0200, Uwe Kleine-König wrote:
> > after Stephen signaled to accept the idea, this is a rework of v8[1] with
> > the following changes:
> > 
> >  - Drop the follow up conversions. I will resend them individually per
> >    subsystem once the preconditions from this v9 are in. I only kept one
> >    clk patch that will go in via the clk tree anyhow. I trimmed the Cc:
> >    list accordingly.
> > 
> >  - (trivially) rebased to v5.18-rc1
> > 
> >  - Introduce a new commit that first improves the documention of
> >    devm_clk_get() and devm_clk_get_optional() before (mostly)
> >    duplicating these for the new functions.
> > 
> >  - Make the new functions use a GPL export. (Note the existing functions
> >    use a plain export, I didn't change that.)
> > 
> >  - Drop a bogus empty line that was cut-n-pasted into several functions.
> > 
> > Thanks for feedback by Stephen and Jonathan.
> > 
> > @Russell: Stephen wrote in v8: "I'm largely waiting for Russell to ack
> > the clk.h change [...]". Would be great if you looked at the series and
> > tell us your thoughts.
> 
> That didn't happen :-\

Sorry, I missed this patch set. I haven't been reading lakml very much
for *all* of May - commitments have meant I haven't had very little
time to look at stuff on the mailing list, and due to the volume of
email, I don't do "catch up" anymore.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
