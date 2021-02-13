Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C22C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 16:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F12964DD8
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 16:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhBMQyw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Feb 2021 11:54:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhBMQyv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 13 Feb 2021 11:54:51 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A85C061756
        for <linux-clk@vger.kernel.org>; Sat, 13 Feb 2021 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IJJOPOoZeFFUMQEChaBXB6jC3uzHLLCKx2lMhVud3/Y=; b=z1ksnSYKL7T8NMLK/XfVvE0t+
        cTWnbUvlNGxstLfQ4vYcy7bWZo/NSF9vGDyslXIrtAtItWe/LtKDXxeLxJMYwwTadIbJRwr6Vztzl
        m01tYM7z78VhuuTnmYB/lVhOlGWFK68JViRPL5YnOQkw+MDGad+cfy8VIndEkd5ONPpqp4HSRfanR
        pvmMBBOyR3qVQQjh8TAU4sKVCHejnN9bJWG5CcBpzh0hvJk/gXaHsGBusGouJXR0UDzZ1UJ3lSW7t
        Rf5S12iyLGHmXEPiyrXd64bbQPV02CZCmw+VWuTUYExMMwZgY/Slz5qSoyuSCf7EtzLGPePFQausw
        TyDPr3sjQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42944)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lAyBL-0008Mt-Du; Sat, 13 Feb 2021 16:54:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lAyBK-0008G6-F2; Sat, 13 Feb 2021 16:54:06 +0000
Date:   Sat, 13 Feb 2021 16:54:06 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     u.kleine-koenig@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Simon South <simon@simonsouth.net>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] clk: Warn when clk_get_rate is called for a disabled clk
Message-ID: <20210213165406.GQ1463@shell.armlinux.org.uk>
References: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de>
 <20210113083042.tezxr5sim2oevtvm@pengutronix.de>
 <161301324986.1254594.14610246660375821616@swboyd.mtv.corp.google.com>
 <20210211080509.5kl2u3ofdggyzuvj@pengutronix.de>
 <161317887654.1254594.6078241024095194891@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161317887654.1254594.6078241024095194891@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Feb 12, 2021 at 05:14:36PM -0800, Stephen Boyd wrote:
> Quoting Uwe (2021-02-11 00:05:09)
> > Hello Stephen,
> > 
> > On Wed, Feb 10, 2021 at 07:14:09PM -0800, Stephen Boyd wrote:
> > 
> > > What problem are you trying to address? Is there some issue you've
> > > encountered in the kernel that would have been fixed by having this
> > > warning?
> > 
> > The warning obviously doesn't fix anything. My eventual goal is to
> > answer the question in the initial mail in this thread. The motivating
> > situation is: Should I continue to tell patch authors who use
> > clk_get_rate() that they have to ensure that the given clk must be
> > enabled as the documentation suggests? And if yes: Can we please check
> > this automatically (e.g. with my patch or by returning 0 for a disabled
> > clk) and don't rely on human review to adhere to this rule.
> > 
> 
> I suggest to stop telling folks that they must enable the clk before
> getting the rate. The documentation says
> 
>  "This is only valid once the clock source has been enabled"
> 
> which is really ambiguous. What is "this?" supposed to be?

Please Cc me on CLK API matters, as per my entry in MAINTAINERS.

The subject is the clk_get_rate() function, and as it is in the
section describing that function, I don't see it is ambiguous.

From what I remember, the restriction came after some discussion,
and the problem that on some platforms, the clock tree would not
be known prior to the clock being enabled (at that time, which
was before the "prepare" stuff got added.) Consequently, because
the child/parent relationships were not known, and PLLs were not
initialised, the rate that a particular clock would be ticking
could be different before and after it being enabled.

For this reason, it was decided that the only sensible approach
was to declare that the return value of clk_get_rate() on a
disabled clock is undefined.

That said, finding the discussion is proving difficult, so I may
be misremembering.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
