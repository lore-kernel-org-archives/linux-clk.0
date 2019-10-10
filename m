Return-Path: <SRS0=IP4j=YD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F077DC4360C
	for <linux-clk@archiver.kernel.org>; Thu, 10 Oct 2019 14:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CEC11208C3
	for <linux-clk@archiver.kernel.org>; Thu, 10 Oct 2019 14:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfJJOfZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Oct 2019 10:35:25 -0400
Received: from muru.com ([72.249.23.125]:36948 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbfJJOfZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Oct 2019 10:35:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8AE6880BB;
        Thu, 10 Oct 2019 14:35:58 +0000 (UTC)
Date:   Thu, 10 Oct 2019 07:35:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, s-anna@ti.com
Subject: Re: [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
Message-ID: <20191010143521.GX5610@atomide.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
 <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191010 08:34]:
> On 12/09/2019 16:26, Tero Kristo wrote:
> > Hi,
> > 
> > V3 of this series sort of reverted back to pretty much V1 which expects
> > strict sequencing of events from the bus driver. This one doesn't have
> > any dependency towards the reset driver either, and the controversial
> > reset handling APIs have been removed.
> > 
> > -Tero
> 
> Stephen, any comments on this one or shall I just craft a pull-request for
> this and rest of the TI clock driver changes towards 5.5? There seems to be
> a pile of them coming this time over...

Sounds like we need an immutable branch for the clkctrl related
changes against v5.4-rc1 that I can also merge into omap-for-v5.5/prm
branch in addition to the immutable prm reset driver branch.

Otherwise I can't apply any of the consumer device related dts
changes into that branch AFAIK.

Regards,

Tony
