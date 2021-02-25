Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D5FC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2A2564E83
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbhBYQrO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbhBYQq1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:46:27 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CB9C06174A
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:45:43 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v15so5917243wrx.4
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NmfdoFo/I40sE8Qkui7EMAEzIBiXEXSbxp8eB2SP+0o=;
        b=CyvMjwQCKIE4FwP+oGnuDUNRdWrlgQScBR04hkOk9PiVy6A8GZtH+0UMGAKN9P6WFq
         jprR6l6l4jotSjXlak+UnylsDzPratmo9PlELn9va5NnXgbB6zFMADb9z92JvBmLqt+q
         wRgeVqBCm4HDwi/u/F7ApMyvrycm0pGlRV6QShWWawLewbTdC3Tts6VsQBk5pcqm5hnP
         9MILLaj57TZ2eKBM0lGuOKRVNfXbCzCEC9/Q7KyChSbNTtKusWuwcI5NkRhYvmFNknwP
         o261fT1DdagrjZRChZrfOnt8RvVqTNK1YBQHQJdZQ7cf6a714ti8juiVDeImSdgKAhIW
         yHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NmfdoFo/I40sE8Qkui7EMAEzIBiXEXSbxp8eB2SP+0o=;
        b=AzVFUQZAfnJ0fI6AV/5bT8UiWUt6Hn5+k6nZoshKpBvbaYLuhmKmrAnB+k0cHYVXrK
         mx78dIeGkvp3qEqb3/qvg09CUpx75PZnum1uue437b/M2OElZjQjIdS/i4YgenBOj2Wf
         2SXF8r2mOZ7xA+VLg56jSKaJtBbanj+qKSj+/CkDsyY4XlI9UzzrBJt6HTcwrQm+2U2t
         kufTQC7K19lVvVtBSUXbK6AIQBe2acW4OHe5c4cHt8dmSKspaceG6EypQLOGdAtRoxOC
         HeMlSTBYzic9XTH4pt5iWmIf9Xu0/XeMiv50RDCws9HocOH2vmsgNc9wUg4q5KnnSIdV
         iWCQ==
X-Gm-Message-State: AOAM532SDNPauALouyWdqhB1iCQITGR2dO5GU3jeoL8OahC49PFzwWPf
        B3/XcecAV4LxciKfXyk+ez2mI0DgFY+MgvZEZMTrpg==
X-Google-Smtp-Source: ABdhPJw6VNhGfLB+x+jtrwvxYrcNNxSAxOcW7GDDkzr1pqBrOXtyS043FXS2OonOo7r8BFLfSOCxjTi4WGBs2AY/IfQ=
X-Received: by 2002:adf:f681:: with SMTP id v1mr4460008wrp.150.1614271542472;
 Thu, 25 Feb 2021 08:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-7-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-7-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 25 Feb 2021 16:45:26 +0000
Message-ID: <CAPY8ntAcVoHGcDCXuFD3677VwJCr6EVzWoxL5stmModa7hQrGw@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/vc4: hdmi: Raise the maximum clock rate
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
> Now that we have the infrastructure in place, we can raise the maximum
> pixel rate we can reach for HDMI0 on the BCM2711.
>
> HDMI1 is left untouched since its pixelvalve has a smaller FIFO and
> would need a clock faster than what we can provide to support the same
> modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 1a6babb53cf4..27464add6468 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2177,7 +2177,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi0_regs",
>         .card_name              = "vc4-hdmi-0",
> -       .max_pixel_clock        = HDMI_14_MAX_TMDS_CLK,
> +       .max_pixel_clock        = 600000000,
>         .registers              = vc5_hdmi_hdmi0_fields,
>         .num_registers          = ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
>         .phy_lane_mapping       = {
> --
> 2.29.2
>
