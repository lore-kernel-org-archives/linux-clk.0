Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3501AC433E6
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 21:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E031B64FC5
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 21:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbhBEV1S convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Feb 2021 16:27:18 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:35453 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbhBEPBb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Feb 2021 10:01:31 -0500
Received: by mail-lf1-f54.google.com with SMTP id u25so10780449lfc.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Feb 2021 08:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A18d3pB/vKIfoZwd9hT2XkXbAHUUomY9AFW5el5Iv+w=;
        b=a0BoIw9Y/7NHgNCy4Oz3Q9/D10OeoYlLLvtCgSZPRwRMuXrBgLQAxQJRz7tPKUzpVJ
         mIgMknVi4JVeEuYzd5QkXqZPfiin3UIFMIhjFOSvahEjxJfhhaAEWon7LNRpOU8Gtabs
         HRBDxjoALRSKprd5j8GLkBsUSbAcf1OIWVReVe8+kqwyWNVTmFBeu4Jfr8XMJoRsm8Wx
         AD9c6+KYAjHbgtvC01ejZTiA7lQd6qabkjFJa2AMZjtzAsrR3hyETdEW8HKu/CIUfD0u
         Cr/4UFfyOjVleZNTBHo/+Kfq/D0lV65+wn9GobYzPbaMjGRfGOd/UEDlZFkL0akUh9q4
         8vmg==
X-Gm-Message-State: AOAM531EyQ9cqwezbQB5vRhwkCePo+vfMjxb6WkrEvfE9o6qwcPEd02v
        aPNaqFp1hjlMWOZWxrLSRbvGOahOeJcmZg==
X-Google-Smtp-Source: ABdhPJyJHuWobwgoL1MVjyLwpreKdIlLFs3kDud9Hy1JbAj2dVTgtBspGivH7qAPt9N2dG2YBGTC+A==
X-Received: by 2002:a2e:3317:: with SMTP id d23mr3247853ljc.199.1612542515444;
        Fri, 05 Feb 2021 08:28:35 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id o8sm1036010lft.213.2021.02.05.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 08:28:35 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id a25so8497193ljn.0;
        Fri, 05 Feb 2021 08:28:34 -0800 (PST)
X-Received: by 2002:a2e:9d04:: with SMTP id t4mr3147625lji.56.1612542514337;
 Fri, 05 Feb 2021 08:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
 <20210205160130.ccp7jfcaa5hgyekb@gilmour> <2156838.FvJGUiYDvf@kista>
In-Reply-To: <2156838.FvJGUiYDvf@kista>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sat, 6 Feb 2021 00:28:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
Message-ID: <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
Subject: Re: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
To:     =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Andre Heider <a.heider@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Feb 6, 2021 at 12:21 AM Jernej Škrabec <jernej.skrabec@siol.net> wrote:
>
> Dne petek, 05. februar 2021 ob 17:01:30 CET je Maxime Ripard napisal(a):
> > On Fri, Feb 05, 2021 at 11:21:22AM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net>
> wrote:
> > > >
> > > > Channel 1 has polarity bits for vsync and hsync signals but driver never
> > > > sets them. It turns out that with pre-HDMI2 controllers seemingly there
> > > > is no issue if polarity is not set. However, with HDMI2 controllers
> > > > (H6) there often comes to de-synchronization due to phase shift. This
> > > > causes flickering screen. It's safe to assume that similar issues might
> > > > happen also with pre-HDMI2 controllers.
> > > >
> > > > Solve issue with setting vsync and hsync polarity. Note that display
> > > > stacks with tcon top have polarity bits actually in tcon0 polarity
> > > > register.
> > > >
> > > > Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> > > > Tested-by: Andre Heider <a.heider@gmail.com>
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > ---
> > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
> > > >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
> > > >  2 files changed, 29 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/
> sun4i_tcon.c
> > > > index 6b9af4c08cd6..0d132dae58c0 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon
> *tcon,
> > > >                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
> > > >                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
> > > >
> > > > +       /* Setup the polarity of sync signals */
> > > > +       if (tcon->quirks->polarity_in_ch0) {
> > > > +               val = 0;
> > > > +
> > > > +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > +                       val |= SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
> > > > +
> > > > +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > +                       val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > > > +
> > > > +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, val);
> > > > +       } else {
> > > > +               val = SUN4I_TCON1_IO_POL_UNKNOWN;
> > >
> > > I think a comment for the origin of this is warranted.
> >
> > If it's anything like TCON0, it's the pixel clock polarity
>
> Hard to say, DW HDMI controller has "data enable" polarity along hsync and
> vsync. It could be either or none of those.
>
> What should I write in comment? BSP drivers and documentation use only generic
> names like io2_inv.

Just say that we don't know exactly what it is, but it is required for things
to work properly? Would be interesting to know what happens if you don't set
this bit, but do set VSYNC/HSYNC polarity properly.

ChenYu
