Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C943C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 17:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C133A64F13
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 17:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhBYRQx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 12:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhBYRQs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 12:16:48 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBAAC061574
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 09:16:07 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r3so5992357wro.9
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 09:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pgcY/OZF65ERBl6MAK6W0hY0CpUqOvXRa/TDDVIblrs=;
        b=Zvr95u8GzHK4DYlgfOFC4q5TZH1ZlqlxSXULVyDhVfyFnWIaKJsaHiWjQc0YTz4yaI
         BRUtwJSUC8NzJ2TsM1j6CHT6Ykr6rYPFS0HVcn4KFhRQmZTfEvxzQ+QkTdfdcJD7iIwi
         BDOMs35CANJbfFK/EbSGBJoM4MAim9TuKfa9i7feeDcbl6fhlqe5MBtzKKzZiaa4LF0T
         ppuVdkQHuHVQHQD3MplBqeHh8AXqEKHiOhzkE5uoPwTv0qNWbD8ZUNcC9yzKWvYPKJLr
         3UDwV51qh8RjaATBxBzMs3iE+GwBvGJQHPSiDjNZhr6eA2fTAx+OgS7UmM1cKtIPRWs3
         lVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pgcY/OZF65ERBl6MAK6W0hY0CpUqOvXRa/TDDVIblrs=;
        b=lFQ23g0t4Jbogws0h1D4V0GAx0NTSswkbmG7DsQT+FHCkETk5kAospAuL1Kb2FAaHi
         ttwexjaY4Ax2gX9OC1xPA3qHr7FQh86bHl+4ZqtkH5nH+wVe8RFYZVBlq2tDX91A0jF6
         5o4Hnii75zKAnWDzTK6iKGIJa4Pscpy4BPBGUghcMpDn+tQ3Q6Y15LUnQj+IlLRsF1cp
         1Mwcb5OlWhyEl/EzkygrKVmabPfE1KtSVPuzFC6jmAnnzJC8acDCAvE+ZVdhN0CV7U1X
         z1s/B9stMo+T4CqE77XxBUh7kviKsJG/pD4a5UbeZaWgthDSSLle78W0vxvAnk5AsIkq
         w5QQ==
X-Gm-Message-State: AOAM533y4BPZ1nE6Ef7rn1THbLoDmTFLmszA+fD6m4kuom4NG29kXj3L
        TcKJvhYg/MHjCV9NaSbsTfrdYGTMhnx3q+iMjU1k5g==
X-Google-Smtp-Source: ABdhPJzvaaIvsIuZY81xtukaleNmpcL7+wykHbOc4CXehrpeggQQBtBruvil1QLIyGhO/rwHf1v7B3hxb6w/IvNSkJY=
X-Received: by 2002:adf:f681:: with SMTP id v1mr4592118wrp.150.1614273366172;
 Thu, 25 Feb 2021 09:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-4-maxime@cerno.tech>
 <CAPY8ntDMm_o8O-SOk7Tkh=yh5czQ0iS37p==DyhxBVPVmriGWw@mail.gmail.com>
In-Reply-To: <CAPY8ntDMm_o8O-SOk7Tkh=yh5czQ0iS37p==DyhxBVPVmriGWw@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 25 Feb 2021 17:15:50 +0000
Message-ID: <CAPY8ntDOwhT7XC4v=HNxy8D0mCc03wJKu+xV3coFNxCkE7abSA@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/vc4: hdmi: Properly compute the BVB clock rate
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

On Thu, 25 Feb 2021 at 16:44, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Maxime
>
> On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The BVB clock rate computation doesn't take into account a mode clock of
> > 594MHz that we're going to need to support 4k60.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index eee9751009c2..b5bc742993a4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -91,7 +91,6 @@
> >  # define VC4_HD_M_ENABLE                       BIT(0)
> >
> >  #define CEC_CLOCK_FREQ 40000
> > -#define VC4_HSM_MID_CLOCK 149985000
> >
> >  #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
> >
> > @@ -739,7 +738,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
> >                 conn_state_to_vc4_hdmi_conn_state(conn_state);
> >         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> >         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> > -       unsigned long pixel_rate, hsm_rate;
> > +       unsigned long bvb_rate, pixel_rate, hsm_rate;
> >         int ret;
> >
> >         ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> > @@ -793,12 +792,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
> >
> >         vc4_hdmi_cec_update_clk_div(vc4_hdmi);
> >
> > -       /*
> > -        * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
> > -        * at 300MHz.
> > -        */
> > -       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
> > -                              (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
> > +       bvb_rate = roundup(mode->clock * 1000 / 2, 75000000);
>
> Minor hesitation here that I would need to check the hardware over.
> As I read your code, if the clock falls 300MHz and 450MHz then you'd
> ask for a bvb_rate of 225MHz. Depending on what the source clock is
> that may not be valid.
> The firmware goes for 75, 150, or 300MHz only.

The information I have says it has to be an integer divide of 600MHz
(PLLC @ 3GHz / 5), so 225MHz is not valid.

(Minor contradictory information though as PLLC is bumped to 3.3GHz
with enable_4kp60, but we still appear to get 300MHz for BVB after the
/5. A little more checking warranted around here).

>   Dave
>
> > +       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
> >         if (ret) {
> >                 DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
> >                 clk_disable_unprepare(vc4_hdmi->hsm_clock);
> > --
> > 2.29.2
> >
