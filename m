Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C9FC43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 17:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59F9E206A3
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 17:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfDYR4x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 13:56:53 -0400
Received: from muru.com ([72.249.23.125]:47412 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbfDYR4x (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 13:56:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 29FCE8105;
        Thu, 25 Apr 2019 17:57:09 +0000 (UTC)
Date:   Thu, 25 Apr 2019 10:56:49 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com,
        Eric Ruei <e-ruei1@ti.com>
Subject: Re: [PATCH 5/6] clk: ti: am33xx: drop idlest polling from gfx
 clkctrl clock
Message-ID: <20190425175649.GE8007@atomide.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
 <1554365467-1325-6-git-send-email-t-kristo@ti.com>
 <20190404140635.GA49658@atomide.com>
 <0b729373-baa1-5258-064e-499b2f9ca807@ti.com>
 <155621466804.15276.12136205638146291136@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155621466804.15276.12136205638146291136@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [190425 17:51]:
> Quoting Tero Kristo (2019-04-07 22:45:08)
> > On 04/04/2019 17:06, Tony Lindgren wrote:
> > > * Tero Kristo <t-kristo@ti.com> [190404 08:12]:
> > >> From: Eric Ruei <e-ruei1@ti.com>
> > >>
> > >> The GFX modules on AM33xx SoCs have a hardreset line and are controlled
> > >> by a GFX reset line. Any clkctrl enable/disable operations cannot be
> > >> checked for module enabled/disabled status independent of the reset
> > >> operation, and this causes some unwanted timeouts in the kernel and
> > >> unbalanced states for the GFX clocks. These details should be handled
> > >> by the driver integration code itself.
> > > 
> > > These last two patches should no longer be needed with ti-sysc.
> > > Well, at least based on testing with the earlier reset-simple driver
> > > patch and a test for sgx register access on am335x.
> > > 
> > > On init we deassert rstctrl if configured and in reset, then enable
> > > clocks, and read the module revision. And the module is ready for child
> > > device driver(s) to probe, and do what they want with the rstctrl via a
> > > reset driver. If no child device driver(s) are configured, ti-sysc will
> > > just put the module rstctrl back to reset using reset driver.
> > 
> > Ok good to know, lets drop these patches for now and re-consider once we 
> > can try out graphics with latest kernel... unfortunately it is not 
> > available upstream.
> 
> Sooooo drop the last two patches and I should pick up the first four?

Yes please.

Regards,

Tony
