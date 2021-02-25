Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAA1C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A31D64F19
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhBYQeZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBYQeY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:34:24 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48225C061574
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:33:44 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u14so5880541wri.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G2cSUhV7OUxUMk5qSy07VUBwxk9lklRNsyZPY32kgI8=;
        b=p1jkwkaI5h/XVThEivbWWWspomyHpT2Gokw3GOZCS3PQLYddseFcQymzokSqTCi6Kk
         CTQ4ZGDyNlkb+re9kAkM4PYR648hInyx2v11u/svHQrev+G9Z4jjms9zePrcYhh8Gb78
         idChY3UvpBo2FhWhu8TqIjXV2qRSQsOqF1eNgdfHk3Z5W2I+L6AJ/4ZISpyE1x95tEhu
         9qRTnnwKP+iGsZHUcKhrAv4enLrtS8dnCd4PHsIlXsQTd2dt+Ex4kf64st6ZLtvGT+CN
         gHWMR0xb4W6jhCS5k4B1EwcSVZg61XoQjf4YF8DMHCTsBdtwyt4GAm57BQBuh/oaDstg
         HFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G2cSUhV7OUxUMk5qSy07VUBwxk9lklRNsyZPY32kgI8=;
        b=U9k+Xfhzt0NGv1aFyvwhTfhyWKgQz6wb9THuZridgsE6qKXFl71RebMmZghGCfBT+U
         gX8KzwPLRul/km8Pg2EJechvVLBrU4BgWaLiZJWM5+aEVkhY3/xbnJl6QcHV6Q0l7+cY
         VHZc5iNJHSq4QrSg3pTMWl7IjMK0+g1ZUCrufz8aiyCeMyFALNqgf3QoU3N9eOZVSVvh
         j7xih4D3GxKvgN22cnzFCS21G4qJWPwc2mwGys9MtAgyntIesqXfvyVRLgYjwQmdeSD9
         rHyRK4TcAv5I2lZbHji1LwbFLQkuoPv/2tqkNFKyZH96BgMSHNe5PZDS1ZsOF01KPoHs
         wORQ==
X-Gm-Message-State: AOAM532n5ibZFxJkcktKsWtUeKctiAZgQfIV910M1jUrBmfU9QipP5jg
        hwkeo95n77+jdAa2vaStzyzu1HB+urKMVw7oGh9K/g==
X-Google-Smtp-Source: ABdhPJxFqHpRqTg/ikRH5F0cYOn1J9/3mhujcJCICFCjqRi2xHj8XK06k16lPzp8oJzYrl10abj89DOkz6en1IZ6Mn4=
X-Received: by 2002:a5d:4e05:: with SMTP id p5mr4283256wrt.273.1614270823048;
 Thu, 25 Feb 2021 08:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-6-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-6-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 25 Feb 2021 16:33:27 +0000
Message-ID: <CAPY8ntBYGjh9i0p7w=YVR4NEAc1pgknMtjM0PZGQWnbSysipog@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/vc4: hdmi: Enable the scrambler
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

Hi Maxime

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI controller on the BCM2711 includes a scrambler in order to
> reach the modes that require it. Let's add the support for it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c      | 58 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 ++
>  2 files changed, 61 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index f05f6da286f7..1a6babb53cf4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -35,6 +35,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_scdc_helper.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/i2c.h>
> @@ -76,6 +77,8 @@
>  #define VC5_HDMI_VERTB_VSPO_SHIFT              16
>  #define VC5_HDMI_VERTB_VSPO_MASK               VC4_MASK(29, 16)
>
> +#define VC5_HDMI_SCRAMBLER_CTL_ENABLE          BIT(0)
> +
>  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT     8
>  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK      VC4_MASK(10, 8)
>
> @@ -445,6 +448,58 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
>                 vc4_hdmi_set_audio_infoframe(encoder);
>  }
>
> +#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)

Something feels a bit funny here.
drm-misc-next already has a commit [1] that adds a define
HDMI_14_MAX_TMDS_CLK. Part of it is in the diff for 3/8. So is there a
need to redefine it in this patch?

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vc4/vc4_hdmi.c?id=24169a2b0533a6c4030c91a7a074039e7c98fde6

> +
> +static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
> +                                        struct drm_display_mode *mode)
> +{
> +       struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +       struct drm_display_info *display = &vc4_hdmi->connector.display_info;
> +
> +       if (!vc4_encoder->hdmi_monitor)
> +               return false;
> +
> +       if (!display->hdmi.scdc.supported ||
> +           !display->hdmi.scdc.scrambling.supported)
> +               return false;
> +
> +       if ((mode->clock * 1000) < HDMI_14_MAX_TMDS_CLK)
> +               return false;
> +
> +       return true;
> +}
> +
> +static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
> +{
> +       struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +
> +       if (!vc4_hdmi_supports_scrambling(encoder, mode))
> +               return;
> +
> +       drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
> +       drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
> +
> +       HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
> +                  VC5_HDMI_SCRAMBLER_CTL_ENABLE);
> +}
> +
> +static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
> +{
> +       struct drm_display_mode *mode = &encoder->crtc->mode;
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +
> +       if (!vc4_hdmi_supports_scrambling(encoder, mode))
> +               return;
> +
> +       HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
> +                  ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
> +
> +       drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
> +       drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
> +}
> +
>  static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
>                                                struct drm_atomic_state *state)
>  {
> @@ -457,6 +512,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
>
>         HDMI_WRITE(HDMI_VID_CTL,
>                    HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
> +
> +       vc4_hdmi_disable_scrambling(encoder);
>  }
>
>  static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
> @@ -901,6 +958,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
>         }
>
>         vc4_hdmi_recenter_fifo(vc4_hdmi);
> +       vc4_hdmi_enable_scrambling(encoder);
>  }
>
>  static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> index e1b58eac766f..6897586228ad 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> @@ -100,6 +100,7 @@ enum vc4_hdmi_field {
>         HDMI_RM_FORMAT,
>         HDMI_RM_OFFSET,
>         HDMI_SCHEDULER_CONTROL,
> +       HDMI_SCRAMBLER_CTL,
>         HDMI_SW_RESET_CONTROL,
>         HDMI_TX_PHY_CHANNEL_SWAP,
>         HDMI_TX_PHY_CLK_DIV,
> @@ -234,6 +235,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
>         VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
>         VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
>         VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
> +       VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),

Nit pick: the rest of these registers are in numerical order, but
these new additions aren't.

  Dave

>         VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
>         VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
>         VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
> @@ -313,6 +315,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
>         VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
>         VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
>         VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
> +       VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
>         VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
>         VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
>         VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
> --
> 2.29.2
>
