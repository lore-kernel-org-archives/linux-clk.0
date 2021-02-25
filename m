Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCD5C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7856664F0D
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhBYQjf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhBYQjf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:39:35 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC84C061574
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:38:54 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d11so5879433wrj.7
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e+HMCPKo8jukqE6muWYS/MvNE0zd3FwHLxo7lcUmejQ=;
        b=U6/eMioLvfuOpfMtGgJpjZKrXkxyyBFg4kxc5xJkVOcAvI5wd6Y4yDnsadmnHOrwAo
         z3MKOhlOFY4sqNGPI0H3coleNgViqehQtv8gEXHgk0XrnqAA4WaIpHhoVVkpK3OXoyOJ
         biAd/lKGVp6NJda5NIm3HUgrMnaIYR38zB3WHNsfOEQ3A6Oamz1V8YDWQuLHepsvoB44
         QvipjXBkpHrqpGoOhEpvKqdoOST0x61Ws/M721LBM99BEE7J2YWsYBXQqMvBzrjXAP7R
         Pf7AEC8T9FBAV7g+6DK15ICnlqwApEAHPxQXJbpeV4kmXWGZJqk0W8rf7BeOxIALbYjV
         /fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e+HMCPKo8jukqE6muWYS/MvNE0zd3FwHLxo7lcUmejQ=;
        b=HicHIQTu/Reljl3ixiC/2TtEkPSz24Xmpf4qSxJ7VwkEn3B+idKHq3IRSssIEfrkLY
         DAgjo5uw841l0pMp9jp1FvNdJKUZorbt0foXp6OCQ3IIerIP0JDbF74/f+sXbT8/BuNQ
         BxLdrI1N5IK33snP8zTEbsfO6NiD9mO22w3P0FLglxZ/wZgwtOZUTvJfAhwoyeEptrfl
         CfuhMRvsUOvFwfwBmPyHnKd0JU8o33OVLxSQuPYnE683jq+SZ72VVz44nNTY1tkiXPo8
         cNzPJdQMGER7305cb6nyC3OnTqkywq+g/zUYkWQ1DyBLZp1iPLVRCVPyALclTS5FY7fr
         GZww==
X-Gm-Message-State: AOAM5338f+bJsWThO0o1sSzx/vJg3ECheHYtW1LxpEGD3zgEL2r6kmil
        NoQ6e8mEJVHHRkE7jeoQU2iNK+3jevOFvZnkLTb8nvYpJhk6Hw==
X-Google-Smtp-Source: ABdhPJw9hCt0clHdCEKhUwceEuvI+jlIHmLo7tu/s2LP0kKZc59ewxGhhHgMzFlYozVNSoBo3lEhnOBb7Od9BhziTas=
X-Received: by 2002:adf:f681:: with SMTP id v1mr4432438wrp.150.1614271133038;
 Thu, 25 Feb 2021 08:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-5-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-5-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 25 Feb 2021 16:38:37 +0000
Message-ID: <CAPY8ntDwQG1Ax8wgc2zZMKZgXk2+efBtFFiu7YF=_RX4Y4YUiA@mail.gmail.com>
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

Hi Maxime

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to reach the frequencies needed to output at 594MHz, the
> firmware needs to be configured with the appropriate parameters in the
> config.txt file (enable_hdmi_4kp60 and force_turbo).

force_turbo isn't the right way to go about this as it permanently
bumps all the clocks up, even if running the display at VGA.

> Let's detect it at bind time, warn the user if we can't, and filter out
> the relevant modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index b5bc742993a4..f05f6da286f7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -953,6 +953,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>                 return -EINVAL;
>
> +       if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
> +               return -EINVAL;
> +
>         vc4_state->pixel_rate = pixel_rate;
>
>         return 0;
> @@ -972,6 +975,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
>                 return MODE_CLOCK_HIGH;
>
> +       if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK))
> +               return MODE_CLOCK_HIGH;
> +
>         return MODE_OK;
>  }
>
> @@ -1986,6 +1992,17 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         vc4_hdmi->disable_wifi_frequencies =
>                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
>
> +       if (variant->max_pixel_clock == 600000000) {
> +               struct vc4_dev *vc4 = to_vc4_dev(drm);
> +               long max_rate = clk_get_max_rate(vc4->hvs->core_clk);
> +
> +               if (max_rate < 550000000) {
> +                       drm_warn(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
> +                       drm_warn(drm, "Please change your config.txt file to add hdmi_enable_4kp60 and force_turbo");

Do we really want to warn in bind? Again you could have a VGA
resolution monitor attached but that would trigger this warning.
Can we warn (once) on processing the mode list and filtering out a clk
> HDMI_14_MAX_TMDS_CLK mode instead?

And mentioning force_turbo is again wrong.

  Dave

> +                       vc4_hdmi->disable_4kp60 = true;
> +               }
> +       }
> +
>         if (vc4_hdmi->variant->reset)
>                 vc4_hdmi->variant->reset(vc4_hdmi);
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 3cebd1fd00fc..3cd021136402 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -154,6 +154,14 @@ struct vc4_hdmi {
>          */
>         bool disable_wifi_frequencies;
>
> +       /*
> +        * Even if HDMI0 on the RPi4 can output modes requiring a pixel
> +        * rate higher than 297MHz, it needs some adjustments in the
> +        * config.txt file to be able to do so and thus won't always be
> +        * available.
> +        */
> +       bool disable_4kp60;
> +
>         struct cec_adapter *cec_adap;
>         struct cec_msg cec_rx_msg;
>         bool cec_tx_ok;
> --
> 2.29.2
>
