Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF61C37120
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 19:59:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1651C20861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 19:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfAUT67 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 14:58:59 -0500
Received: from muru.com ([72.249.23.125]:34578 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727699AbfAUT67 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Jan 2019 14:58:59 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B5F1A80C0;
        Mon, 21 Jan 2019 19:59:06 +0000 (UTC)
Date:   Mon, 21 Jan 2019 11:58:56 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
Message-ID: <20190121195856.GI5544@atomide.com>
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
 <20190115182021.GH5544@atomide.com>
 <b7571829-fb5e-c2be-59d1-b08d73bfca6d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7571829-fb5e-c2be-59d1-b08d73bfca6d@ti.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190115 18:32]:
> On 15/01/2019 20:20, Tony Lindgren wrote:
> > * Tero Kristo <t-kristo@ti.com> [190115 09:15]:
> > > Hi Stephen,
> > > 
> > > As requested, this series gets rid of CLK_IS_BASIC flag usage from
> > > TI clock drivers.
> > > 
> > > Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a quick
> > > suspend/resume test on omap3/omap4/am5.
> > 
> > Does this also fix the issue Andreas was fixing earlier
> > or is this separate clean-up?
> 
> The series from Andreas would be needed on top of this.

OK so I acked Andreas' series, and here's an ack for
this series too:

Acked-by: Tony Lindgren <tony@atomide.com>
