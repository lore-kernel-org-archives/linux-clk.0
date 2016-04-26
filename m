Return-Path: <boris.brezillon@free-electrons.com>
Date: Tue, 26 Apr 2016 11:59:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai
 <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, dri-devel@lists.freedesktop.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan
 <alex@nextthing.co>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 08/11] drm: sun4i: tv: Add PAL output standard
Message-ID: <20160426115924.2234bca5@bbrezillon>
In-Reply-To: <1461590572-4027-9-git-send-email-maxime.ripard@free-electrons.com>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
	<1461590572-4027-9-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Mon, 25 Apr 2016 15:22:49 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Now that we have support for the composite output, we can start adding new
> supported standards. Start with PAL, and we will add other eventually.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 42 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index 78634dfc0f77..ccf275a90132 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -178,7 +178,49 @@ struct sun4i_tv {
>  	struct sun4i_drv	*drv;
>  };
>  
> +struct video_levels pal_video_levels = {
> +	.black = 252,	.blank = 252,
> +};
> +
> +struct burst_levels pal_burst_levels = {
> +	.cb = 40,	.cr = 40,
> +};
> +
> +struct color_gains pal_color_gains = {
> +	.cb = 224,	.cr = 224,
> +};
> +
> +struct resync_parameters pal_resync_parameters = {
> +	.field = true,	.line = 13,	.pixel = 12,
> +};
> +
>  struct tv_mode tv_modes[] = {
> +	{
> +		.name		= "PAL",
> +		.mode		= SUN4I_TVE_CFG0_RES_576i,
> +		.chroma_freq	= 0x2a098acb,
> +
> +		.back_porch	= 138,
> +		.front_porch	= 24,
> +		.line_number	= 625,
> +
> +		.hdisplay	= 720,
> +		.hfront_porch	= 3,
> +		.hsync_len	= 2,
> +		.hback_porch	= 139,
> +
> +		.vdisplay	= 576,
> +		.vfront_porch	= 28,
> +		.vsync_len	= 2,
> +		.vback_porch	= 19,
> +
> +		.vblank_level	= 252,
> +
> +		.color_gains	= &pal_color_gains,
> +		.burst_levels	= &pal_burst_levels,
> +		.video_levels	= &pal_video_levels,
> +		.resync_params	= &pal_resync_parameters,
> +	},
>  };
>  
>  static inline struct sun4i_tv *



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
