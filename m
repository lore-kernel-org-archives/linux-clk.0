Return-Path: <SRS0=xpBS=CL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F8AC433E2
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 06:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 514A720826
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 06:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG0ZokJ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIBGv0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Sep 2020 02:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgIBGv0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Sep 2020 02:51:26 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D27BC061245
        for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2020 23:51:24 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id d26so5120360ejr.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2020 23:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bIExytH4DrpKl3cEggsI2nfVBrMDjn8Dld6GpoiH2f0=;
        b=GG0ZokJ0xYfsgxeYKmLD3492oZZoNEcCg6d6tiLfr2+b+Dyi6vobsxAxjBPQCk29PS
         gHuKzrl+gk72Hp9xVlE1KR3lWrgB0NDrpNMlAaP1M8N6UClc2zeYQi5O+L0vzjd+481i
         uKqlz0X+hMrobEzR6+3tM96pPdWL3iD0lRXj5fZ6FGreO/p/djVOF042fy7S49YH3tSd
         0ItWg1ANKNcG3AAgEObcdNuopOcgAaHoSNu/nwZ7OOCMe4EciSS2VGNakotyImiMzMAp
         V5I9dfZtmAUMUSeBMaKRKqWr8Y8ByPeX+GJz9iAnSh/jhp3YHq1XVwt5rPACoaJZT9D4
         zHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bIExytH4DrpKl3cEggsI2nfVBrMDjn8Dld6GpoiH2f0=;
        b=TFciyb4cYSeoHq5iBJ2PG/83tHD6MQ74j5rlY7K0zVn12L255julk6Ca0P0mmb19R4
         KZ2qrExU3gSMqJUnUf+i/x7AQCOoRbsXqVuCuG5BqIAZywG65NU6YZ4Idy6AOQrCYn4V
         xnlYdQIWkPBKTFCRviUy2hspZ09A+qIqen2EgwZFXQZITlHYTlRWaNxL5CR3jvtV5bgW
         HIu2MU3dfm63rhxUq9Vx2B9RgEw340pHgV1cKa8Ry1m0Iwum4xNPsijHTlwO0pCbalAJ
         HBVv9/NUDfo/lGd28C/27upc1a2DtJ/nbrtMMPBrGcZTsSmoZEURxbX+e2XFlgQ4+9Pi
         BDbg==
X-Gm-Message-State: AOAM533BgACBZ7421U8f6ezTyvW7klZe+v5MCyVzAQX5QYEGw/r1ncXP
        wYQImzFppnXemGbkA8Wego2H4twbv+7HqXdXgNxJTUtcZouAgQ==
X-Google-Smtp-Source: ABdhPJyKV8vR5jw2TwMvsi1X82iUMVI91e1QkAgtPtwkyQhfmwgkOLm/njyNN0wQMgB/RMZCm4ypNMB2YMVEnJja9fk=
X-Received: by 2002:a17:906:b47:: with SMTP id v7mr4740286ejg.310.1599029482705;
 Tue, 01 Sep 2020 23:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <CAA+hA=RjwtWLA1aSoNHakHDASrk0+EYy+ayPBw-7ninrYrWFJw@mail.gmail.com> <CAA+hA=Sa11AByUsKnsvhaH4HS_pdwfSv5P4192nnpRs_0vxk9w@mail.gmail.com>
In-Reply-To: <CAA+hA=Sa11AByUsKnsvhaH4HS_pdwfSv5P4192nnpRs_0vxk9w@mail.gmail.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 2 Sep 2020 14:35:57 +0800
Message-ID: <CAA+hA=Qj5NV65N4pWJTCREkuxyw6GKKmSF8X4UXvr=Mmq9WpBA@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm support
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Would you help look at this?
Now only one patch left that still does not have a R-b tag and needs
your review.
[PATCH v7 03/11] clk: imx: scu: add two cells binding support
All other patches already get R-b tags.

Regards
Aisheng

