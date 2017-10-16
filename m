Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: Add R8A7745 support
Date: Mon, 16 Oct 2017 15:36:40 +0300
Message-ID: <2922323.urz8JTfWKj@avalon>
In-Reply-To: <1507908142-13142-5-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1507908142-13142-1-git-send-email-fabrizio.castro@bp.renesas.com> <1507908142-13142-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Friday, 13 October 2017 18:22:22 EEST Fabrizio Castro wrote:
> Add support for the R8A7745 DU (which is very similar to the R8A7794 DU);
> it has 2 RGB outputs.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 3db5e8d..faa5b32 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -55,6 +55,27 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7743_info = { .num_lvds = 1,
>  };
> 
> +static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
> +	.gen = 2,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
> +	.num_crtcs = 2,
> +	.routes = {
> +		/*
> +		 * R8A7745 has two RGB outputs
> +		 */
> +		[RCAR_DU_OUTPUT_DPAD0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},
> +		[RCAR_DU_OUTPUT_DPAD1] = {
> +			.possible_crtcs = BIT(1),
> +			.port = 1,
> +		},
> +	},
> +	.num_lvds = 0,
> +};
> +
>  static const struct rcar_du_device_info rcar_du_r8a7779_info = {
>  	.gen = 2,
>  	.features = 0,
> @@ -229,6 +250,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7796_info = {
> 
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> +	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
>  	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
>  	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },

-- 
Regards,

Laurent Pinchart
