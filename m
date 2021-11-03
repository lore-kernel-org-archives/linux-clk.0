Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B265C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 18:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3526E61076
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 18:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhKCS0h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Nov 2021 14:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhKCS0h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Nov 2021 14:26:37 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2ECC061714
        for <linux-clk@vger.kernel.org>; Wed,  3 Nov 2021 11:24:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 5so12062922edw.7
        for <linux-clk@vger.kernel.org>; Wed, 03 Nov 2021 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iyhrFP3gLyPaq9RQ/2gbasGr/ky7E127TZVkB2lEXhY=;
        b=HEwjOj+uBRGhp/mN1q+IpCfrSznz4oNhaSdz+pnjrdm3/L0+eFK2uVsZYpQhtDP5SJ
         kMy7ZujfPMfbYgU+a/hIV1vLb8pDnN6kEWNC98jM9fiHyojepYEj6iWHW2/EUimaR8YP
         fHH0Wy9YVpYcHNAVcmOdzuZCppN6ihKZhGP86FaT+ZSQadZYmTu5dHrC1ueeEbY5P5Bh
         ai8Mo+4rkkXV/6W38wmbaZKkZFOVzNHT0GJJg1Fnpm4fZ2vcyM3qGmg4O26QXBrf34qg
         ZvyF3aNk6v8S5FABNJINR8aQbeTdTfMbFdcxC5rxV0e3Q1Vo1bCMogORjKSvldM1vhLb
         hyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyhrFP3gLyPaq9RQ/2gbasGr/ky7E127TZVkB2lEXhY=;
        b=RQsU1QKIYIrRKzSR+H2NnDJZ+0yRc/xnMGU8GxIK0nNtGVi2XPZ15RHQy/yS33GXrJ
         X1ZmJIfUB5J0YUCVAgKRL7EcPq/UoytmQysi1jk710+d1qXx57HWznkH0p87YzWePwdw
         dRGM1op0QkPF+Thsv8b+VYYbrq7bhHH+MY3NTN3bLDfBazHlM5ZfjUSOGsrA7Y7zTj9p
         RTRpaXdzQfi7FqVRjq3bRY3YYVYYXb0fUzNAZsluiB4ad7xdr5yIrbsLKLaJTQWodeMM
         fGguZjHlcSyBCve1S6ouLpM+iT+jF7qPge5vchtdMn1pU4xi3GmSkOHJ4iIPgKLXeCxj
         N9Sw==
X-Gm-Message-State: AOAM5302qIu8V6Q6O35RW4dQYXmdbL7ieqPqcKx6yq/j1VC9Tw4oesQK
        9AlGI4O7OW5pu8+Jj0Tx8dxTmVt9OFZ2Y3DX4No=
X-Google-Smtp-Source: ABdhPJzqbAd7nQLxn4HrKvFMuvTCV6aRG07ITt5zLoP3sk49otT77/Rq15PeKGdVxXGCsAt+uH4J9uFj0EBW0f21tS4=
X-Received: by 2002:aa7:c553:: with SMTP id s19mr37235699edr.292.1635963838924;
 Wed, 03 Nov 2021 11:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
 <CAHCN7xJw02XxfWYt_DCKX0p02sPxTMgghYCLaVMJJ4mJXpsKMw@mail.gmail.com> <58a9758565f4cd6d7afd2c781fa51f2afe4d2ca9.camel@ew.tq-group.com>
In-Reply-To: <58a9758565f4cd6d7afd2c781fa51f2afe4d2ca9.camel@ew.tq-group.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 3 Nov 2021 13:23:47 -0500
Message-ID: <CAHCN7xKr8-GRW49n0V4GoJhFktnYxFikCDjALfuFkddJcoLpwg@mail.gmail.com>
Subject: Re: (EXT) Re: [PATCH 1/1] clk: imx8m: Do not set IMX_COMPOSITE_CORE
 for non-regular composites
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 3, 2021 at 9:33 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Mittwoch, dem 03.11.2021 um 09:25 -0500 schrieb Adam Ford:
> > On Wed, Nov 3, 2021 at 7:41 AM Alexander Stein
> > <
> > alexander.stein@ew.tq-group.com
> > > wrote:
> > > Only imx8m_clk_hw_composite_core needs to set this flag.
> > >

Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon

> > > Fixes: a60fe746df94 ("clk: imx: Rework all imx_clk_hw_composite
> > > wrappers")
> > > Signed-off-by: Alexander Stein <
> > > alexander.stein@ew.tq-group.com
> > > >
> > > ---
> > > This is from clk_summary on a imx8mq custom board where you can
> > > clearly
> > > see the before the divider is limited to 8 (core composite)
> > >
> > > before:
> > > video_pll1_out        2        2        0  1031999997          0
> > >   0  50000         Y
> > >    dsi_phy_ref        1        1        0   129000000          0
> > >   0  50000         Y
> > >    lcdif_pixel        2        2        0   129000000          0
> > >   0  50000         Y
> > >
> > > after:
> > > video_pll1_out        2        2        0  1031999997          0
> > >   0  50000         Y
> > >    dsi_phy_ref        1        1        0    24000000          0
> > >   0  50000         Y
> > >    lcdif_pixel        2        2        0    68800000          0
> > >   0  50000         Y
> > >

This appears to fix a couple clocks on the imx8mm as well.

root@beacon-imx8mm-kit:~# diff before.txt after.txt
225c225
<                 dsi_phy_ref           0        0        0
99000000          0     0  50000         N
---
>                 dsi_phy_ref           0        0        0    27000000          0     0  50000         N
234,235c234,235
<                 sai3                  0        0        0
49152000          0     0  50000         N
<                    sai3_root_clk       0        0        0
49152000          0     0  50000         N
---
>                 sai3                  0        0        0    24576000          0     0  50000         N
>                    sai3_root_clk       0        0        0    24576000          0     0  50000         N

At least for sai3 on the beacon board,  24576000 is the desired clock rate.

> > >  drivers/clk/imx/clk.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> >
> > I attempted to apply this against linux/master and it doesn't apply.
> > What branch did you use?
>
> The referenced commit a60fe746df94 is not in Linus' tree yet, but in
> linux-next. My patch is based on linux-next/next-20211101. Sorry missed
> to mention that.
>
> Best regards,
> Alexander
>
> > > >
> > > index 819949973db1..7d220a01de1f 100644
> > > --- a/drivers/clk/imx/clk.h
> > > +++ b/drivers/clk/imx/clk.h
> > > @@ -391,11 +391,11 @@ struct clk_hw *__imx8m_clk_hw_composite(const
> > > char *name,
> > >
> > >  #define imx8m_clk_hw_composite(name, parent_names, reg) \
> > >         _imx8m_clk_hw_composite(name, parent_names, reg, \
> > > -                       IMX_COMPOSITE_CORE,
> > > IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
> > > +                       0, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
> > >
> > >  #define imx8m_clk_hw_composite_critical(name, parent_names, reg) \
> > >         _imx8m_clk_hw_composite(name, parent_names, reg, \
> > > -                       IMX_COMPOSITE_CORE,
> > > IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> > > +                       0, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> > >
> > >  #define imx8m_clk_hw_composite_bus(name, parent_names, reg)    \
> > >         _imx8m_clk_hw_composite(name, parent_names, reg, \
> > > --
> > > 2.25.1
> > >
>
>
