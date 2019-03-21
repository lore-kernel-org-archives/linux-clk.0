Return-Path: <SRS0=PHVF=RY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A5FC43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 11:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89392218B0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 11:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SPzqAfFc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbfCULm7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Mar 2019 07:42:59 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36238 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbfCULm7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Mar 2019 07:42:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id y13so6230917wrd.3
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2019 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=59vR2A+euBJN67GSOF7WwYlE4GrC2rdZixdgHu8KXFA=;
        b=SPzqAfFcZOqJFtRDDMtvVo+VyuHgxdzzlkNf31ph7Z0/bYXuHib8HlB1A2924t6Fx+
         SypyvnU23tZLyG31hBzu3jZN9U1bUKqk/vdEziOFUf5zsLls+nrXF9W3J05sBTPXSGaL
         btBBUHOtnsPOJHiaAQ6oL+/1HRFVXpOcn6NdaEBjUc2kILs+3MtBcwObCdGRwtMyjS42
         VtVKQ8SuClZ/WJe1QYyM3ey48j6RWCQJndwJtvIOduMO9SvKgiKzLoArBZ9utd9BuSPT
         VK7Jtl8ZR2grStniBz5Ts6p5x2bBaG5dCaKuPMdq4l52mINR8eY2LZdlOIbW7sPqXJtj
         cFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=59vR2A+euBJN67GSOF7WwYlE4GrC2rdZixdgHu8KXFA=;
        b=RJotjFRePzg3J3bsu3+GR47KsFtsRgVl8QYNO9XHXYyg523Yb8gZhGO49LXha+DKqV
         YAbBRTGyt1u9w5vzve24phYOycqWhC/povIBiHjXX+oLS/n9CBi/b6KBQlykXBidMDZn
         VLQdlKHlJHZbhlaejxTtH5KPUlAbfFQgV219W2o7MgX4EFHqIZssq+WubPdFsIRG5xs2
         +VYQ85g83yS+cMu3Q+Y7AusO4kHOsP6/pGX8eMyM7GOWvhLNFRoH5bIGk9BIRuQO/8Pj
         V5mI7+dxcHPdFlJefJ4Pzfobu66YL75NBtZ/q2VvK0yBKdXpkI0XM8nDak4aYDn1CsKK
         SYhQ==
X-Gm-Message-State: APjAAAVu+JeechQDVORTPOqTPMV2Cv2Af7BirbX45/ZXwk/osArvjspq
        6bOxIqN9Z/MiPo0/ycgUQaQYUsnepmr1/J6SxlEuDw==
X-Google-Smtp-Source: APXvYqxZ34sTxFSQXNIkibuzBKuMCfbwSqdSa8Y+VtsnHDC1q7+XT6KALtfnOECI+q6NJymYvsBgXs5YMfZDKSgr+AI=
X-Received: by 2002:adf:f147:: with SMTP id y7mr2153774wro.102.1553168576647;
 Thu, 21 Mar 2019 04:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
 <20190319220012.31065-3-martin.blumenstingl@googlemail.com>
 <CAMO6nawKpBRrp0oBtrGY8KskD6tUX9ZCNeDqSGPB-kMnm27HnA@mail.gmail.com> <CAFBinCC4cVkRr0TGJXkKVSd+k7bxeBVkZZxrH+EjS=X78StS=g@mail.gmail.com>
