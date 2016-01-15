Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1452873012.6067.78.camel@pengutronix.de>
Subject: Re: [PATCH v2 01/26] reset: Move DT cell size check to the core
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Hans de
 Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Wynter Woods
 <wynter@nextthing.co>,  Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 15 Jan 2016 16:50:12 +0100
In-Reply-To: <1452785109-6172-2-git-send-email-maxime.ripard@free-electrons.com>
References: 
	<1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1452785109-6172-2-git-send-email-maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

Am Donnerstag, den 14.01.2016, 16:24 +0100 schrieb Maxime Ripard:
> The core currently doesn't check that the DT cell size matches what the
> driver declares, which means that every xlate function needs to duplicate
> that check.
> 
> Make sure that of_reset_control_get checks for this to avoid duplication
> and errors.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/reset/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 7955e00d04d4..d53b2b980bdd 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -46,9 +46,6 @@ struct reset_control {
>  static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
>  			  const struct of_phandle_args *reset_spec)
>  {
> -	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
> -		return -EINVAL;
> -
>  	if (reset_spec->args[0] >= rcdev->nr_resets)
>  		return -EINVAL;
>  
> @@ -182,6 +179,9 @@ struct reset_control *of_reset_control_get(struct device_node *node,
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
> +	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells))
> +		return ERR_PTR(-EINVAL);
> +

Applied with this fix:
 
-	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells))
+	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
+		mutex_unlock(&reset_controller_list_mutex);
 		return ERR_PTR(-EINVAL);
+	}
 
No further action needed if you agree, otherwise let me know and I'll
back it out.

best regards
Philipp
