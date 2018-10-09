Return-Path: <SRS0=ggfB=MV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EF6C43441
	for <linux-clk@archiver.kernel.org>; Tue,  9 Oct 2018 22:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AEEE214C4
	for <linux-clk@archiver.kernel.org>; Tue,  9 Oct 2018 22:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ift2sGnr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AEEE214C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbeJJGLb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 02:11:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbeJJGLb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Oct 2018 02:11:31 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5A12206B2;
        Tue,  9 Oct 2018 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539125539;
        bh=2Uon3e62rfvaeAoOxwytsjFe4XVndKyiNk/W7WHuFQU=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Ift2sGnr1Z3IIodVGWRStVksT1AeC7HcitjVECBebgDtFBg9ihsSsl1S4WRpFEORF
         f8fIBBwtCAD0yA0dXcfzBvoEUjxwrUnTWZHKlxrcpP03ViiuZPC16xk4oDKpYRma7E
         DNVema5IdDVEFdsbICzqfuUcgiSjcK4vDLGwImec=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181008145131eucas1p1d8c3544989d03855e2c19a315fd55bd5~bqbS3B-Kg1166811668eucas1p1h@eucas1p1.samsung.com>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20181002115219eucas1p23816d543c4dedb233406869c22713a95@eucas1p2.samsung.com>
 <20181002115210.15541-1-m.szyprowski@samsung.com>
 <153896685140.119890.3664164252562492456@swboyd.mtv.corp.google.com>
 <20181008145131eucas1p1d8c3544989d03855e2c19a315fd55bd5~bqbS3B-Kg1166811668eucas1p1h@eucas1p1.samsung.com>
Message-ID: <153912553897.119890.5922432522306051086@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: samsung: Use clk_hw API for calling clk framework from clk
 notifiers
Date:   Tue, 09 Oct 2018 15:52:18 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Szyprowski (2018-10-08 07:51:30)
> Hi Stephen,
> =

> On 2018-10-08 04:47, Stephen Boyd wrote:
> > Quoting Marek Szyprowski (2018-10-02 04:52:10)
> >> @@ -432,7 +432,7 @@ int __init exynos_register_cpu_clock(struct samsun=
g_clk_provider *ctx,
> >>         else
> >>                 cpuclk->clk_nb.notifier_call =3D exynos_cpuclk_notifie=
r_cb;
> >>  =

> >> -       cpuclk->alt_parent =3D __clk_lookup(alt_parent);
> >> +       cpuclk->alt_parent =3D __clk_get_hw(__clk_lookup(alt_parent));
> > It would be nice to get rid of __clk_lookup() from here too. Please try
> > to do that if at all possible.
> =

> So far it won't be possible to get rid of __clk_lookup() completely from
> samsung/clk-cpu.c, because there is a need to register clk notifier for
> CPU clock, but there is no clk_hw_notifier_register() api. I'm not sure if
> this is the right way to add it.
> =


Probably there needs to be some way to indicate that the alt_parent is
going here and then grab the clk_hw pointer to it. Instead of looking up
a clk by random string name.

I don't really care about the clk_notifier_register() API, that's fine.
Eventually I'd like to see that API not be used by clk provider drivers.

