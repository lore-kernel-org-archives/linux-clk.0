Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD33FC433E9
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 18:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6191264F09
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 18:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhBERHz convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Feb 2021 12:07:55 -0500
Received: from mailoutvs11.siol.net ([185.57.226.202]:36644 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233770AbhBERFr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Feb 2021 12:05:47 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9463F52406E;
        Fri,  5 Feb 2021 19:47:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id uFpchGQ_I5wi; Fri,  5 Feb 2021 19:47:18 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 390065241AB;
        Fri,  5 Feb 2021 19:47:18 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 9385D52406E;
        Fri,  5 Feb 2021 19:47:17 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Chen-Yu Tsai <wens@csie.org>
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
Subject: Re: Re: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
Date:   Fri, 05 Feb 2021 19:47:17 +0100
Message-ID: <3972834.uPFdDeCNB3@kista>
In-Reply-To: <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net> <2156838.FvJGUiYDvf@kista> <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne petek, 05. februar 2021 ob 17:28:23 CET je Chen-Yu Tsai napisal(a):
> On Sat, Feb 6, 2021 at 12:21 AM Jernej Škrabec <jernej.skrabec@siol.net> 
wrote:
> >
> > Dne petek, 05. februar 2021 ob 17:01:30 CET je Maxime Ripard napisal(a):
> > > On Fri, Feb 05, 2021 at 11:21:22AM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec 
<jernej.skrabec@siol.net>
> > wrote:
> > > > >
> > > > > Channel 1 has polarity bits for vsync and hsync signals but driver 
never
> > > > > sets them. It turns out that with pre-HDMI2 controllers seemingly 
there
> > > > > is no issue if polarity is not set. However, with HDMI2 controllers
> > > > > (H6) there often comes to de-synchronization due to phase shift. 
This
> > > > > causes flickering screen. It's safe to assume that similar issues 
might
> > > > > happen also with pre-HDMI2 controllers.
> > > > >
> > > > > Solve issue with setting vsync and hsync polarity. Note that display
> > > > > stacks with tcon top have polarity bits actually in tcon0 polarity
> > > > > register.
> > > > >
> > > > > Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine 
support")
> > > > > Tested-by: Andre Heider <a.heider@gmail.com>
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
> > > > >  2 files changed, 29 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/
sun4i/
> > sun4i_tcon.c
> > > > > index 6b9af4c08cd6..0d132dae58c0 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct 
sun4i_tcon
> > *tcon,
> > > > >                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
> > > > >                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
> > > > >
> > > > > +       /* Setup the polarity of sync signals */
> > > > > +       if (tcon->quirks->polarity_in_ch0) {
> > > > > +               val = 0;
> > > > > +
> > > > > +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > > +                       val |= SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
> > > > > +
> > > > > +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > > +                       val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > > > > +
> > > > > +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, 
val);
> > > > > +       } else {
> > > > > +               val = SUN4I_TCON1_IO_POL_UNKNOWN;
> > > >
> > > > I think a comment for the origin of this is warranted.
> > >
> > > If it's anything like TCON0, it's the pixel clock polarity
> >
> > Hard to say, DW HDMI controller has "data enable" polarity along hsync and
> > vsync. It could be either or none of those.
> >
> > What should I write in comment? BSP drivers and documentation use only 
generic
> > names like io2_inv.
> 
> Just say that we don't know exactly what it is, but it is required for 
things
> to work properly? Would be interesting to know what happens if you don't set
> this bit, but do set VSYNC/HSYNC polarity properly.

Nothing seems to happen - tested on H3 with HDMI (4k@30) and CVBS. At least I 
didn't notice anything.

Best regards,
Jernej


