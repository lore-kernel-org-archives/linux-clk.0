Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1076C61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Feb 2023 15:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjBIP5Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Feb 2023 10:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBIP5Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Feb 2023 10:57:24 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B175B752
        for <linux-clk@vger.kernel.org>; Thu,  9 Feb 2023 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=iSqOzdJJ0FYbR5JO2Yqp/mGJlYxdV5XSTAO49T8KKvg=; b=xqCbfU9/JD8ghPUy2dK/FlG9zW
        eAFL4SK58IhoZH56DNYvDjl26UkUFJyTEIYgT3k5ulrV3+j0bcPqSFBB6KSeiXQ5g15Uhbn4WIO0w
        wTcNeriZYQ31CIJv7IsPy5Egc9FGpuL4qw/lMAvP0Ne22GpWk2JcNKSnlRMlRXv1WykgS6/TL/nGc
        Nghr8kopLU+mVT1YeawKymZ9OqAhvmLLJ5v34oyz6KPRxUhjnwFR+4zm36uAlORLlT5A0BjOFRuZI
        bMzAopZDJH6j8b3RZUOf1gOLQYxPTE4mDgHY9WgI3rcKhQbY39WDmixWhGkfaGgZac5EhWOl0A5oj
        dI+T5bng==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36478)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1pQ9IT-00083h-0j; Thu, 09 Feb 2023 15:57:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1pQ9IR-0004i8-29; Thu, 09 Feb 2023 15:57:15 +0000
Date:   Thu, 9 Feb 2023 15:57:15 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        kernel@pengutronix.de, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Disambiguate comment about clk_get_rate() for
 disabled clocks
Message-ID: <Y+UX2ysd1B5/cHpk@shell.armlinux.org.uk>
References: <20230201082309.233348-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230201082309.233348-1-u.kleine-koenig@pengutronix.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 01, 2023 at 09:23:09AM +0100, Uwe Kleine-König wrote:
> The sentence "[clk_get_rate()] is only valid once the clock source has
> been enabled." can be understood in two ways:
> 
> a) When called for a disabled clock the return value might be wrong; or
> b) The disabled clock must be enabled before it runs at the returned
> rate.
> 
> It's hard to find evidence what is actually meant, but given that the
> clock tree can change between the call to clk_get_rate() and the return
> of a later clk_enable() call, it's prudent to assume a).
> 
> Adapt the comment accordingly to be unambiguous.

Sorry for the late reply, I've been suffering with Covid for the last
nine days.

From the API perspective, it's both. Essentially, if the clock isn't
enabled, then the return value is completely undefined by the API and
no one should trust it.

It's one of the reasons why:

	clk_set_rate(clk, r);
	v = clk_get_rate(clk);

should not be used when what is actually required is:

	v = clk_round_rate(clk, r);

	...

	clk_set_rate(clk, r);

Note: r to clk_set_rate() not v.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
