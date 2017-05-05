Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:46315 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752690AbdEEIQb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 May 2017 04:16:31 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Fri, 05 May 2017 16:16:29 +0800
From: icenowy@aosc.io
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v2 14/20] drm/sun4i: tcon: multiply the vtotal when not in
 interlace
In-Reply-To: <59bdbadc4d3adc6d75c2cef38df0af332bd313db.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <59bdbadc4d3adc6d75c2cef38df0af332bd313db.1493812478.git-series.maxime.ripard@free-electrons.com>
Message-ID: <3683ca88e5dd7ab9f26f1c12beb15cb8@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2017-05-03 19:59，Maxime Ripard 写道：
> It appears that the total vertical resolution needs to be doubled when
> we're not in interlaced. Make sure that is the case.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 0f91ec8a4b26..efa079c1a3f5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -272,9 +272,9 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
>  	/* Set vertical display timings */
>  	bp = mode->crtc_vtotal - mode->crtc_vsync_start;
>  	DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
> -			 mode->vtotal, bp);
> +			 mode->crtc_vtotal, bp);
>  	regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
> -		     SUN4I_TCON1_BASIC4_V_TOTAL(mode->vtotal) |
> +		     SUN4I_TCON1_BASIC4_V_TOTAL(mode->crtc_vtotal * 2) |

For TVE the value should directly be mode->vtotal, but not
mode->crtc_vtotal * 2.

vtotal is 625 when PAL. crtc_vtotal is thus 312, but if we restore the
vtotal value by doubling crtv_vtotal, we got 624, which will lead to
instability of the image displayed. (the image will loop to go higher
and then go lower, because wrong vtotal value)

Tested on patched H3 TV encoder.

I used a logic slightly changed from your v1 code:

```
	val = mode->vtotal;
	if (!(mode->flags & DRM_MODE_FLAG_INTERLACE))
		val = val * 2;
	regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
		     SUN4I_TCON1_BASIC4_V_TOTAL(val) |
		     SUN4I_TCON1_BASIC4_V_BACKPORCH(bp));
```

>  		     SUN4I_TCON1_BASIC4_V_BACKPORCH(bp));
> 
>  	/* Set Hsync and Vsync length */