On Mon, Aug 17, 2020 at 3:42 PM Dong Aisheng <dongas86@gmail.com> wrote:
>
> Gently ping...
>
> On Wed, Jul 29, 2020 at 4:04 PM Dong Aisheng <dongas86@gmail.com> wrote:
> >
> > Hi Stephen,
> >
> > This patchset addressed all your new comments.
> > Right now only Patch 2/3 still haven't got any R-b or A-b tags. So
> > still need your help to review.
> > All other patches already got the R-b tags.
> >
> > BTW, for [PATCH v7 02/11] dt-bindings: clock: imx-lpcg: add support to parse
> >  clocks from device tree.
> > It was reviewed by Rob/Shawn and you before, however, due to the legacy binding
> > file has been removed and changed to json format.
> > So this patch also updated to json format accordingly based on the
> > former reviewed patch
> > and need a re-review.
> >
> > Regards
> > Aisheng
> >
> > On Wed, Jul 29, 2020 at 4:04 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
> > >
> > > This patch series is a preparation for the MX8 Architecture improvement.
> > > As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> > > of a couple of SS(Subsystems) while most of them within the same SS
> > > can be shared. e.g. Clocks, Devices and etc.
> > >
> > > However, current clock binding is using SW IDs for device tree to use
> > > which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> > > different SoCs.
> > >
> > > This patch series aims to introduce a new binding which is more close to
> > > hardware and platform independent and can makes us write a more general
> > > drivers for different SCU based SoCs.
> > >
> > > Another important thing is that on MX8, each Clock resource is associated
> > > with a power domain. So we have to attach that clock device to the power
> > > domain in order to make it work properly. Further more, the clock state
> > > will be lost when its power domain is completely off during suspend/resume,
> > > so we also introduce the clock state save&restore mechanism.
> > >
> > > It's based on latest shanw/for-next branch.
> > >
> > > The top commit is:
> > > 3c1a41dab7b8 Merge branch 'imx/defconfig' into for-next
> > >
> > > ChangeLog:
> > > v6->v7:
> > >  * addressed all comments from Stephen
> > >  * rebased to latest shawn/for-next
> > > v5->v6:
> > >  * add scu clk unregister if add provider failed
> > > v4->v5:
> > >  * Address all comments from Stephen
> > > v3->v4:
> > >  * use clk-indices for LPCG to fetch each clks offset from dt
> > > v2->v3:
> > >  * change scu clk into two cells binding
> > >  * add clk pm patches to ease the understand of the changes
> > > v1->v2:
> > >  * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
> > >    Documentation/devicetree/bindings/arm/arm,scpi.txt
> > >  * Add required power domain property
> > >  * Dropped PATCH 3&4 first, will send the updated version accordingly
> > >    after the binding is finally determined,
> > >
> > > Dong Aisheng (11):
> > >   dt-bindings: firmware: imx-scu: new binding to parse clocks from
> > >     device tree
> > >   dt-bindings: clock: imx-lpcg: add support to parse clocks from device
> > >     tree
> > >   clk: imx: scu: add two cells binding support
> > >   clk: imx: scu: bypass cpu power domains
> > >   clk: imx: scu: allow scu clk to take device pointer
> > >   clk: imx: scu: add runtime pm support
> > >   clk: imx: scu: add suspend/resume support
> > >   clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
> > >   clk: imx: lpcg: allow lpcg clk to take device pointer
> > >   clk: imx: clk-imx8qxp-lpcg: add runtime pm support
> > >   clk: imx: lpcg: add suspend/resume support
> > >
> > >  .../bindings/arm/freescale/fsl,scu.txt        |  12 +-
> > >  .../bindings/clock/imx8qxp-lpcg.yaml          |  79 ++++--
> > >  drivers/clk/imx/clk-imx8qxp-lpcg.c            | 139 +++++++++++
> > >  drivers/clk/imx/clk-imx8qxp.c                 | 136 +++++-----
> > >  drivers/clk/imx/clk-lpcg-scu.c                |  53 +++-
> > >  drivers/clk/imx/clk-scu.c                     | 234 +++++++++++++++++-
> > >  drivers/clk/imx/clk-scu.h                     |  56 ++++-
> > >  include/dt-bindings/clock/imx8-lpcg.h         |  14 ++
> > >  8 files changed, 620 insertions(+), 103 deletions(-)
> > >  create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
> > >
> > > --
> > > 2.23.0
> > >
