Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5020EC43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 16:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8459216FE
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 16:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ouJFqEan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8459216FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbeI0Wjr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 18:39:47 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:50623 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbeI0Wjr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 18:39:47 -0400
Received: by mail-it1-f196.google.com with SMTP id j81-v6so8651426ite.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1VeUtHWJ3hOtNfiEHSMOXor7IJiBoxL53Ef0kdq6OmY=;
        b=ouJFqEanR0LXNdZwbHwVdWHvYWycT3QG5ko6/tkZsgU2VfeIC3c+hsRqqsZUu9Tyjg
         Xc/EGSieyzJvvFbTNmyyJZC1YGSUpYXv9Rk/hC8Wd7PE3mUpmmBLSrrZX8h+E/7WTBvC
         xGFUg/InUIfFV5BsyuJwMv8MYleOH0bO52tNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1VeUtHWJ3hOtNfiEHSMOXor7IJiBoxL53Ef0kdq6OmY=;
        b=Y6rts0CliuMzTB43o/CKZqnrA5Z9R1JMvsybC5f4vSpNazomLqD9tO03WQpxrh0UpG
         czRDK1leRVlC+7FWXI/yd3N0KcTq4XwbRdcX4HJRINuu4ikpxRTTMpsMx2kvSRLgKSIi
         8+eIgP9cq68bN3uRmALG4QMktbn3pUlLIftV8NEZLe99KPwmMBqtIZu8+nAvaMpQA2c7
         oGk0k8r97TR6pbEMaAVdD4X9U3B0taiRaPX/rtS3zyh7dXClcK0bAQCI9eKudbFNYwd5
         /CDqkAIqXCM1H196c4wA6eg+JsoD01zSagTOw77YqJP8lcXl+/sRzN7dmYNgUZy7ghne
         kt5g==
X-Gm-Message-State: ABuFfohlyfKciHmKz6FajdJRfWwTuJi5BLbBOOROEQcmfG6a7VQsO3dh
        hLOLi/rSVt6+6VWz0oPCdhuu6GNal0XEjvb75Y3kmQ==
X-Google-Smtp-Source: ACcGV603XjvQBcuXF8BUeqBg3UhyEiugcdBAXPKq57gRju76W56Aap6+J83Ua+wd4cI+VJmL8TwvD0miXnH7z+lg9pA=
X-Received: by 2002:a24:5214:: with SMTP id d20-v6mr7771107itb.24.1538065245874;
 Thu, 27 Sep 2018 09:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-7-jagan@amarulasolutions.com> <20180927152126.vovnvwmqdfpuxgdm@flea>
In-Reply-To: <20180927152126.vovnvwmqdfpuxgdm@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 27 Sep 2018 21:50:34 +0530
Message-ID:
 <CAMty3ZABx9Fod5W_T7JciZEsn7jGvuM-LsBFATdA=hQ2CVwELw@mail.gmail.com>
Subject: Re: [PATCH 06/12] drm/sun4i: sun6i_mipi_dsi: Fix VBP size calculation
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
Message-ID: <20180927162034.vOFWzKyndWqWVDooT_HtzNk46RvXX-31W4bL4vZaw34@z>

On Thu, Sep 27, 2018 at 8:51 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Sep 27, 2018 at 05:18:44PM +0530, Jagan Teki wrote:
> > According to horizontal and vertical timings are defined
> > per the diagram from include/drm/drm_modes.h
> >
> > Back porch = [hv]total - [hv]sync_end
> >
> > So, update SUN6I_DSI_BASIC_SIZE0_VBP calculation as
> > mode->vtotal - mode->vsync_end
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 1c7e42015645..599284971ab6 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -526,8 +526,8 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
> >       regmap_write(dsi->regs, SUN6I_DSI_BASIC_SIZE0_REG,
> >                    SUN6I_DSI_BASIC_SIZE0_VSA(mode->vsync_end -
> >                                              mode->vsync_start) |
> > -                  SUN6I_DSI_BASIC_SIZE0_VBP(mode->vsync_start -
> > -                                            mode->vdisplay));
> > +                  SUN6I_DSI_BASIC_SIZE0_VBP(mode->vtotal -
> > +                                            mode->vsync_end));
>
> Is it purely theoretical, or did you find some source that back that?

VSA is done as per that, sync_end - sync start would give sync time.
VBP also done in BPI-M64-bsp[1] which results back porch existing code
results fron porch.

[1] https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c#L955
