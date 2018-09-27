Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214D3C43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 14:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D587E216C4
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 14:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D587E216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbeI0VI3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 17:08:29 -0400
Received: from muru.com ([72.249.23.125]:57438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727270AbeI0VI3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Sep 2018 17:08:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4E71E809B;
        Thu, 27 Sep 2018 14:54:14 +0000 (UTC)
Date:   Thu, 27 Sep 2018 07:49:49 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/11] clk: ti: clkctrl data split based on clkdm
 boundaries
Message-ID: <20180927144949.GZ5662@atomide.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <20180904153657.GB5662@atomide.com>
 <20180926191301.GX5662@atomide.com>
 <e4e90740-393f-edaf-947c-aa1010ab79a3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4e90740-393f-edaf-947c-aa1010ab79a3@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927144949.kXFMZgDx9yrHIM4GINMQeNh09n0kBwfGi3J77rGwt8Q@z>

* Tero Kristo <t-kristo@ti.com> [180927 06:35]:
> On 26/09/18 22:13, Tony Lindgren wrote:
> > Hi,
> > 
> > * Tony Lindgren <tony@atomide.com> [180904 15:41]:
> > > * Tero Kristo <t-kristo@ti.com> [180831 15:11]:
> > > > Hi,
> > > > 
> > > > This series splits up the clkctrl data for TI SoCs based on clockdomain
> > > > boundaries, instead of the current CM boundaries. For rest of the SoCs,
> > > > the CM boundaries are actually the same as clockdomains, only am3/am4/dra7
> > > > are mutants.
> > > > 
> > > > This is done in preparation for better supporting Tony's upcoming
> > > > interconnect driver data introduction for these SoCs.
> > > > 
> > > > One thing to note is that we maintain backwards compatibility with this
> > > > series, the compat data is introduced temporarily for this purpose. The
> > > > compat data can be ditched after couple of release cycles when nobody
> > > > needs it anymore.
> > > > 
> > > > The series can be applied independently, as the compat data support
> > > > makes care that the switch is only done once DT changes are in place.
> > > 
> > > When this is ready for merging, can you guys please set up an
> > > immutable branch against v4.19-rc1 with the drivers/clk changes
> > > for me to merge in too?
> > > 
> > > I've tested this on am335x and am437x so far and it works fine
> > > for me, so for the whole series:
> > > 
> > > Tested-by: Tony Lindgren <tony@atomide.com>
> > 
> > Any news on getting this into Linux next and merged? The
> > immutable is still needed too for the dts changes.
> > 
> 
> This is currently blocked from my side, as the patch [1] from Johan got in
> clk-next is conflicting with my series. Asked Stephen for either dropping
> that patch and letting me pick it up but no response so far.
> 
> [1] https://lkml.org/lkml/2018/8/22/160

Hmm well the idea is to not redo branches. So how about
send Stephen a pull request against Johan's patch commit
00a461cc32ec ("clk: ti: fix OF child-node lookup")?

That is assuming 00a461cc32ec is considered immutable and
OK to use as a base by Stephen? :)

And assuming that your pull request gets merged, and we
all consider that branch immutable too, then I can merge it
in too for the dts changes. It will bring also Rob's
clean-up patch 00a461cc32ec ("clk: ti: fix OF child-node
lookup") too but that's just fine.

Regards,

Tony
