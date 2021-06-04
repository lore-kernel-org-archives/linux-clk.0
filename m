Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738C8C4708F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 07:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5611961414
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 07:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhFDHHC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 03:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFDHHB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jun 2021 03:07:01 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF55C06174A
        for <linux-clk@vger.kernel.org>; Fri,  4 Jun 2021 00:05:16 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t140so3605693oih.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jun 2021 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g23kQxyNH+1pVEh10Lql32+hESaS42Cp71JBStHlLKc=;
        b=Zaon7wTWKilI5hiieFDpjCX6SuxKHY3xbqZwhiXBNFTtx1T6m/6Q1/1l9n+fk4IKhD
         y3tgEk0o3XX7C33iNzZq+T3c+frnO+WwK5uwn833DfIML+kEymnwDJZzbRvAHq8rolOC
         s6syFtPiDM5GY/B17EAloQqdIn+yns3HvfLMKvtSrkHV/sC+FPeqfNW57Av9CfsvjGvr
         dszRhucOomQ3UDNuR9g/ySxZo9qL3qVO8wnNtb+g1Y3sLl3DktcLF93wBDd5ke3g1+rJ
         HxSENNDHyLHoBPTXHaxGCn7HhyMFR7lKdd257FEEPrsWSm2Y+/VdLqQSiUVWVXYLIl8+
         ikHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g23kQxyNH+1pVEh10Lql32+hESaS42Cp71JBStHlLKc=;
        b=Sg61KHF1FMbcVnzgZHbh14tnwMo8muskfDvgvUQfRQjhjIU0zouSHedaI7g3S4RsbD
         ptNpEZpnIPZqrLuS+G592lnm6+zMVsvhNDhhJdJLKvX+4k2GVC7EGle6AMHZAQyq7ZRX
         s8pN4Geiz7wqSL9EmfeFHaB34GR60R7k0xrSiX/KSFB/QPglKvaXezsM2QZREyc8HcFv
         2uPfINxjNRld0rQwYN4fcbhFs2+wtY8ReKpoF6VytMPKQUOvS1qlYmkFRhpX1JtOtEjL
         kh7QJlDsGeukquqGc7gHc7ZFBt5C35mwf0e/MVswlk2JpKB7DP/6I6eyftFyvT60w9fJ
         LUjA==
X-Gm-Message-State: AOAM531UxSHU1536jIAKhVgc2/rJn6zQvZu3W4nHF6RdjinKbWgWSgzy
        YVeFj9J+MxqfCKQeRBu7lejUtayn0pCzfpMEwzREp5Wa
X-Google-Smtp-Source: ABdhPJw9tLMuekRQM/MfAWVNlA8VEhl0zN0caxBz6I86IvVtrANxXtgqYLSDDL1MW2RiZR2UIl7UkX7CBn7QNKO6Zzg=
X-Received: by 2002:a05:6808:1304:: with SMTP id y4mr10264681oiv.20.1622790315670;
 Fri, 04 Jun 2021 00:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-6-aisheng.dong@nxp.com> <162259860630.4130789.2941110953953498194@swboyd.mtv.corp.google.com>
 <YLnMUtxEAxAq3vBO@ryzen.lan>
In-Reply-To: <YLnMUtxEAxAq3vBO@ryzen.lan>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Fri, 4 Jun 2021 15:04:03 +0800
Message-ID: <CAA+hA=QO2CSAqFMcyEakADNPqVej09i9jkO7HLnQ=-pR_ESbeg@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: imx8qm: add clock valid resource checking
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 4, 2021 at 2:46 PM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> On 21-06-01 18:50:06, Stephen Boyd wrote:
> > Quoting Dong Aisheng (2021-04-22 20:33:34)
> > > diff --git a/drivers/clk/imx/clk-imx8qm-rsrc.c b/drivers/clk/imx/clk-imx8qm-rsrc.c
> > > new file mode 100644
> > > index 000000000000..183a071cbf20
> > > --- /dev/null
> > > +++ b/drivers/clk/imx/clk-imx8qm-rsrc.c
> > > @@ -0,0 +1,116 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2019-2021 NXP
> > > + *     Dong Aisheng <aisheng.dong@nxp.com>
> > > + */
> > > +
> > > +#include <dt-bindings/firmware/imx/rsrc.h>
> > > +
> > > +#include "clk-scu.h"
> > > +
> > > +/* Keep sorted in the ascending order */
> > > +static u32 imx8qm_clk_scu_rsrc_table[] = {
> >
> > const?

Stephen,
Thanks for pointing this out

> >
>
> Aisheng, no need to resend, I'll fold that in.

Thanks

Regards
Aisheng

>
> > > +       IMX_SC_R_A53,
