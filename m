Return-Path: <SRS0=KID9=QW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6DEC43381
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 10:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA50B21924
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 10:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393896AbfBOKcu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Feb 2019 05:32:50 -0500
Received: from gloria.sntech.de ([185.11.138.130]:60684 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393317AbfBOKcu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Feb 2019 05:32:50 -0500
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1guanW-0000V3-43; Fri, 15 Feb 2019 11:32:46 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip clock updates for 5.1
Date:   Fri, 15 Feb 2019 11:32:45 +0100
Message-ID: <2268273.zyHXOlfcUi@diego>
In-Reply-To: <154940450309.169292.16565688865245958654@swboyd.mtv.corp.google.com>
References: <48408534.cOKhDiQbmB@phil> <154940450309.169292.16565688865245958654@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Dienstag, 5. Februar 2019, 23:08:23 CET schrieb Stephen Boyd:
> Quoting Heiko Stuebner (2019-02-01 03:17:47)
> 
> > Hi Mike, Stephen,
> > 
> > looks I can re-use my introduction from 4.20 and 5.0 - no big changes
> > again this time.
> > 
> > A rate_parent flag and some fixup for the fractional part of a PLL
> > 
> > So please pull.
> 
> Thanks. Pulled into clk-next. If you like I can pick patches directly
> from list if you send out a reviewed-by tag on the patches. I'm happy
> either way.

It's hard to determine that before each cycle :-) .

The upside right now is, that handling clock-ids gets very easy.
Shared branches between trees for dt-binding ids are not favored,
instead the way to go seems to be doing numbers first and replacing
them in the next cycle when the ids got merged.

Right now I'm also in control of the shared id-branch, merging it myself
into both clock and dts branches, which somehow seems to still be ok,
and hence I save a bit of work :-D .

But of course we can merge the real easy things directly into the clock
tree ... I'll keep that in mind for the next clock patches.


Heiko


