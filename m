Return-Path: <SRS0=YnN3=ZA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7DAFC6196
	for <linux-clk@archiver.kernel.org>; Fri,  8 Nov 2019 17:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BDAF2245C
	for <linux-clk@archiver.kernel.org>; Fri,  8 Nov 2019 17:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbfKHRBv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Nov 2019 12:01:51 -0500
Received: from muru.com ([72.249.23.125]:40924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727654AbfKHRBu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 12:01:50 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 95C9780D4;
        Fri,  8 Nov 2019 17:02:26 +0000 (UTC)
Date:   Fri, 8 Nov 2019 09:01:47 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [GIT PULL] clk: ti: changes for 5.5 (take 2)
Message-ID: <20191108170147.GH5610@atomide.com>
References: <2e823d30-ce52-1275-c958-6b82666dc46f@ti.com>
 <20191106223026.BFE86214D8@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106223026.BFE86214D8@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [191106 22:31]:
> Quoting Tero Kristo (2019-11-04 23:20:31)
> > Hi Stephen,
> > 
> > This is a 2nd try of the TI clock changes towards 5.5. I added the 
> > divider clock revamp into this pull, and also fixed the one commend you 
> > had on the remoteproc support series.
> > 
> > Tony, this is also available as a branch as for-5.5-ti-clk-v2.
> > 
> > -Tero
> > 
> > ---
> 
> Thanks. Pulled into clk-next

Thanks. Tero, as we're already at -rc6, I'll wait on the device dts
patches that depend on this and the reset control until after v5.5-rc1.

Regards,

Tony
