Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3F6C38A2D
	for <linux-clk@archiver.kernel.org>; Wed, 26 Oct 2022 15:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbiJZP2P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Oct 2022 11:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234546AbiJZP2O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Oct 2022 11:28:14 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0162B12FFB3
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 08:28:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id f27so11698714eje.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F6j1fHe9OYs4e+5UqU3Og3KPmdDBG92hQv3wiQCuJoA=;
        b=kWE3JZ1ps1qMWp6E0WTYFDG5RgPeN0Ibtu1R/f81JmR5OjPwN1QedbbuJQO+F0r3Du
         B5wvmn+JzhXgiHl3FJrdOjv8u0gWeNfoTW6/FvqbRLTMM4RofN/Z5q6kGkvmpFyxgV0R
         twTuJQrEEVetK9ZsaW7Qwgbpk7jx1ULTaEko7L5vjRPb3vNvAgjXp7BVBlUw3EnhKBTo
         Acsx92BI6QFMvGI3qqNfsqdpW/yd4bLW4e5e0g/c12IFbjC+hjorj8UtYB8Ig8NNbC6G
         ATHmRLI4nXUw638h3aB8SAVeTRCf6BIvolek3NzKK9jF7iOL0BLpEtANPFWIiZOAp0d8
         n+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6j1fHe9OYs4e+5UqU3Og3KPmdDBG92hQv3wiQCuJoA=;
        b=0/1LgFBfxydsY5EfnOZxGpdAQvr1STIOlFSaph7LxqOUW/bnevIrfyffBxJQkSZBzF
         waX//aMJ9GFkfSh4jgN1rW4iAUimYKDCIEnqjTgb4mfAzTjNommgKimrzv6q6/IOJ1H2
         GIpxD1OhxNiBIo+86ZYBRO1ZOZhjmck572F54D15RKt1oOz4pU3IwxMFej8Jc2Ae3Inp
         0AuH2hxDHGrwUqm+cYYwzEpJdMM7cXpvj7tIlTQeeMHjBbIXxHFL7kQ1alhNf/xQ05Ej
         utYgq83C/lN09KZrAE41okmK4cfFQCnMuXNRs/0lEi4v3ld2V0pF6P+30RNRYdjJsq/u
         vA0Q==
X-Gm-Message-State: ACrzQf3vLnn1ZssMgx85xNbD5uTvUDwldT8gJhRgwNk72cXu3N37EDjd
        smxPuaGndW05IoABxMozlCyA/vN3y5ZTDm/l8NkBlw==
X-Google-Smtp-Source: AMsMyM7BgPlT1A2MOolxTVgE09nfjQjy9z4UQ54xIVZG4n7rTCJvLVDsOsKobk4izQ/DmWdHnJsxKdztGQlQfjOQipo=
X-Received: by 2002:a17:907:1c98:b0:78d:3b08:33ef with SMTP id
 nb24-20020a1709071c9800b0078d3b0833efmr39091535ejc.175.1666798091611; Wed, 26
 Oct 2022 08:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech> <20220815-rpi-fix-4k-60-v4-4-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-4-a1b40526df3e@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 26 Oct 2022 16:27:56 +0100
Message-ID: <CAPY8ntAkzWOy0fk4ojtKW9k7asH1zOYygoU8B_=yJjm7Ni7isw@mail.gmail.com>
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

On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
>
> In order to support higher HDMI frequencies, users have to set the
> hdmi_enable_4kp60 parameter in their config.txt file.
>
> We were detecting this so far by calling clk_round_rate() on the core
> clock with the frequency we're supposed to run at when one of those
> modes is enabled. Whether or not the parameter was enabled could then be
> inferred by the returned rate since the maximum clock rate reported by
> the firmware was one of the side effect of setting that parameter.
>
> However, the recent clock rework we did changed what clk_round_rate()
> was returning to always return the minimum allowed, and thus this test
> wasn't reliable anymore.
>
> Let's use the new clk_get_max_rate() function to reliably determine the
> maximum rate allowed on that clock and fix the 4k@60Hz output.
>
> Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rate allowed")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 64f9feabf43e..87961d4de5aa 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -46,6 +46,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/rational.h>
>  #include <linux/reset.h>
> +#include <soc/bcm2835/raspberrypi-clocks.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/hdmi-codec.h>
>  #include <sound/pcm_drm_eld.h>
> @@ -3429,7 +3430,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>
>         if (variant->max_pixel_clock == 600000000) {
>                 struct vc4_dev *vc4 = to_vc4_dev(drm);
> -               long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
> +               unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
>
>                 if (max_rate < 550000000)
>                         vc4_hdmi->disable_4kp60 = true;
>
> --
> b4 0.10.1
