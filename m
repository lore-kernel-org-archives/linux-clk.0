Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812C9C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 17:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52BC620C01
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551114756;
	bh=hqe0aItIdgi0W1Z9eEuQrFRkiC5PF1zEiuQ45Zpxg1E=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=ei/Wfnhvnk+qgoBTXScLr/GwyhCXqpKtvMVQm0b0vydm58fyV8F2KQIAqpzxBgoLk
	 3f3vIbStPnxF/K2V7BkFibah2LxvejdQW546u2plZnhLHhhI/N6YuVOQfYE+L/O5H/
	 +SI2wBIJ9QrMO4lZGWwbZKLspsTSIZK0ZETIEhC4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbfBYRMf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 12:12:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:34582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728314AbfBYRMf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Feb 2019 12:12:35 -0500
Received: from localhost (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A007920684;
        Mon, 25 Feb 2019 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551114754;
        bh=hqe0aItIdgi0W1Z9eEuQrFRkiC5PF1zEiuQ45Zpxg1E=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=r6J0IW6kffIjj1r7rDCQyuJW6QA/ZDo1LeQLskw2okxA2eDTexkYtT85gNegQ2Kdn
         x8IGmPSEtvu2VATYCE7S7S8f8sUMgeK3+C1P1eLZFzds+xZY07/Ci6tgphefsYHYfh
         eOuyAQUYnhXT85tKKcB9iJ1YPCk/LLCuDTb5FoJc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
Message-ID: <155111475379.77512.6004310681803541628@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com> <155086505454.77512.10530464362384162696@swboyd.mtv.corp.google.com> <5e6295e2-6916-5ffb-e9e9-c0fa4ed29aa5@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <5e6295e2-6916-5ffb-e9e9-c0fa4ed29aa5@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Cc:     linux-omap@vger.kernel.org, tony@atomide.com
Date:   Mon, 25 Feb 2019 09:12:33 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-02-24 23:18:57)
> On 22/02/2019 21:50, Stephen Boyd wrote:
> > Quoting Tero Kristo (2019-01-15 01:15:11)
> >> Hi Stephen,
> >>
> >> As requested, this series gets rid of CLK_IS_BASIC flag usage from
> >> TI clock drivers.
> >>
> >> Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a qui=
ck
> >> suspend/resume test on omap3/omap4/am5.
> >>
> >=20
> > I'm looking at clk-next now that this is all merged in and I still see
> > one usage of CLK_IS_BASIC in the omap2 hwmod code.
> >=20
> > arch/arm/mach-omap2/omap_hwmod.c:               if (__clk_get_flags(oh-=
>_clk) & CLK_IS_BASIC)
> >=20
> > Can that also be removed? If not, what clk types are on this platform?
> > Maybe I can remove CLK_IS_BASIC from every clk type except for the ones
> > that this code is checking for.
> >=20
>=20
> Hmm, I missed this in my update, only looked at the drivers/clk/ti=20
> portion of code. However, this can be fixed with the following patch, I=20
> would need to export the omap2_clk_is_hw_omap() func from the driver and =

> call it from the omap2 platform code. What do you think? Shall I post=20
> this as an official change? This one still has the issue that I am=20
> calling __clk_get_hw() though.

Looks ok to me. Please post it as an official change. I think we should
look into making clk domains with genpds and plumb that through the clk
framework so that devices calling clk_get() can have their domains
attached automatically on clk_get(). Maybe that would help here. Not
sure.

