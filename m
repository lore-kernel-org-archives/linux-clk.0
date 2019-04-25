Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C86C4321A
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACAA52088F
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556207741;
	bh=Sj9zca4x76PQUiKMnQqwT2iM0s9f8yvgaZ0yIoQLcDg=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=B5JHpsqa3CkZd+zKATVRs8pBWT+sdgvDAbHlZ5Auz3xxotSvXSMIY2T44bpGMvC7s
	 BG3pYLbUhwljWEPQupg2DnrEOkA7zHwQaplqUabhEhtx9840og+5nEUZ8tdzW525fa
	 UgWrUcieB0rksLgqSGcP5XFTZIJxHEE4fzDJnSFc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfDYPzk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:55:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727137AbfDYPzk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 11:55:40 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B9E12067D;
        Thu, 25 Apr 2019 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556207740;
        bh=Sj9zca4x76PQUiKMnQqwT2iM0s9f8yvgaZ0yIoQLcDg=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=VtmLwKhLGohXUfzRUPqmq+sLsSr5vXqh6VjyN1vWDuWyDL8ez38rJBEubi+OrupBK
         vK35uEFKdpOscHhJbAZJ1B+LFSso1wNv4mXjcvTlhwOGLuZnoDRmSZyFJnSHlmzuaP
         rD9ecu4GCgRHSQ5DOjfb2tla3kBaJ6qisZdVsKc8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190425142306.k5lh6x5pubv5fl4w@flea>
References: <20190419112518.5zwaeqg7egfimts7@flea> <155570516391.15276.12155157680991893525@swboyd.mtv.corp.google.com> <20190425142306.k5lh6x5pubv5fl4w@flea>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Allwinner clock changes for 5.2
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <155620773926.15276.12796358613328884337@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 08:55:39 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-04-25 07:23:06)
> Hi,
>=20
> On Fri, Apr 19, 2019 at 01:19:23PM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2019-04-19 04:25:18)
> > > Hi Mike, Stephen,
> > >
> > > Please pull the following changes for the next merge window.
> > >
> > > Thanks!
> > > Maxime
> > >
> > > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69ddd=
aa231b:
> > >
> > >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tag=
s/sunxi-clk-for-5.2
> >
> > Thanks. Pulled but not yet merged into clk-next, because I see this err=
or
> > when I try to build just the files that have changed:
> >
> >       WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
> >         Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
> >         Selected by [y]:
> >         - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI=
 [=3Dy]
> >         - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI=
 [=3Dy]
> >
> >       WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
> >         Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
> >         Selected by [y]:
> >         - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI=
 [=3Dy]
> >         - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI=
 [=3Dy]
> >
> > Maybe the Kconfig patch isn't completely proper. I suppose that
> > MFD_SUN6I_PRCM can be selected via COMPILE_TEST=3Dy path of
> > CLK_SUNXI_PRCM_SUN6I and then fail to enable because ARCH_SUNXI=3Dn.
>=20
> There's a fix for that that went through the MFD tree in 5.1-rc4
>=20

Ok. I suppose it's easiest to ignore this problem then and merge up
these changes into -next. Thanks!

