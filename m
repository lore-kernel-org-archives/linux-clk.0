Return-Path: <SRS0=IOJl=YR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2028CA9EAF
	for <linux-clk@archiver.kernel.org>; Thu, 24 Oct 2019 13:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD3242084C
	for <linux-clk@archiver.kernel.org>; Thu, 24 Oct 2019 13:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393659AbfJXNkE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Oct 2019 09:40:04 -0400
Received: from muru.com ([72.249.23.125]:39702 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393656AbfJXNkE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Oct 2019 09:40:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4739380C5;
        Thu, 24 Oct 2019 13:40:38 +0000 (UTC)
Date:   Thu, 24 Oct 2019 06:40:00 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org,
        aford173@gmail.com, tomi.valkeinen@ti.com
Subject: Re: [PATCH 0/4] clk: ti: re-work divider clock support
Message-ID: <20191024134000.GV5610@atomide.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
 <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191024 08:04]:
> On 02/10/2019 15:06, Tero Kristo wrote:
> > Hi,
> > 
> > The existing divider clock support appears to have an inherent bug
> > because of the bit field width implementation and limitation of divider
> > values based on this. The limitation by bit field only is not enough,
> > as we can have divider settings which accept only certain range of
> > dividers within the full range of the bit-field.
> > 
> > Because of this, the divider clock is re-implemented to use min,max,mask
> > values instead of just the bit-field.
> 
> Queued this up for 5.4 fixes, thanks.
> 
> Tony, do you have anything against the DT patch going in with the rest of
> this or should it be dropped?

No that won't cause merge conflicts so please merge the dts change
along with the rest of the series. So for the dts change:

Acked-by: Tony Lindgren <tony@atomide.com>
