Return-Path: <boris.brezillon@free-electrons.com>
Date: Tue, 26 Apr 2016 11:59:41 +0200
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
Subject: Re: [PATCH v4 09/11] drm: sun4i: tv: Add NTSC output standard
Message-ID: <20160426115941.14e2b0fb@bbrezillon>
In-Reply-To: <1461590572-4027-10-git-send-email-maxime.ripard@free-electrons.com>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
	<1461590572-4027-10-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Mon, 25 Apr 2016 15:22:50 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Add the settings to support the NTSC standard.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 45 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index ccf275a90132..bc047f923508 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -178,24 +178,69 @@ struct sun4i_tv {
>  	struct sun4i_drv	*drv;
>  };
>  
> +struct video_levels ntsc_video_levels = {
> +	.black = 282,	.blank = 240,
> +};
> +
>  struct video_levels pal_video_levels = {
>  	.black = 252,	.blank = 252,
>  };
>  
> +struct burst_levels ntsc_burst_levels = {
> +	.cb = 79,	.cr = 0,
> +};
> +
>  struct burst_levels pal_burst_levels = {
>  	.cb = 40,	.cr = 40,
>  };
>  
> +struct color_gains ntsc_color_gains = {
> +	.cb = 160,	.cr = 160,
> +};
> +
>  struct color_gains pal_color_gains = {
>  	.cb = 224,	.cr = 224,
>  };
>  
> +struct resync_parameters ntsc_resync_parameters = {
> +	.field = false,	.line = 14,	.pixel = 12,
> +};
> +
>  struct resync_parameters pal_resync_parameters = {
>  	.field = true,	.line = 13,	.pixel = 12,
>  };
>  
>  struct tv_mode tv_modes[] = {
>  	{
> +		.name		= "NTSC",
> +		.mode		= SUN4I_TVE_CFG0_RES_480i,
> +		.chroma_freq	= 0x21f07c1f,
> +		.yc_en		= true,
> +		.dac3_en	= true,
> +		.dac_bit25_en	= true,
> +
> +		.back_porch	= 118,
> +		.front_porch	= 32,
> +		.line_number	= 525,
> +
> +		.hdisplay	= 720,
> +		.hfront_porch	= 18,
> +		.hsync_len	= 2,
> +		.hback_porch	= 118,
> +
> +		.vdisplay	= 480,
> +		.vfront_porch	= 26,
> +		.vsync_len	= 2,
> +		.vback_porch	= 17,
> +
> +		.vblank_level	= 240,
> +
> +		.color_gains	= &ntsc_color_gains,
> +		.burst_levels	= &ntsc_burst_levels,
> +		.video_levels	= &ntsc_video_levels,
> +		.resync_params	= &ntsc_resync_parameters,
> +	},
> +	{
>  		.name		= "PAL",
>  		.mode		= SUN4I_TVE_CFG0_RES_576i,
>  		.chroma_freq	= 0x2a098acb,



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
