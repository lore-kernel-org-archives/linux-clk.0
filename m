Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF65C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:54:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8666564F1B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233844AbhBYQy1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbhBYQwY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:52:24 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59433C061788
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:51:40 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id b3so5927459wrj.5
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pC8GhdhL7FQzyqXKBARK8g3SpEQ7eUs8uU1WApnchic=;
        b=JNszVqasWRybdF5BPfiaCuQMheCTMfDfriRVZJWjKuwJ2E0sm0/dNmOePpPBohPaNe
         5pUTIEmXZj6LQuh+XRSwviI4m8nOuQ7HwbPHdnT2A15QAUzbNlR4Zv6/p+c7bbb1CbwA
         bNPU064gWYVMObYHH2lB9hVj75/SUsLlTsYbAsXrcg2mp3E63xKhHYrfsq2A+XS4vIMP
         uEbrzjHIDy++H8BfLHv+TArG7SC/n3J0UbSbjAmArv8ct6TNNef2KP5+Z0WPWeKZm3ZE
         ZZ7RpwK8dCsI28gROB5nCtcdTLXRCdLSSZAH1CUIvicTAUIkSzD/YPZ5ZAhi2vt4ewrR
         fYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pC8GhdhL7FQzyqXKBARK8g3SpEQ7eUs8uU1WApnchic=;
        b=D7thJr10IJf0EfR86tDalmKBbeC2ynbVjMxF3uH2bdt6hnXLMKMneMe4eoO7B15f69
         YqN4draannwn4ezK49xDNS2Dz4wPwVd/b8VP/REhyhMdK9ep6idbmY4GFjmhNFgxVhgp
         FNs7S2aTasepBiGVm4hHKFNNiVqYI8mdRTOPUuXltTVnw3ZgPDlTZ7UYGJoUq2LrNev/
         TRrdXEy2s0AonINZewYYQtX4KJWdno2vMfUZTlCVudK4ulZytSJ+FT48kjHxcf58SL/Q
         d6QaF7nJUguw0ePMCNMkAHBepCIImhwksKNcwulhyDvfgDUxPd8SjxolXjTtPdagXcWA
         Xyww==
X-Gm-Message-State: AOAM533HQNvZhPSmJagcUvkH1/u3scxhIbT0ENG1VgzxUE7Sk4/msWlo
        Qy+uR3a6PtR3TJJNiiIEGFSjZMQYAguYwoZYKcwe0A==
X-Google-Smtp-Source: ABdhPJwvIr51FEdcMlolg+/kkVFJSRrYfHL29cXZcfOelOKj1lJWo2tx8JJS8TlA+oHH861XElivlNjSOtVpt172Fds=
X-Received: by 2002:a5d:4e05:: with SMTP id p5mr4354391wrt.273.1614271899137;
 Thu, 25 Feb 2021 08:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-3-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-3-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 25 Feb 2021 16:51:23 +0000
Message-ID: <CAPY8ntApkdz_WjuBqgjXHRbE5AGvLUPup=bi2rTt94ssX_CTpw@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/vc4: hvs: Make the HVS bind first
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
> We'll need to have the HVS binding before the HDMI controllers so that
> we can check whether the firmware allows to run in 4kp60. Reorder a bit
> the component list, and document the current constraints we're aware of.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Based on my understanding of bind ordering this makes sense, but I
don't consider myself an expert there.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 556ad0f02a0d..0310590ee66e 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -303,12 +303,21 @@ static const struct component_master_ops vc4_drm_ops = {
>         .unbind = vc4_drm_unbind,
>  };
>
> +/*
> + * This list determines the binding order of our components, and we have
> + * a few constraints:
> + *   - The TXP driver needs to be bound before the PixelValves (CRTC)
> + *     but after the HVS to set the possible_crtc field properly
> + *   - The HDMI driver needs to be bound after the HVS so that we can
> + *     lookup the HVS maximum core clock rate and figure out if we
> + *     support 4kp60 or not.
> + */
>  static struct platform_driver *const component_drivers[] = {
> +       &vc4_hvs_driver,
>         &vc4_hdmi_driver,
>         &vc4_vec_driver,
>         &vc4_dpi_driver,
>         &vc4_dsi_driver,
> -       &vc4_hvs_driver,
>         &vc4_txp_driver,
>         &vc4_crtc_driver,
>         &vc4_v3d_driver,
> --
> 2.29.2
>
