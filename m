Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09504C004D5
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 17:33:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B97E9216FE
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 17:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="S2TusLdE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97E9216FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbeI0Xwx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 19:52:53 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39394 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727622AbeI0Xwx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 19:52:53 -0400
Received: by mail-io1-f65.google.com with SMTP id l7-v6so2500849iok.6
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upAJt5JjsEgGTilofDZiD86RdDDV65fhE/GZVLweSb0=;
        b=S2TusLdE8JZ6ESOnPh0LrIoOmccKHutEZrOh/2aUG64VevNUTYHWw0S0xsLyGWUN7a
         /77n2nmov7k010m3AAss5fzv5jEp6ICpN81KXilcpzQe5czqsJg2MQPvcH1h8bQy/COP
         Im8cnFqeRzKwba8QM76ZmCJJ7JHEn8wWvLS6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upAJt5JjsEgGTilofDZiD86RdDDV65fhE/GZVLweSb0=;
        b=bzHPAs54y+ddpwDQmJd5Wo5NtPZF8bWGvcB6IozE9zQG5x6UfybHgp6iK0q5uXgAD0
         FfSBxVZT+cuan57o/thYiDezIidVltkVPalu6DWDxmriQ99NbPG8jT1LyhIzf5UcuaLw
         3FekXk8R+vYaFS/H7FhOi88KtNtUr/It5Am7MerqHxBJKlICgN/kZsA/SjQ+cKeb81Af
         F9dFlzZC+Zb2qACgkjiSIni92hBQPNatkE5EdDs6SDPdvIKCn+9x2MSL8KcMQVpxjpMw
         G6aF01GfPx6wahcRHMl5H0i7WEpJb1x33zaH6IXOEsLXRIht+rmofLzGty7ftMzafmIh
         pvWA==
X-Gm-Message-State: ABuFfojai39sgw2deBqMrDy6icFegWTcCmOr3cX22Q2Yc1a7SA8bl19r
        LTpPm90cBa9DhAPv7LL2jfbYqKEHZD8GzNYaxwuRww==
X-Google-Smtp-Source: ACcGV62KkXKtpm9wv91Zp8lFzxWZLFyntZG0gPQUgEGUPxcD7A5crbOJQxbOKsCEKuGp9iNpx9g0+ojFnqI3GBHywOE=
X-Received: by 2002:a6b:94c6:: with SMTP id w189-v6mr9927312iod.252.1538069611588;
 Thu, 27 Sep 2018 10:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-9-jagan@amarulasolutions.com> <20180927171451.7iqt2nt2log5qojf@flea>
In-Reply-To: <20180927171451.7iqt2nt2log5qojf@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 27 Sep 2018 23:03:19 +0530
Message-ID:
 <CAMty3ZDxpLwVDsgVMjX+6+uz89sQ1aZaXHHZ+-5aogrA4MHmqw@mail.gmail.com>
Subject: Re: [PATCH 08/12] drm/sun4i: sun6i_mipi_dsi: Refactor vertical video
 start delay
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927173319.qjQ5B-ZIk3iHGQZxxBhlYId7Z-1Oz9J-9BbDbggr-JE@z>

On Thu, Sep 27, 2018 at 10:44 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Thu, Sep 27, 2018 at 05:18:46PM +0530, Jagan Teki wrote:
> > Accordingly to BPI-M64-bsp DE DSI code Video start delay
> > can be computed by subtracting total vertical timing with
> > front porch timing and with adding 1 delay line for TCON.
>
> This is what the current code is doing as well.

The current code
return mode->vtotal - (mode->vsync_end - mode->vdisplay) + 1;

(mode->vsync_end - mode->vdisplay) = front porch + sync

but I'm updating here only front porch.

>
> > This patch simply add the start_delay logic from BPI-M64-bsp,
> > w/o this new computation, the DSI on A64 encounter vblank time out.
> >
> > [CRTC:36:crtc-0] vblank wait timed out
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 9918fdb990ff..217db74c6dc3 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -358,7 +358,17 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
> >  static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
> >                                          struct drm_display_mode *mode)
> >  {
> > -     return mode->vtotal - (mode->vsync_end - mode->vdisplay) + 1;
> > +     u32 vfp = mode->vsync_start - mode->vdisplay;

let me explain this.

Actual code from Allwinner
u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;

So,

=> (panel->lcd_vt - panel->lcd_y) - (panel->lcd_vbp)
=> (front porch + sync + back porch) - (back porch + sync)
=> front porch + sync + back porch - back porch - sync
=> front porch
=> mode->vsync_start - mode->vdisplay

Hope it clear.