In-Reply-To: <CAFBinCC4cVkRr0TGJXkKVSd+k7bxeBVkZZxrH+EjS=X78StS=g@mail.gmail.com>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Thu, 21 Mar 2019 12:42:45 +0100
Message-ID: <CAMO6nawCPH_VP1D6cbGtPVVNsKyoSqaGbe2pNmBq=HqZ80tP-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: meson8b: add the video decoder clock trees
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 20, 2019 at 9:53 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Maxime,
>
> On Wed, Mar 20, 2019 at 12:16 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
> >
> > Hi Martin, thanks for looking into the video decoder for meson8!
> you're welcome - this is only possible because of your work on the
> video decoder driver!
>
> > On Tue, Mar 19, 2019 at 11:00 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > This adds the four video decoder clock trees.
> > >
> > > VDEC_1 is split into two paths on Meson8b and Meson8m2:
> > > - input mux called "vdec_1_sel"
> > > - two dividers ("vdec_1_1_div" and "vdec_1_2_div") and gates ("vdec_1_1"
> > >   and "vdec_1_2")
> > > - and an output mux (probably glitch-free) called "vdec_1"
> >
> > Yes, all vdec clocks have a glitch-free mux to be able to safely
> > adjust the frequency on the fly, although in practice it's barely
> > used.
> >
> > > On Meson8 the VDEC_1 tree is simpler because there's only one path:
> > > - input mux called "vdec_1_sel"
> > > - divider ("vdec_1_1_div") and gate ("vdec_1_1")
> > > - (the gate is used as output directly, there's no mux)
> > >
> > > The VDEC_HCODEC and VDEC_2 clocks are simple composite clocks each
> > > consisting of an input mux, divider and a gate.
> > >
> > > The VDEC_HEVC clock seems to have two paths similar to the VDEC_1 clock.
> > > However, the register offsets of the second clock path is not known.
> > > Amlogic's 3.10 kernel (which is used as reference) sets
> > > HHI_VDEC2_CLK_CNTL[31] to 1 before changing the VDEC_HEVC clock and back
> > > to 0 afterwards. For now, leave a TODO comment and only add the first
> > > path.
> > >
> >
> > Looking at aml-3.10/drivers/amlogic/amports/m8b/vdec_clk.c, it's weird
> > indeed. They seem to copy the divider's value to the same place
> > (HHI_VDEC2_CLK_CNTL[16~23]), and the only thing that stands out is
> > enabling HHI_VDEC2_CLK_CNTL[31].
> >
> > Then again they don't make use of that codepath at all, so who knows..
> indeed, that's why I skipped it for now
>
> [...]
> > > diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> > > index e775f91ccce9..ed37196187e6 100644
> > > --- a/drivers/clk/meson/meson8b.h
> > > +++ b/drivers/clk/meson/meson8b.h
> > > @@ -37,6 +37,9 @@
> > >  #define HHI_MALI_CLK_CNTL              0x1b0 /* 0x6c offset in data sheet */
> > >  #define HHI_VPU_CLK_CNTL               0x1bc /* 0x6f offset in data sheet */
> > >  #define HHI_HDMI_CLK_CNTL              0x1cc /* 0x73 offset in data sheet */
> > > +#define HHI_VDEC_CLK_CNTL              0x1e0 /* 0x78 offset in data sheet */
> > > +#define HHI_VDEC2_CLK_CNTL             0x1e4 /* 0x79 offset in data sheet */
> > > +#define HHI_VDEC3_CLK_CNTL             0x1e8 /* 0x7a offset in data sheet */
> > >  #define HHI_NAND_CLK_CNTL              0x25c /* 0x97 offset in data sheet */
> > >  #define HHI_MPLL_CNTL                  0x280 /* 0xa0 offset in data sheet */
> > >  #define HHI_SYS_PLL_CNTL               0x300 /* 0xc0 offset in data sheet */
> > > @@ -156,8 +159,20 @@
> > >  #define CLKID_VPU_1_SEL                186
> > >  #define CLKID_VPU_1_DIV                187
> > >  #define CLKID_VPU_1            189
> > > +#define CLKID_VDEC_1_SEL       191
> > > +#define CLKID_VDEC_1_1_DIV     192
> > > +#define CLKID_VDEC_1_1         193
> > > +#define CLKID_VDEC_1_2_DIV     194
> > > +#define CLKID_VDEC_1_2         195
> >
> > In order to make use of the glitch-free mux by the driver, shouldn't
> > CLKID_VDEC_1_1 and CLKID_VDEC_1_2 be exported in the bindings ?
> I considered this but I didn't export them because of three reasons:
> - the video decoder driver doesn't have any logic to use the glitch-free mux yet
> - assigned-clock-rates or clk_set_rate will figure out the parent
> setup on it's own if we ignore the glitch-free mux until the video
> decoder driver supports it
> - exporting CLKIDs is easier than un-exporting them
>

Sure, makes sense. We'll revisit those in the future if we add on the
fly frequency adjusting to the vdec driver.

Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

> Regards
> Martin
