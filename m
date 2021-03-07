Return-Path: <SRS0=MqlC=IF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77580C433DB
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FEAD650FA
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhCGO1c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 Mar 2021 09:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhCGO1Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 7 Mar 2021 09:27:24 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052E4C06174A;
        Sun,  7 Mar 2021 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dgk2TT8zHgouNvjrKFbTfdyEnkecxhQTuw7uuB9lEao=; b=o0JXEkFgHQ5q/pw27gQVjgq/p
        r0ry2Ju4yJGAqbRC5+Uu6gJZxDrdPqQ7N0ngZlwjs7a5FWzq6Rm5P2m64iMpcxT7AF0jztpCw6l/r
        UoDWRErdhsG8yt4dNaWMJPFxNqRlWM3tjUTFblq9+RekhrwueHXPbIblI7UKe+AvkDFsNtdpc7Llu
        pFUEyNkHle1YcSiFsvs0j3UPIj6naaykOzHYYn5zt0hV7lwztHDoVAtfzetLzykWYk+0UEFw0gGUv
        zKVs7q+v8zc1OrBNFEPYrz57zRgds8YRALZCSsyIClNmSM0xrpgmeacTlgo2C1W7W1tlb91gETHvx
        xyKv4GMUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49698)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lIuN6-0001F5-7j; Sun, 07 Mar 2021 14:27:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lIuN4-0006GV-A6; Sun, 07 Mar 2021 14:27:02 +0000
Date:   Sun, 7 Mar 2021 14:27:02 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Fix doc of clk_get_parent
Message-ID: <20210307142701.GD1463@shell.armlinux.org.uk>
References: <20210307140626.22699-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307140626.22699-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Mar 07, 2021 at 02:06:26PM +0000, Paul Cercueil wrote:
> On error, or when the passed parameter is NULL, the return value is NULL
> and not a PTR_ERR()-encoded value.

No, the documentation is accurate. The CCF is just an implementation
of the API, the file you are modifying is the definitive API
documentation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
