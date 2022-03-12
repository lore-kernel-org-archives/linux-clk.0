Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF606C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 07:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiCLH7N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Mar 2022 02:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiCLH7M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2022 02:59:12 -0500
X-Greylist: delayed 326 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Mar 2022 23:58:07 PST
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8947D10B0
        for <linux-clk@vger.kernel.org>; Fri, 11 Mar 2022 23:58:05 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A5F9380B3;
        Sat, 12 Mar 2022 07:51:08 +0000 (UTC)
Date:   Sat, 12 Mar 2022 09:52:36 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Drop TI compatibility clocks
Message-ID: <YixRREMd+t1tbbwC@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com>
 <20220311033617.5712AC340EE@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311033617.5712AC340EE@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [220311 03:34]:
> Quoting Tony Lindgren (2022-02-03 00:56:15)
> > Hi all,
> > 
> > In order to prepare the TI clocks for fixing lots of devicetree warnings,
> > let's first drop the now unused compatibility clocks.
> > 
> > The dra7 changes depend on my still pending omap-for-v5.17/fixes-not-urgent
> > pull request that did not make it for v5.17-rc series so far.
> > 
> 
> What should I do with this one though?

Well the dependencies are now merged to the mainline kernel, so you could
merge in commit 31aa7056bbec, then apply this series if otherwise OK.

Commit 31aa7056bbec is based on the old v5.16-rc1. It would bring few other
fixes from mainline too if pulled on a v5.17-rc1 based branch:

31aa7056bbec ("ARM: dts: Don't use legacy clock defines for dra7 clkctrl")
9206a3af4fc0 ("clk: ti: Move dra7 clock devices out of the legacy section")
23885389dbbb ("ARM: dts: Fix timer regression for beagleboard revision c")
29a5e8496b3a ("ARM: dts: am335x-wega: Fix typo in mcasp property rx-num-evt")
34596ba380b0 ("ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of")
80c469a0a037 ("ARM: OMAP2+: hwmod: Add of_node_put() before break")

Regards,

Tony
