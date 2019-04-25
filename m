Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897ECC43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 14:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AA012077C
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 14:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfDYOXK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:23:10 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34233 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfDYOXJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Apr 2019 10:23:09 -0400
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DD2F3C000D;
        Thu, 25 Apr 2019 14:23:06 +0000 (UTC)
Date:   Thu, 25 Apr 2019 16:23:06 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner clock changes for 5.2
Message-ID: <20190425142306.k5lh6x5pubv5fl4w@flea>
References: <20190419112518.5zwaeqg7egfimts7@flea>
 <155570516391.15276.12155157680991893525@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155570516391.15276.12155157680991893525@swboyd.mtv.corp.google.com>
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Apr 19, 2019 at 01:19:23PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2019-04-19 04:25:18)
> > Hi Mike, Stephen,
> >
> > Please pull the following changes for the next merge window.
> >
> > Thanks!
> > Maxime
> >
> > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> >
> >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-5.2
>
> Thanks. Pulled but not yet merged into clk-next, because I see this error
> when I try to build just the files that have changed:
>
> 	WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
> 	  Depends on [n]: HAS_IOMEM [=y] && ARCH_SUNXI
> 	  Selected by [y]:
> 	  - CLK_SUNXI_PRCM_SUN6I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
> 	  - CLK_SUNXI_PRCM_SUN8I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>
> 	WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
> 	  Depends on [n]: HAS_IOMEM [=y] && ARCH_SUNXI
> 	  Selected by [y]:
> 	  - CLK_SUNXI_PRCM_SUN6I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
> 	  - CLK_SUNXI_PRCM_SUN8I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>
> Maybe the Kconfig patch isn't completely proper. I suppose that
> MFD_SUN6I_PRCM can be selected via COMPILE_TEST=y path of
> CLK_SUNXI_PRCM_SUN6I and then fail to enable because ARCH_SUNXI=n.

There's a fix for that that went through the MFD tree in 5.1-rc4

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
