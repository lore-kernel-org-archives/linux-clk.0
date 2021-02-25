Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F43C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1124464E83
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbhBYQxT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbhBYQu7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:50:59 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94348C061574
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:50:17 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id u125so5423764wmg.4
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ujtq4Dq47uF2eTEGpffKSWLYbYoXaFOz7LZhMGMgJmo=;
        b=ryg5umGlDRp6y1sOQMhcEBBz9zkU36sVN1nEaT2XCjPSbBuErpKioDj7ge/NrTkygh
         04qPq9nQ1h+hMy9XTwEwcATvf39Z64gGNeu1k6fkIDFmUhIQVIl56+PPMlWcAINbvyku
         JLkASHT7Sx67EeAXx3NYxnOi7wdxohuGMdhpuJa4wE86LIWIbQxhOhUnYRq5gnkzuHeI
         Dhr1dQTKOpoqGAuqJrutZgOkI/LGuBDAcwHdWq/DmWhwbv+8zZQzR9EVODcS2sn5lrhB
         nKJYptojkdt6a2eEfewwcFIkv40rANfQT4cP8oYXt2rbzLsXIIa8RasVs59ukg5oyn0C
         hZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ujtq4Dq47uF2eTEGpffKSWLYbYoXaFOz7LZhMGMgJmo=;
        b=BV36bmT+WxfF2quPO+YY3CMHhV56/Xfcmn7c3NzLJFptiJVdNPQnRiWoa132dynVZD
         3k2PRAdsGeCFr7Am6Iuz45k7tKzeY4PZ00bGcMbvtRc0Gj4NUmbv5LDMt4YfGX0oVzSO
         bFzlE8RVeEjqiDRY9B4IVLTh9bPGs1SR4WHmm+XJ67ABWWsBTuoseRyb3HxIK465NzVK
         VnabQ3OHMzsVxnjpWpjeVupeA5CyY3KDStpaLcnGLzHltkZ6T3ZkItrl/EMFUx6L/XE9
         tINhSBS4qqrnP9c9xwpWK+pNNxkcBdgqC27zBmGyi1pc0Ep2gyrPtG0+lBzyHCivDyQ2
         SObQ==
X-Gm-Message-State: AOAM530W/7zsi7AgwraBVpo9pck6zPe9JUrBwIGUwkVkHqZ7abjkM2Dv
        9XzW3LHmc0tEdypNiMSCuS0YBOv/FpbMHtJ8EIBUxQ==
X-Google-Smtp-Source: ABdhPJxZqSZhEEKMJ++j9qXWBx8PHurKD3HHd01rqa+Uwo1VLRjo9ks0dRY4UTLj3KZLtNP2UAdHMe//su/KOGVkytE=
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr3932948wmo.183.1614271816426;
 Thu, 25 Feb 2021 08:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-8-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-8-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 25 Feb 2021 16:50:00 +0000
Message-ID: <CAPY8ntBtL=mbz1-4yOcaJg2kiawk_1sosDY1Aa0dL=en7W3e9g@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/vc4: plane: Fix typo in scaler width and height
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

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Again no commit text body, but possibly not warranted

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 4a075294ff4c..5e8b7f72dc05 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -912,9 +912,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
>                 if (!vc4_state->is_unity) {
>                         vc4_dlist_write(vc4_state,
>                                         VC4_SET_FIELD(vc4_state->crtc_w,
> -                                                     SCALER_POS1_SCL_WIDTH) |
> +                                                     SCALER5_POS1_SCL_WIDTH) |
>                                         VC4_SET_FIELD(vc4_state->crtc_h,
> -                                                     SCALER_POS1_SCL_HEIGHT));
> +                                                     SCALER5_POS1_SCL_HEIGHT));
>                 }
>
>                 /* Position Word 2: Source Image Size */
> --
> 2.29.2
>
