Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32E6C67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 03:57:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 832D320879
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 03:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544759828;
	bh=Dq9naHHMhruE6QJzGF+MrbrZJN05iqujzsiSxbMqiUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1Z2rqb7xmwZOMKONlmoeuRXgwDGITvrTeGFLho0V3gWQtQa93cvhQNFIq7hNwIDCt
	 o2EyuSTwqpG0UkpFwtxDuIJP26KXy670MT/7cTiBh0eyLZd694JP0jZHLh7RmYdQD8
	 Ped/8z+lKljUYQAP2ZBy22sOsJ6ETmGljwTJITmI=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 832D320879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbeLND5I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 22:57:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:59488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbeLND5I (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 22:57:08 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D74C2086D;
        Fri, 14 Dec 2018 03:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544759827;
        bh=Dq9naHHMhruE6QJzGF+MrbrZJN05iqujzsiSxbMqiUU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t/3SxZ73LvmPvFkW48vLF50U82pzIDfU50r/hG9LSsdoGSfZU1ffwvLNH4T5z1G+G
         JQsDRMJViJ1dihykSvwryjJy8b58Ux72iok5DBQ2lbiQeeOdjmCqyG8GdXAWdCsItA
         d5Iq9dTPOvNFlmGYFgXR6oIucZd99Qw9nKkgUeOA=
Date:   Fri, 14 Dec 2018 11:56:07 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
Message-ID: <20181214035606.GE13243@dragon>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
 <20181214020533.GC13243@dragon>
 <AM0PR04MB42114ACB1A55BB42D2C5523280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214031931.GD13243@dragon>
 <AM0PR04MB4211D692CBED348EF8C109A180A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4211D692CBED348EF8C109A180A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 14, 2018 at 03:37:47AM +0000, Aisheng Dong wrote:
> > -----Original Message-----
> > From: Shawn Guo [mailto:shawnguo@kernel.org]
> > On Fri, Dec 14, 2018 at 02:17:04AM +0000, Aisheng Dong wrote:
> > > [...]
> > > > > Note: It depends on SCU driver which has already been merged by
> > Shawn.
> > > > > So this patch series could go through Shawn's tree as well.
> > > >
> > > > To be clear, I'm not going to take this via my tree, and it
> > > > definitely needs to go through clk tree.  If there is a dependency
> > > > on my tree, you will likely need to wait for the dependency to land on
> > mainline and then retry.
> > > >
> > >
> > > Sorry, I should have corrected that comment.
> > > It's not depend on SCU driver which is already in the Stephen's tree.
> > > It actually depends on the resource ID definitions[1] and the
> > > centralized PM related service definitions headifle in in power domain
> > > series which is already in your tree.
> > >
> > > [2] can be fixed by defining them in clock driver.
> > > But [1] seems can't be fixed as resource ID is shared by power domain
> > > and possible many other SCU client drivers.
> > >
> > > Any suggestion?
> > 
> > After [1] and [2] land on v4.21-rc1, you rebase the series on that.  The
> > dependency will be gone, right?  This is what I suggested above.
> > 
> 
> Okay, that may need a few more weeks.
> BTW, after v4.21-rc1 is out, can the mx8qxp CLK and DTS hit the final v4.21 release?
> As I understand, usually we don't receive new feature patch after the first RC,
> right?

Yes, they will have to land on 4.22 then.

Shawn
