Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F46C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 16:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D0D8214E0
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567786545;
	bh=nzpbbhBSmOBAmMXGnpeFdp3Gxx5EYYTyVWH8el0aL8Q=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=2e51iDgbnQuElPfuJxU31nPtIn1I4/5qGS9IwgQ/qxLfqS1sJmjeOxF7IXaiV0O1x
	 tXBGF2l01PHYkW3GIo2AykRZjr/UUGJrCAYfGCr41MSyLCVcXUaPSPbOoAziQAX+cU
	 Ouy/Usd8EGse3blFMTT1P5givIkf7MdXtNCO3p8Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfIFQPo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 12:15:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729557AbfIFQPo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 12:15:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB392206CD;
        Fri,  6 Sep 2019 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567786544;
        bh=nzpbbhBSmOBAmMXGnpeFdp3Gxx5EYYTyVWH8el0aL8Q=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=z1OU2ibJ+oTyuLLjGPF/BUO1Rmst309Xfaqq5zkH8i70Ar5LMTHqRbYPBAt1LaMyY
         P3Gx6nSWJT/7SqrC5XpDCWB/uv5UkWkxun60FyYkc24Bl2B01Ea/QG0NRYlS/UQSjW
         uOuXu6P3PGtVDpkBdcmiD4LRnsJoOYHDogm5lEZQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ed1e3868-af4d-8141-2a04-202923715d06@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com> <20190828065929.32150-5-t-kristo@ti.com> <20190829200515.AFB0622CEA@mail.kernel.org> <ed1e3868-af4d-8141-2a04-202923715d06@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, s-anna@ti.com
Subject: Re: [PATCHv2 4/6] clk: ti: clkctrl: add API to notify reset status
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 09:15:43 -0700
Message-Id: <20190906161543.EB392206CD@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-08-29 23:06:41)
> On 29/08/2019 23:05, Stephen Boyd wrote:
> > Quoting Tero Kristo (2019-08-27 23:59:27)
> >> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> >> index e3e0a66a6ce2..47a0d1398c6f 100644
> >> --- a/drivers/clk/ti/clkctrl.c
> >> +++ b/drivers/clk/ti/clkctrl.c
> >> @@ -680,3 +689,38 @@ u32 ti_clk_is_in_standby(struct clk *clk)
> >>          return false;
> >>   }
> >>   EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
> >> +
> >> +/**
> >> + * ti_clk_notify_resets - Notify the clock driver associated reset st=
atus
> >=20
> > This is completely unused in this patch series. What's going on?
>=20
> This is needed by the OMAP reset driver. See:
>=20
> https://lwn.net/Articles/797597/
>=20

Ok. I decided to punt this topic forward to next release at the least.
To clarify, TI is not special with regards to coordinating resets and
clk enable/disable state. Every other silicon vendor has the same
requirements and nobody is doing a good job at it.

Please devise a way that avoids making a tight coupling between the clk
driver and the reset driver in this way. Are the two in the same
register space? Perhaps we need to combine the two drivers then. Or can
this be implemented as a genpd that coordinates the resets and clk
controls for various devices?

