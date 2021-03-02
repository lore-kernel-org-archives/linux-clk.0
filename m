Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E300C433DB
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:25:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE1F964E87
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352750AbhCCEOB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Mar 2021 23:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1578599AbhCBPZZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Mar 2021 10:25:25 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C720C061794
        for <linux-clk@vger.kernel.org>; Tue,  2 Mar 2021 07:10:54 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o2so2598554wme.5
        for <linux-clk@vger.kernel.org>; Tue, 02 Mar 2021 07:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iXOLlDxgBV9CPVsJZhCVv2ZAjJMGwcQADbotLvfbenk=;
        b=S+M6qzZ7yCmHcy3il0rDzNS/Vlzq84AvNlMDXuGTEwX6ZJ9wa7uAgNCDxFnAr04WKk
         +XEHnKh+yg3E3Ppd7Jjdh/DwXO9Dn99pRYfrQjREe0W/zmG8CwLz9NxzK2x94OfLMJtE
         2RyfT0UVnZB4jCrpDyLXl7kkibonIrCQRZFzBokWzByp3YJqOLsQzjdRHcGaaMRAiKz/
         zmmmyoQ6rkaubYyoG9MN9MaJDioEi3dEsLDRY2I0CTn/8/nvogJroDKMvz0CvXaeUNzx
         6R8dkZ1WVVc+3Y2jAkUfQRL3SUFjMB0JvUvX8eD7tPqypJC5bVz6kE/vpWuMROxIzQaR
         +/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iXOLlDxgBV9CPVsJZhCVv2ZAjJMGwcQADbotLvfbenk=;
        b=kImUR7/nN+b8RGZ91IHAXCewdyZMqAWBb6vw9wd+YU1CQBbpXHk4dv4sxYJDzvcB3U
         00acGegVbNSVBj8O4NW7wZ3x8pFB06gSPChg0iOpL2lMz5jc8dmUEW+A0R0b2nKZXjFY
         adL+gwk7yzmZSv58s6//Al/35q02haMoZDwC+OJyye+f9/Pbj6TDwpSDv7utF7y/rssp
         q3OsHPmWxlOtv6FPorktVGBAlz9Ii0S1R3QgrXncUmkN8b1AFqVALScbpCMjfMTo9P/9
         P+AV13NZr2+SNd1cRBkL7ZlTh1feBbRyHyJB+2ai5rkBZMLW2MbBCltHqPZ17KcYkvSA
         nYvQ==
X-Gm-Message-State: AOAM530GUIsovUPJpwJpWxenfnLD2jccJXmkSTs4DbC/ui3W+GN+iEDL
        XmlQhVg3EiX5psRfxhlru0QfygHvb1b/hXo465ZsQw==
X-Google-Smtp-Source: ABdhPJyAoGvTCSUcVybeiOLq0BiGe/yxxG90GrRzZerwITF1bUCaDidNmZLCBCAQSjq4LRzRo8HrnjteTLi1tMeDZRI=
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr4336707wmo.183.1614697852764;
 Tue, 02 Mar 2021 07:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-5-maxime@cerno.tech>
 <CAPY8ntDwQG1Ax8wgc2zZMKZgXk2+efBtFFiu7YF=_RX4Y4YUiA@mail.gmail.com> <20210302130154.o4ljnzqjr3gfsvpn@gilmour>
In-Reply-To: <20210302130154.o4ljnzqjr3gfsvpn@gilmour>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 2 Mar 2021 15:10:37 +0000
Message-ID: <CAPY8ntCh510mg_J7+2J_d1bd1Dgd+q8rGwfM4D9nA63z1-DFtA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tim Gover <tim.gover@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 2 Mar 2021 at 13:02, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> Thanks for your review
>
> On Thu, Feb 25, 2021 at 04:38:37PM +0000, Dave Stevenson wrote:
> > On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > In order to reach the frequencies needed to output at 594MHz, the
> > > firmware needs to be configured with the appropriate parameters in the
> > > config.txt file (enable_hdmi_4kp60 and force_turbo).
> >
> > force_turbo isn't the right way to go about this as it permanently
> > bumps all the clocks up, even if running the display at VGA.
>
> so enable_hdmi_4kp60 is enough?

No, but force_turbo=1 is the wrong way to go about fixing that.

I'll start a thread with Dom & Tim to discuss the best way of doing
this. Immediate thoughts are that either vc4_hdmi needs to request the
core clock be increased, or potentially the firmware could note the
boosted BVB rate and increase core accordingly.

  Dave

> > > Let's detect it at bind time, warn the user if we can't, and filter out
> > > the relevant modes.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++++
> > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
> > >  2 files changed, 25 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index b5bc742993a4..f05f6da286f7 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -953,6 +953,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> > >         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
> > >                 return -EINVAL;
> > >
> > > +       if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
> > > +               return -EINVAL;
> > > +
> > >         vc4_state->pixel_rate = pixel_rate;
> > >
> > >         return 0;
> > > @@ -972,6 +975,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
> > >         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
> > >                 return MODE_CLOCK_HIGH;
> > >
> > > +       if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK))
> > > +               return MODE_CLOCK_HIGH;
> > > +
> > >         return MODE_OK;
> > >  }
> > >
> > > @@ -1986,6 +1992,17 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> > >         vc4_hdmi->disable_wifi_frequencies =
> > >                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
> > >
> > > +       if (variant->max_pixel_clock == 600000000) {
> > > +               struct vc4_dev *vc4 = to_vc4_dev(drm);
> > > +               long max_rate = clk_get_max_rate(vc4->hvs->core_clk);
> > > +
> > > +               if (max_rate < 550000000) {
> > > +                       drm_warn(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
> > > +                       drm_warn(drm, "Please change your config.txt file to add hdmi_enable_4kp60 and force_turbo");
> >
> > Do we really want to warn in bind? Again you could have a VGA
> > resolution monitor attached but that would trigger this warning.
> > Can we warn (once) on processing the mode list and filtering out a clk
> > > HDMI_14_MAX_TMDS_CLK mode instead?
>
> That's a good idea indeed, I'll rework the patch to do that
>
> Thanks!
> Maxime
