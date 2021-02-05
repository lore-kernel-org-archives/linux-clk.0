Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82C5C433E6
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 22:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98E2264EE4
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 22:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhBEWLg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Feb 2021 17:11:36 -0500
Received: from mailoutvs7.siol.net ([185.57.226.198]:42821 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231404AbhBEOnc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Feb 2021 09:43:32 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id CDAA15212DD;
        Fri,  5 Feb 2021 17:21:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id TKfwXNZRDSav; Fri,  5 Feb 2021 17:21:25 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 7BD0E52391A;
        Fri,  5 Feb 2021 17:21:25 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Zimbra) with ESMTPA id C6873523912;
        Fri,  5 Feb 2021 17:21:24 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Andre Heider <a.heider@gmail.com>
Subject: Re: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
Date:   Fri, 05 Feb 2021 17:21:24 +0100
Message-ID: <2156838.FvJGUiYDvf@kista>
In-Reply-To: <20210205160130.ccp7jfcaa5hgyekb@gilmour>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net> <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com> <20210205160130.ccp7jfcaa5hgyekb@gilmour>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne petek, 05. februar 2021 ob 17:01:30 CET je Maxime Ripard napisal(a):
> On Fri, Feb 05, 2021 at 11:21:22AM +0800, Chen-Yu Tsai wrote:
> > On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > >
> > > Channel 1 has polarity bits for vsync and hsync signals but driver never
> > > sets them. It turns out that with pre-HDMI2 controllers seemingly there
> > > is no issue if polarity is not set. However, with HDMI2 controllers
> > > (H6) there often comes to de-synchronization due to phase shift. This
> > > causes flickering screen. It's safe to assume that similar issues might
> > > happen also with pre-HDMI2 controllers.
> > >
> > > Solve issue with setting vsync and hsync polarity. Note that display
> > > stacks with tcon top have polarity bits actually in tcon0 polarity
> > > register.
> > >
> > > Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> > > Tested-by: Andre Heider <a.heider@gmail.com>
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
> > >  2 files changed, 29 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/
sun4i_tcon.c
> > > index 6b9af4c08cd6..0d132dae58c0 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon 
*tcon,
> > >                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
> > >                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
> > >
> > > +       /* Setup the polarity of sync signals */
> > > +       if (tcon->quirks->polarity_in_ch0) {
> > > +               val = 0;
> > > +
> > > +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > +                       val |= SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
> > > +
> > > +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > +                       val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > > +
> > > +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, val);
> > > +       } else {
> > > +               val = SUN4I_TCON1_IO_POL_UNKNOWN;
> > 
> > I think a comment for the origin of this is warranted.
> 
> If it's anything like TCON0, it's the pixel clock polarity

Hard to say, DW HDMI controller has "data enable" polarity along hsync and 
vsync. It could be either or none of those.

What should I write in comment? BSP drivers and documentation use only generic 
names like io2_inv.

Best regards,
Jernej


