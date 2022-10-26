Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4831C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 26 Oct 2022 15:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbiJZPgY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Oct 2022 11:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234178AbiJZPgX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Oct 2022 11:36:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83720AB801
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 08:36:21 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id b2so22375631eja.6
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zdp2ORX7WoL3+/L2v2AZBOSfN5mm7SO9qaZf5T9g988=;
        b=ZL7ULLibpv3kb+fTEC/HD6x1VsSdtBqfXjzW1U/C9cLItf8gtkJMNTylam+gYlZySo
         ozJ3Q4RVRoAjDnhva6InEDjapR6zlDYwwn6xTLU9u8CxZNOi2HDalFUhThk7jOjngjqd
         fyA3tGE3GnzBdF8goC+GMacNeuqhNJv2NwCwLO6TiCQpwJhMqGL3FSz8A2JpNzcqKEvC
         1Y6XSZVs3c4ceBwi63LjZieDRp39WfMRAXARSU0dFpfbiaScI7HUeu3SVaW1uMWRO5UZ
         dyJB4CPrkrwqW/O2AGMYnAOxLWdhLApMFPb8p349QsSj4yhYkNxE4mI1gFyCUsNf7Ndm
         yUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdp2ORX7WoL3+/L2v2AZBOSfN5mm7SO9qaZf5T9g988=;
        b=kAIGXDiDJzuSb0uulqg1dB0QqO3mdibsIDhfM+DXrhSmd26AtcHPINCgte886/M+NJ
         mvaD5k0yObr9IZ0wyBBjQVJ3dIFmCX+vjP1R3sJo1OMUHmvhRwzJA70lFd3nnpIat4sr
         OLAsd9td7ExR/650DwnmaLR3g/EbksCJn6rCCZhjG8htlXRcPRVssxlcD5P8+M612L5S
         24A3jIhmSzVueAZP+1lpGu+1EN8LO5pOLt9UXRgoEw9FTWZp+F3DEw0osKEC1+QdMixK
         Io/q0/tE9mLY/lYtEXx0+sVzDY0tq7plNSKkwCTXpftcBlOusyDbF7u0hOP2jAKsM5yQ
         /jHw==
X-Gm-Message-State: ACrzQf2KJLIKQP98Sq3SLPntQwRcUJ0Ms46tS+LekrnnruH7GyRpsVPC
        +37VKany2bvl30fLFoHS4VPQ2Rrocl4mzldbYqGakQ==
X-Google-Smtp-Source: AMsMyM7TPvEd60+h0t9kjHq7KzB06CNBHLWAx73bGFnzp+46lHrBkvGIe264MDar29BQGZOBLk/rI+/W6JDtwAdmHfs=
X-Received: by 2002:a17:907:94c7:b0:78e:1c4f:51f9 with SMTP id
 dn7-20020a17090794c700b0078e1c4f51f9mr39632426ejc.200.1666798580075; Wed, 26
 Oct 2022 08:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-4-a1b40526df3e@cerno.tech> <CAPY8ntAkzWOy0fk4ojtKW9k7asH1zOYygoU8B_=yJjm7Ni7isw@mail.gmail.com>
In-Reply-To: <CAPY8ntAkzWOy0fk4ojtKW9k7asH1zOYygoU8B_=yJjm7Ni7isw@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 26 Oct 2022 16:36:04 +0100
Message-ID: <CAPY8ntB1bgHVFMAYP62oGXPUwL4YkGMkxWJaoHLeNW=G1rj+Hw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
To:     maxime@cerno.tech
Cc:     Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 26 Oct 2022 at 16:27, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
> >
> > In order to support higher HDMI frequencies, users have to set the
> > hdmi_enable_4kp60 parameter in their config.txt file.
> >
> > We were detecting this so far by calling clk_round_rate() on the core
> > clock with the frequency we're supposed to run at when one of those
> > modes is enabled. Whether or not the parameter was enabled could then be
> > inferred by the returned rate since the maximum clock rate reported by
> > the firmware was one of the side effect of setting that parameter.
> >
> > However, the recent clock rework we did changed what clk_round_rate()
> > was returning to always return the minimum allowed, and thus this test
> > wasn't reliable anymore.
> >
> > Let's use the new clk_get_max_rate() function to reliably determine the
> > maximum rate allowed on that clock and fix the 4k@60Hz output.
> >
> > Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rate allowed")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 64f9feabf43e..87961d4de5aa 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -46,6 +46,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/rational.h>
> >  #include <linux/reset.h>
> > +#include <soc/bcm2835/raspberrypi-clocks.h>
> >  #include <sound/dmaengine_pcm.h>
> >  #include <sound/hdmi-codec.h>
> >  #include <sound/pcm_drm_eld.h>
> > @@ -3429,7 +3430,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> >
> >         if (variant->max_pixel_clock == 600000000) {
> >                 struct vc4_dev *vc4 = to_vc4_dev(drm);
> > -               long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
> > +               unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);

Actually minor nit:
rpi_firmware_clk_get_max_rate returns an unsigned int.
AFAICT we don't need the range of unsigned long in any subsequent
code, so I think it could just be unsigned int here.

clk_round_rate returned a long, and therefore previously it did have to be that.

  Dave

> >                 if (max_rate < 550000000)
> >                         vc4_hdmi->disable_4kp60 = true;
> >
> > --
> > b4 0.10.1
