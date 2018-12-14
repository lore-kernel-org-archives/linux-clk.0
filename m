Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421DCC65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 03:20:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFE4420870
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 03:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544757633;
	bh=aCCCAYs8y/8FQyTryYtQNgvYdyv1NUjaVmpTVbHW8+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EvTEasZXS4pSZKU4JZXAUa0FbxeQltohYxdruwU17IKKuWdaUDJ96JK4u/BCj9PTY
	 Kmsp2yia9C/I58s+qJXI+0DMa5k8C+JiklFVCA3JFGhB1UxxK7M5gC+iy5z/2mtg3t
	 huyAaCZitvKAoDXAZF2BJ3zD7gC4Uc4G44oBv+/Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE4420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbeLNDUc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 22:20:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:35556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725949AbeLNDUc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 22:20:32 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 784CA2054F;
        Fri, 14 Dec 2018 03:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544757631;
        bh=aCCCAYs8y/8FQyTryYtQNgvYdyv1NUjaVmpTVbHW8+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R/hUj4q5LaFs7+3SGh/RrABccuOwBWmZu9m57y1HAybA1uy/1qQ0c+o0Hyj5V6Bqf
         XksJezj3VP9JEw0ZW0+gaOjq3lX6CWsDnE0MbvwbBmSt4FtqhvO14kPa58yWl3a1Ge
         RYHtN4TrKj8uX+UxaLfmOomvGU4JIcjdiFp5VfMM=
Date:   Fri, 14 Dec 2018 11:19:32 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
Message-ID: <20181214031931.GD13243@dragon>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
 <20181214020533.GC13243@dragon>
 <AM0PR04MB42114ACB1A55BB42D2C5523280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42114ACB1A55BB42D2C5523280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 14, 2018 at 02:17:04AM +0000, Aisheng Dong wrote:
> [...]
> > > Note: It depends on SCU driver which has already been merged by Shawn.
> > > So this patch series could go through Shawn's tree as well.
> > 
> > To be clear, I'm not going to take this via my tree, and it definitely needs to go
> > through clk tree.  If there is a dependency on my tree, you will likely need to
> > wait for the dependency to land on mainline and then retry.
> > 
> 
> Sorry, I should have corrected that comment.
> It's not depend on SCU driver which is already in the Stephen's tree.
> It actually depends on the resource ID definitions[1] and the centralized PM
> related service definitions headifle in in power domain series which is already
> in your tree.
> 
> 1. https://patchwork.kernel.org/patch/10664125/
> 2. https://patchwork.kernel.org/patch/10664137/
> 
> [2] can be fixed by defining them in clock driver.
> But [1] seems can't be fixed as resource ID is shared by power domain
> and possible many other SCU client drivers.
> 
> Any suggestion?

After [1] and [2] land on v4.21-rc1, you rebase the series on that.  The
dependency will be gone, right?  This is what I suggested above.

Shawn
