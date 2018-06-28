Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40014 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932146AbeF1CSD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 22:18:03 -0400
MIME-Version: 1.0
In-Reply-To: <20180625120304.7543-13-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-13-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 10:17:38 +0800
Message-ID: <CAGb2v67KBqu7_2Q-yZP+zmB9A4Hu1Hh=9Yq2rrnBU5uxyzTpGg@mail.gmail.com>
Subject: Re: [PATCH v3 12/24] drm/sun4i: Don't check for panel or bridge on TV TCONs
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> TV TCONs are always connected to TV or HDMI encoder, so it doesn't make
> sense to check if panel or bridge is connected to them.
>
> Check if TCON has channel 0 and only then check for connected panel or
> bridges.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 761687ebacba..a41c7bb0d557 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1178,13 +1178,19 @@ static const struct component_ops sun4i_tcon_ops = {
>  static int sun4i_tcon_probe(struct platform_device *pdev)
>  {
>         struct device_node *node = pdev->dev.of_node;
> +       const struct sun4i_tcon_quirks *quirks;
>         struct drm_bridge *bridge;
>         struct drm_panel *panel;
>         int ret;
>
> -       ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> -       if (ret == -EPROBE_DEFER)
> -               return ret;
> +       quirks = of_device_get_match_data(&pdev->dev);
> +
> +       /* panels and bridges are present only on TCONs with channel 0 */
> +       if (quirks->has_channel_0) {

This is implied by the device tree binding. TCONs that don't have panels
or bridges will have endpoint 0 unconnected, and drm_of_find_panel_or_bridge
will return -ENODEV.

It doesn't hurt to skip the check though.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> +               ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> +               if (ret == -EPROBE_DEFER)
> +                       return ret;
> +       }
>
>         return component_add(&pdev->dev, &sun4i_tcon_ops);
>  }
> --
> 2.18.0
>
