Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F47C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 15:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5308861373
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 15:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhJTQBP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Oct 2021 12:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhJTQBO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Oct 2021 12:01:14 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00A2C061749
        for <linux-clk@vger.kernel.org>; Wed, 20 Oct 2021 08:58:59 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o24so12648191wms.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Oct 2021 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H+gRH76GjJMcJJIvfbmq+wi06oWXJKKHW0RhCwTVPXc=;
        b=acn3qGxC3Mo9OmYRVDxgMTw+Z+TBUD6x84AEdFNyPqLztx7gioUami8NTv0w9xjMFR
         tJd/v+bQWD1p4VfsOkRrUcNgiFoCADs7snjxYBJo1h+w2mx6CS4R3eAJfFQaqzH23Vfu
         HkUbNlCeAXFz4ISUkwMgkKzSgVJML3zY98LC7dd5sRg57p3w6kfYZb4J/QFrH4j6zqE5
         XnVfCHI96R9CnA6EoxonGNuls2LZz0k6ZCKYZL85rt4XzkPKlMZ29ErC8Lc2ZmJG3vPT
         WVsj58bFXRjxv2hNAX+i0DCL0713wr2R1IimFullnDf56M7szIdwtQTSEFevZsseLLv0
         f1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H+gRH76GjJMcJJIvfbmq+wi06oWXJKKHW0RhCwTVPXc=;
        b=eDjB7QxWB0TUQsAhecG7bAOU9Kn9lDMG/IMpRbeV5PSIx3w+IIpsoPxSiAqFtN2yED
         3XEe5NZCa24CseNzZlYt29cMnp0gq4P0crL7Ytbrw6SAAlHqiCWM16M3w3CmagiSS+SF
         fH7EveMBHLvVL+0Sg4FgSUtzB0TcVHcloD2SoabYvJlDASGY7X5uGc8o1f/I7MYlkWZG
         yYu+fZozkGBSHS1jtkfdwnx0EWSm6SpOocqUPLaqlLdxD4b3HTabQhluRKKDPTeXHEKK
         c7IEUmKVcHwJyT/y0P+nkgSvGzuuWXSYsPIjQueXJXJyrccYPMwC5yBgSE3o6xHfEJTh
         H+sw==
X-Gm-Message-State: AOAM53366DNcwig5ZqfbGVSbVlfIDKhYH2su8dg9jbiq4K5as+U9nIev
        /08gvvHF/XG6TRHQ15kjs4Veqg==
X-Google-Smtp-Source: ABdhPJzu2kHxVdJL7wFokGtw+2Z4vFuRFipGsrFdgD1Ln0YPGyMZzRUU/Iy9xzrkN+HPUmSA6Nnt/g==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr15713wrm.271.1634745538412;
        Wed, 20 Oct 2021 08:58:58 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id l2sm6038888wmi.1.2021.10.20.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 08:58:57 -0700 (PDT)
Date:   Wed, 20 Oct 2021 16:58:56 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: sprd: Add bindings for ums512
 global registers
Message-ID: <YXA8wBzhB/Dauu7v@google.com>
References: <20210923064137.60722-1-zhang.lyra@gmail.com>
 <20210923064137.60722-3-zhang.lyra@gmail.com>
 <YV1XpL7ibF1y4LbV@google.com>
 <CAL_Jsq+eqqv=qtKOiNdEpYGi2amek_m+Q-Z9A769pXXqJ4R88A@mail.gmail.com>
 <CAL_JsqLUkxKOMSWLzTK14h3EyBCsO2dfq3=MxOSvv1ZK0_H=ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLUkxKOMSWLzTK14h3EyBCsO2dfq3=MxOSvv1ZK0_H=ow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 20 Oct 2021, Rob Herring wrote:

> On Mon, Oct 11, 2021 at 9:11 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Wed, Oct 6, 2021 at 3:00 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Thu, 23 Sep 2021, Chunyan Zhang wrote:
> > >
> > > > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > > >
> > > > Add bindings for Unisoc system global register which provide register map
> > > > for clocks.
> > > >
> > > > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../bindings/mfd/sprd,ums512-glbreg.yaml      | 68 +++++++++++++++++++
> > > >  1 file changed, 68 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml
> > >
> > > Unapplied v3 and applied this (v4) instead, thanks.
> >
> > What about the clock binding this depends on:
> >
> > Unknown file referenced: [Errno 2] No such file or directory:
> > '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/clock/sprd,ums512-clk.yaml'
> > xargs: dt-doc-validate: exited with status 255; aborting
> > make[1]: *** Deleting file
> > 'Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.example.dt.yaml'
> > Unknown file referenced: [Errno 2] No such file or directory:
> > '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/clock/sprd,ums512-clk.yaml'
> > make[1]: *** [scripts/Makefile.lib:385:
> > Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.example.dt.yaml]
> > Error 255
> >
> >
> > Once again, all the components of MFD bindings need to be applied together.
> 
> It seems that Stephen still has comments and there's a new check that
> causes the clock schema to fail, so this should be dropped or
> reverted.

Dropped.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
