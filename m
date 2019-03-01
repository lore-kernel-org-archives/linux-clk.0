Return-Path: <SRS0=/2Yr=RE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E81C43381
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 02:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51C95218AE
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 02:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551405732;
	bh=aTawqqY5m8WL4XRiBQnQvI1Mo94xSDN6CSPXhkH3uMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qyRoZz6T2Ndt3NSxnvA1EPEr8kFcSnSvdgvNERMDr3gfIqb/VU/CTiAyMpB3GXezq
	 QApoFP8uCsgaDmogCSy07kg+BClyFAbMV/t3oALloFba3olPkPKN/g3IB+ENu1QJ9N
	 FoHVKx18ZGolMlCUvD9FoNl4Fxc6XAuoyY9lBfbs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfCACCM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 21:02:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:56082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727545AbfCACCL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Feb 2019 21:02:11 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F29720842;
        Fri,  1 Mar 2019 02:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551405730;
        bh=aTawqqY5m8WL4XRiBQnQvI1Mo94xSDN6CSPXhkH3uMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rsc9/kkhxAgMG8hiCaJv8WTvjZHwcuGBAoSblu2MEJNs3avaj6petUU3JGKPYC1ZV
         SkAiSFQHSQYVtCjUqPTU+DRwf4TAqMsnBwAEGgVV/0kNxCzv/x1G7esr6bbg/Szqtz
         jlXQN86S4ovAtNt7DLhPMe10Q0nM9VXbUgIOrGfE=
Date:   Fri, 1 Mar 2019 10:01:14 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abel.vesa@nxp.com>, Bai Ping <ping.bai@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Message-ID: <20190301020112.GJ26041@dragon>
References: <20190131002056.12024-1-festevam@gmail.com>
 <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
 <20190228021509.GA26041@dragon>
 <155137845776.260864.1239841948290211643@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155137845776.260864.1239841948290211643@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 28, 2019 at 10:27:37AM -0800, Stephen Boyd wrote:
> Quoting Shawn Guo (2019-02-27 18:15:12)
> > On Thu, Feb 21, 2019 at 12:36:44PM -0800, Stephen Boyd wrote:
> > > Quoting Fabio Estevam (2019-01-30 16:20:56)
> > > > Add the entry for the CLKO1 clock.
> > > > 
> > > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > > ---
> > > 
> > > Applied to clk-next but I had to fix the whole DT binding number because
> > > I don't know what this patch is based on. In fact, please get everyone
> > > involved at NXP and whoever else is working on i.MX clk drivers to
> > > coordinate somehow. I just spent 20 minutes working through the set of
> > > imx patches in my inbox and I see approximately 6 different authors all
> > > sending out a few clks at a time for the same drivers with zero
> > > information about what the patches are based on or what order they're
> > > supposed to be applied in.
> > > 
> > > If someone wants to collect all the patches and indicate on the list
> > > they've picked them up and will be sending them as a pull request that's
> > > fine.
> > 
> > I will help collect the i.MX platform clock patches and send you as
> > pull request.
> > 
> 
> Ok. Thanks for the heads up. I don't expect anything for the 5.1 merge
> window that should open next week, but for the next cycle I'll be on the
> lookout for the pull request.

Yeah.  Sorry for being unclear.  I meant to start from next development
cycle.

Shawn
