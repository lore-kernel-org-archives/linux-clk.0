Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 05/12] drm/bridge/synopsys: dw-hdmi: don't clobber
 drvdata
To: Jernej Skrabec <jernej.skrabec@siol.net>,
 maxime.ripard@free-electrons.com, airlied@linux.ie, robh+dt@kernel.org,
 mark.rutland@arm.com, wens@csie.org, architt@codeaurora.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, Jose.Abreu@synopsys.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
 p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de
References: <20180117201421.25954-1-jernej.skrabec@siol.net>
 <20180117201421.25954-6-jernej.skrabec@siol.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <91cd3ffd-e5cc-8149-2c57-6f93da55a0e4@baylibre.com>
Date: Thu, 18 Jan 2018 14:04:08 +0100
MIME-Version: 1.0
In-Reply-To: <20180117201421.25954-6-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 17/01/2018 21:14, Jernej Skrabec wrote:
> dw_hdmi shouldn't set drvdata since some drivers might need to store
> it's own data there. Rework dw_hdmi in a way to return struct dw_hdmi
> instead to store it in drvdata. This way drivers are responsible to
> store and pass structure when needed.
> 
> Idea was taken from the following commit:
> 8242ecbd597d ("drm/bridge/synopsys: stop clobbering drvdata")
> 
> Cc: p.zabel@pengutronix.de
> Cc: narmstrong@baylibre.com
> Cc: Laurent.pinchart@ideasonboard.com
> Cc: hjc@rock-chips.com
> Cc: heiko@sntech.de
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 31 ++++++++++++-----------------
>  drivers/gpu/drm/imx/dw_hdmi-imx.c           | 13 +++++++++---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c       | 14 +++++++++----
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      | 12 +++++++++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 13 +++++++++---
>  include/drm/bridge/dw_hdmi.h                | 13 ++++++------
>  6 files changed, 60 insertions(+), 36 deletions(-)
> 

[...]
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index e8c3ef8a94ce..d49af17310c9 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,6 +140,7 @@ struct meson_dw_hdmi {
>  	struct clk *venci_clk;
>  	struct regulator *hdmi_supply;
>  	u32 irq_stat;
> +	struct dw_hdmi *hdmi;
>  };
>  #define encoder_to_meson_dw_hdmi(x) \
>  	container_of(x, struct meson_dw_hdmi, encoder)
> @@ -878,9 +879,12 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	dw_plat_data->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
>  	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
>  
> -	ret = dw_hdmi_bind(pdev, encoder, &meson_dw_hdmi->dw_plat_data);
> -	if (ret)
> -		return ret;
> +	platform_set_drvdata(pdev, meson_dw_hdmi);
> +
> +	meson_dw_hdmi->hdmi = dw_hdmi_bind(pdev, encoder,
> +					   &meson_dw_hdmi->dw_plat_data);
> +	if (IS_ERR(meson_dw_hdmi->hdmi))
> +		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
>  	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>  
> @@ -890,7 +894,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>  				   void *data)
>  {
> -	dw_hdmi_unbind(dev);
> +	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
> +
> +	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
>  }
>  
>  static const struct component_ops meson_dw_hdmi_ops = {

[..]

> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index f3f3f0e1b2d3..dd2a8cf7d20b 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,12 +143,13 @@ struct dw_hdmi_plat_data {
>  			     unsigned long mpixelclock);
>  };
>  
> -int dw_hdmi_probe(struct platform_device *pdev,
> -		  const struct dw_hdmi_plat_data *plat_data);
> -void dw_hdmi_remove(struct platform_device *pdev);
> -void dw_hdmi_unbind(struct device *dev);
> -int dw_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
> -		 const struct dw_hdmi_plat_data *plat_data);
> +struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> +			      const struct dw_hdmi_plat_data *plat_data);
> +void dw_hdmi_remove(struct dw_hdmi *hdmi);
> +void dw_hdmi_unbind(struct dw_hdmi *hdmi);
> +struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
> +			     struct drm_encoder *encoder,
> +			     const struct dw_hdmi_plat_data *plat_data);
>  
>  void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense);
>  
> 

For meson-drm and dw-hdmi bridge changes :
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
