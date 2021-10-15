Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE83C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 12:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AC556109E
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 12:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235956AbhJOMr3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 08:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235537AbhJOMr3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 08:47:29 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D773BC061762
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 05:45:22 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r7so26331305wrc.10
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H1fRj8KbyTC18M2qqUxC+yLQuVMOY9QK2Vkvq7KCP/Q=;
        b=wQTgGjUNl5ZNWtCzfZgsJW5kL1LNboDm3JtJ9cH2cUjIi28Fz39i3VbuoVmmS+etat
         3FWlClGElz2S5Yej3Pj6kzY0FXEMGGxRnCwmC93vCGkH8oVY5GTBVSuPpfj78ouJY2CN
         hv1y4GWUyVPr76Vmv2ptef3zAL/aemZ5keucGkNa5AUyyLSpvhe/aoXaIZMJTX/0+oxW
         vjkONNr2GE7TFjsuw1k2zzB2RaSyu+gNkHEmNK6UPEfhXvygEXsO3LUKgFBYiO1VApxV
         eTpHM/blKl9Up381tU5yctffNmpFwekdfTtypoEzkQ9WsE5KA/EwXwfVRZ0vkLSB/82S
         GVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H1fRj8KbyTC18M2qqUxC+yLQuVMOY9QK2Vkvq7KCP/Q=;
        b=GLDck027SKX3dDIS53A1KIBUw6Z9fG65ZTUUSnJBmC9Wngm3Cfdfj0o63A42M9d2Zw
         8WrEJJ5jrMHJEo8aFhJpNmNJfECT1H2CUFAIfg3bdrSUt7gOkYoayZdO6CFCiLq2YI+1
         awzPsXgMbpW70akW6Amv1WRBMTHP5HR7JGXCL20/40IF+7s+tthVDj6RhwltC8kvSSNR
         6w0CJJHmtIZHImBq78hZ9bhqpmzpJB+CMRvrRUVerRKGg2M+dijxaDo/XSvpHe1T20xB
         YqD7NLssdOBOYgO6ytXpaW6+GEtOvr78rYeMGFGN9VIzDa9aHoAOBwfGxvOXLCIkPEsg
         TGww==
X-Gm-Message-State: AOAM531yZfaqEEBtW4DNcmskTABwt1AHtGAYPFtyT2fgP9/bT7s+iStr
        /Ffoyezo/5KZJQhYWJstc/cHEA==
X-Google-Smtp-Source: ABdhPJxR+e4FClxsODFkAteKxROdwFc61kceh1QDU+2OORGy1s3RMcwDGYLNlbGhFmjyYlcrJpfBCA==
X-Received: by 2002:adf:cd12:: with SMTP id w18mr4152785wrm.401.1634301921366;
        Fri, 15 Oct 2021 05:45:21 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id e9sm4672725wme.37.2021.10.15.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 05:45:20 -0700 (PDT)
Date:   Fri, 15 Oct 2021 13:45:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: sprd: Add bindings for ums512
 global registers
Message-ID: <YWl33gCy1ac29WSs@google.com>
References: <20210923064137.60722-1-zhang.lyra@gmail.com>
 <20210923064137.60722-3-zhang.lyra@gmail.com>
 <YV1XpL7ibF1y4LbV@google.com>
 <CAL_Jsq+eqqv=qtKOiNdEpYGi2amek_m+Q-Z9A769pXXqJ4R88A@mail.gmail.com>
 <YWVD0RXHVLxuXEIN@google.com>
 <CAMuHMdWqYVp1JyzZoidAJhPy9ypRnSOWHJLz5knDUMcFHPOzAw@mail.gmail.com>
 <YWfSz00Rj5AVhkgT@google.com>
 <CAL_Jsq+GHt+DqHa0GeLKWoni+Lghg5wg5ssREZBdSD-=K3XQ1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+GHt+DqHa0GeLKWoni+Lghg5wg5ssREZBdSD-=K3XQ1A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 14 Oct 2021, Rob Herring wrote:

> On Thu, Oct 14, 2021 at 1:48 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Wed, 13 Oct 2021, Geert Uytterhoeven wrote:
> >
> > > Hi Lee,
> > >
> > > On Tue, Oct 12, 2021 at 10:15 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > On Mon, 11 Oct 2021, Rob Herring wrote:
> > > > > On Wed, Oct 6, 2021 at 3:00 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > > > On Thu, 23 Sep 2021, Chunyan Zhang wrote:
> > > > > >
> > > > > > > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > > > > > >
> > > > > > > Add bindings for Unisoc system global register which provide register map
> > > > > > > for clocks.
> > > > > > >
> > > > > > > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > > > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > > > ---
> > > > > > >  .../bindings/mfd/sprd,ums512-glbreg.yaml      | 68 +++++++++++++++++++
> > > > > > >  1 file changed, 68 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml
> > > > > >
> > > > > > Unapplied v3 and applied this (v4) instead, thanks.
> > > > >
> > > > > What about the clock binding this depends on:
> > > > >
> > > > > Unknown file referenced: [Errno 2] No such file or directory:
> > > > > '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/clock/sprd,ums512-clk.yaml'
> > > > > xargs: dt-doc-validate: exited with status 255; aborting
> > > > > make[1]: *** Deleting file
> > > > > 'Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.example.dt.yaml'
> > > > > Unknown file referenced: [Errno 2] No such file or directory:
> > > > > '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/clock/sprd,ums512-clk.yaml'
> > > > > make[1]: *** [scripts/Makefile.lib:385:
> > > > > Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.example.dt.yaml]
> > > > > Error 255
> > > > >
> > > > >
> > > > > Once again, all the components of MFD bindings need to be applied together.
> > >
> > > Just ran into this, too...
> > >
> > > > I can't apply what is not sent to me.
> > > >
> > > > This patch came in on its own.
> > >
> > > Then please reject/postpone patches that don't build (yet) ;-)
> >
> > I don't explicitly build DT documentation.
> >
> > Since I use the build bots to let me know if there are strange !(C,
> > ASM, arm, aarch64, mips, ppc, x86) build issues or ones with odd
> > configuration possibilities (randconfig) in the repos I maintain, you
> > might have to convince them that this is important too.
> 
> It's really just a matter of turning on the build in
> allyesconfig/allmodconfig builds. I've not done that primarily because
> there's one person I don't want to yell at me, but I could probably
> make it arm and/or arm64 only. It's really arch and config
> independent, so doing it multiple times is kind of pointless.
> 
> I assume for bots you mean kernel-ci mainly? Do you run that before
> stuff gets into linux-next? IMO, that's too late. But still a slight
> improvement if things go in via one tree. Otherwise, I see the
> breakage twice, 1st linux-next then the merge window.

Kernel test robot <lkp@intel.com> is the one that springs to mind.

Although, I'm sure there are other, less prolific implementations.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
