Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC258C282DF
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 19:04:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A85FD2064A
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555700656;
	bh=Lo9Xdb1cakex+xbkyV7puFkwNq0FB2NuKClxKCM1Mvs=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=Q9rMrMLPatAAMDp64ANmLiL9XkDoKEPX4MKQfzGZ/ltT8ZM9F+mcFxYAPPAZrdgRj
	 qv9f2Unu9aLmU1PQoW/Hh0lET6sx1g4Qk7w1BcG2oqgKYXUGwjbSfwU1BSiuS2JDVu
	 QqJMPkrciYYriiIUXwQo42SH0mLtQFLv2F7sjvH4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfDSTEP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:04:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727265AbfDSTEO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 15:04:14 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B77F222D1;
        Fri, 19 Apr 2019 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555692236;
        bh=Lo9Xdb1cakex+xbkyV7puFkwNq0FB2NuKClxKCM1Mvs=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=UrpN/LSKlNxIktxCgRQoUTPvAaNyjuU/jkw6iQkNKmEKMn84ZiuFL6x1VBJPg3JHT
         OuL1+e116n7qJeRhOL+0UluAwlPcqo/ASGrgQN4qaQuomRuiB5bJ8JP6MdP1Zc/yZc
         8tpP9uiBAJlEhEHslRS214mOblpRFYcr9dHdqvhY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOiHx==Aps2WKU5zCu4L4y+MUwCyrNr9xJ4rC5GQg=T47Jn1RA@mail.gmail.com>
References: <201904190740.Fs1CMC0M%lkp@intel.com> <CAOiHx==Aps2WKU5zCu4L4y+MUwCyrNr9xJ4rC5GQg=T47Jn1RA@mail.gmail.com>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [clk:clk-remove-io.h 8/9] drivers/clk//renesas/r7s9210-cpg-mssr.c:122:10: error: implicit declaration of function 'clk_readl'; did you mean '__readl'?
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        kbuild test robot <lkp@intel.com>
Message-ID: <155569223573.15276.16410564274197593263@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 19 Apr 2019 09:43:55 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-19 03:17:10)
> On Fri, 19 Apr 2019 at 01:52, kbuild test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git c=
lk-remove-io.h
> > head:   91c16d737801d56e258b72c9d71f79c42c613919
> > commit: f1df560411dd2c32ce1bd1b9d3a90a8d8ae9be9c [8/9] clk: core: repla=
ce clk_{readl,writel} with {readl,writel}
> > config: x86_64-allmodconfig (attached as .config)
> > compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> > reproduce:
> >         git checkout f1df560411dd2c32ce1bd1b9d3a90a8d8ae9be9c
> >         # save the attached .config to linux build tree
> >         make ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/clk//renesas/r7s9210-cpg-mssr.c: In function 'r7s9210_update=
_clk_table':
> > >> drivers/clk//renesas/r7s9210-cpg-mssr.c:122:10: error: implicit decl=
aration of function 'clk_readl'; did you mean '__readl'? [-Werror=3Dimplici=
t-function-declaration]
> >      frqcr =3D clk_readl(base + CPG_FRQCR) & 0xFFF;
> >              ^~~~~~~~~
> >              __readl
> >    cc1: some warnings being treated as errors
> >
> > sparse warnings: (new ones prefixed by >>)
> >
> >    drivers/clk/renesas/r7s9210-cpg-mssr.c:122:17: sparse: undefined ide=
ntifier 'clk_readl'
> > >> drivers/clk/renesas/r7s9210-cpg-mssr.c:122:26: sparse: call with no =
type!
>=20
> That wasn't me! ;-)
>=20
> Looks like r7s9210-cpg-mssr was switched to readl() independently
> about a month ago with 9c561be8d8f2e01afaa9657051fc22e1e68f1914 which
> seems to be only in clk-next yet.
>=20
> Nice catch with the include cleanup, I always forget those.
>=20

I'll squash in a change so that clk_readl() can be removed on both sides
of the merge. I guess the patches were based against linux-next?

