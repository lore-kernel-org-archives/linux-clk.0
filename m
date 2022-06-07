Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAA9C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Jun 2022 11:47:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242178AbiFGLrD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Jun 2022 07:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237015AbiFGLrB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jun 2022 07:47:01 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523B17C155
        for <linux-clk@vger.kernel.org>; Tue,  7 Jun 2022 04:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ru+AWndABYCCJiSHLvh18kLiPXnVewSrqSoG21D3HlI=; b=yW9J9YGBEXEIccSuf6yLq4Dif/
        /sHwVZWZbLZb88GjJj0OqzKwqN6F50TCc7/+C1r1j/gaB6kut5F2v1PRU+zOoi0sJTmmesZzCnssV
        NaDamW+Mi3KFfIwWIw2g9TrHpK3K0ZaN0cqRXu8fpWGeJUT3ms6+DXp8paOKOtQAIZqL6x37+j7sB
        +PPFCUBdhz8/sNG2KOwEJgNtJ4mHCwCy8dMwWxSami0UnnBhsTpPLFvxrkUqyIhESW/tBtfbwhSER
        BdBKjbJsEedatXfwzSF2ElugEmk7ALiQGcN4bIE4VC67bfR+zcwBjsshRqIf82Le0lrqI9pyiIl0P
        P/KzLL/w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60996)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1nyXfl-0003Lp-BZ; Tue, 07 Jun 2022 12:46:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1nyXfk-0000ln-K3; Tue, 07 Jun 2022 12:46:56 +0100
Date:   Tue, 7 Jun 2022 12:46:56 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: Re: [PATCH v9 1/4] clk: Improve documentation for devm_clk_get() and
 its optional variant
Message-ID: <Yp86sBjM2G7/pcQr@shell.armlinux.org.uk>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
 <20220520075737.758761-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520075737.758761-2-u.kleine-koenig@pengutronix.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 20, 2022 at 09:57:34AM +0200, Uwe Kleine-König wrote:
> Make use of "Context:" and "Return:". Mention that the clk is not to be
> expected to be prepared, previously only not being enabled was mentioned
> which probably dates from the times when the concept of clk preparation
> wasn't invented yet.
> 
> Also describe devm_clk_get_optional() fully instead of just referencing
> devm_clk_get().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
