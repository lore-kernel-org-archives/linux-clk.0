Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51BFC10F11
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 03:03:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACB6F217F4
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 03:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbfDKDDc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Apr 2019 23:03:32 -0400
Received: from 178.115.242.59.static.drei.at ([178.115.242.59]:38172 "EHLO
        mail.osadl.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726106AbfDKDDc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Apr 2019 23:03:32 -0400
X-Greylist: delayed 403 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Apr 2019 23:03:31 EDT
Received: by mail.osadl.at (Postfix, from userid 1001)
        id AA7C95C2DC5; Thu, 11 Apr 2019 04:56:02 +0200 (CEST)
Date:   Thu, 11 Apr 2019 04:56:02 +0200
From:   Nicholas Mc Guire <der.herr@hofr.at>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Nicholas Mc Guire <hofrat@opentech.at>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] clk: ux500: add range to usleep_range
Message-ID: <20190411025602.GB5487@osadl.at>
References: <1554606804-29453-1-git-send-email-hofrat@opentech.at>
 <155493683173.20095.12913107010666279046@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155493683173.20095.12913107010666279046@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 10, 2019 at 03:53:51PM -0700, Stephen Boyd wrote:
> Quoting Nicholas Mc Guire (2019-04-06 20:13:24)
> > Providing a range for usleep_range() allows the hrtimer subsystem to
> > coalesce timers - the delay is runtime configurable so a factor 2
> > is taken to provide the range.
> > 
> > Signed-off-by: Nicholas Mc Guire <hofrat@opentech.at>
> > ---
> 
> I think this driver is in maintenance mode. I'll wait for Ulf to ack or
> review this change before applying.
> 
> > diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
> > index 7c0403b..a1fa3fb 100644
> > --- a/drivers/clk/ux500/clk-sysctrl.c
> > +++ b/drivers/clk/ux500/clk-sysctrl.c
> > @@ -42,7 +42,7 @@ static int clk_sysctrl_prepare(struct clk_hw *hw)
> >                                 clk->reg_bits[0]);
> >  
> >         if (!ret && clk->enable_delay_us)
> > -               usleep_range(clk->enable_delay_us, clk->enable_delay_us);
> > +               usleep_range(clk->enable_delay_us, clk->enable_delay_us*2);
> 
> Please add space around that multiply.
>
I can do that but it does not seem common and also checkpatch
did not complain about this - now a simple grep -re "\*10" on the
kernel shows that it seems more common not to use spaces around *
that to use them. Greping specifically for cases using usleep_range()
(not that many) it seems more or less evenly devided between space
and no space - so the concern is overlooking that factor 2 ?

thx!
hofrat 
