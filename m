Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0551D200C7
	for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 16:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxU+Od9m"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3363aa2bbfbso5098720f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 08:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703004742; x=1703609542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zy4Z3eEuLBj08ts84l431wJvHoWWggzPm4qQ5zBcMOE=;
        b=LxU+Od9mZpj3Z+GvaGPTeccQyQMN4oPXZG9rn6kOPLGh27bJRAmGa70EaiII+EWQwX
         u6nKGXUMmC7ffav9JQFk3n1A76TNZaXPGG1NxrzV1ite1+GihcqK7U7Uq6eL56QTolYW
         4IW2q/FFFRO6RZXmxL5k4tk3yUenIHaxrDA8Dy9JyojarmZY/Z3opQV5ao8OrANYBmLH
         Ww+08hxUGKXW7kzy6phlWzpKMD4gIHnPe114nslATp+n4lWBoC0a56SjqBj266V7fs0r
         rk/CmuH216wL7UP8rhzYkLBJwH0625LZZz+VQ3p85nSrjdDek9LTyLehw3rGgAOMOWgZ
         kjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004742; x=1703609542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy4Z3eEuLBj08ts84l431wJvHoWWggzPm4qQ5zBcMOE=;
        b=APw3Z7szplD/WQxL7w5gbQGCFXmsFzIV2WApX8VTZ5mzzIkV/0QUZ/637VIpDXBWo2
         TNouRlFz6oajM/LM4f+GFGX0ffSb5ghjls3rb4tAlJnIhfTtr+oEggpCoSJpl6APfqAE
         3u7bcCJv2QkwvNqdxRD5e0R1DZr/4Z3sHtslv44TR0w8R2BvUYq1r8w7XSH0mjNj9wgZ
         DzZu7RJCVCQgggu6qY0GIhB7/LfhehGSg6T3totAzpffuHplpbESUhIlAc54O+tvd2Jb
         mKYweyO5JZTkZR6VWZDEWA0nMYaYF3FJqDjuC8SB3k6BofkmcA4TFawY0shJUmmYze9r
         9yYw==
X-Gm-Message-State: AOJu0Yy0zd63msty7f2OD6bWTohQdBn9wIEaUwbwyjC5w4lDjMURMSpS
	ZrwGmGjD0PKQiI0Whdvdwz61Hw==
X-Google-Smtp-Source: AGHT+IFIh9biTT2PfAWfIIivnLl6PU1NZBv6rg4KrRM98BXFbXikPQgRjibC9rN/fogphV8WUSVbZA==
X-Received: by 2002:adf:f282:0:b0:336:7758:c6f1 with SMTP id k2-20020adff282000000b003367758c6f1mr251211wro.113.1703004742182;
        Tue, 19 Dec 2023 08:52:22 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id h9-20020a5d4309000000b003366d04b050sm4280826wrq.38.2023.12.19.08.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:52:21 -0800 (PST)
Date: Tue, 19 Dec 2023 18:52:20 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Oliver F . Brown" <oliver.brown@oss.nxp.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: Re: [PATCH 1/1] clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and
 phy clocks
Message-ID: <ZYHKRISW1TNR3Ifd@linaro.org>
References: <20231218122407.2757175-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218122407.2757175-1-alexander.stein@ew.tq-group.com>

On 23-12-18 13:24:07, Alexander Stein wrote:
> To be compatibel with SCU firmware based on 1.15 a different clock
> routing for LVDS is needed.
> 

compatible

> Signed-off-by: Oliver F. Brown <oliver.brown@oss.nxp.com>
> Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

With that:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> This patch originates from the downstream kernel squashing patches [1] and [2]
> as suggested by the commit message.
> I adjusted the commit so that the name stays the same as before.
> 
> I am somewhat unsure about the From: tag, as both commits have different
> authors.
> 
> Best regards,
> Alexander
> 
> [1] https://github.com/Freescale/linux-fslc/commit/05b5fd0eebd0
> [2] https://github.com/Freescale/linux-fslc/commit/0a202c564e5f
>  drivers/clk/imx/clk-imx8qxp.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index 41f0a45aa162..7d8883916cac 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -66,6 +66,22 @@ static const char * const lcd_pxl_sels[] = {
>  	"lcd_pxl_bypass_div_clk",
>  };
>  
> +static const char *const lvds0_sels[] = {
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"mipi0_lvds_bypass_clk",
> +};
> +
> +static const char *const lvds1_sels[] = {
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"mipi1_lvds_bypass_clk",
> +};
> +
>  static const char * const mipi_sels[] = {
>  	"clk_dummy",
>  	"clk_dummy",
> @@ -207,9 +223,9 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  	/* MIPI-LVDS SS */
>  	imx_clk_scu("mipi0_bypass_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_BYPASS);
>  	imx_clk_scu("mipi0_pixel_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PER);
> -	imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS);
> -	imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
> +	imx_clk_scu2("mipi0_lvds_pixel_clk", lvds0_sels, ARRAY_SIZE(lvds0_sels), IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu2("mipi0_lvds_phy_clk", lvds0_sels, ARRAY_SIZE(lvds0_sels), IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
>  	imx_clk_scu2("mipi0_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_MST_BUS);
>  	imx_clk_scu2("mipi0_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_SLV_BUS);
>  	imx_clk_scu2("mipi0_dsi_phy_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PHY);
> @@ -219,9 +235,9 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  
>  	imx_clk_scu("mipi1_bypass_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_BYPASS);
>  	imx_clk_scu("mipi1_pixel_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_PER);
> -	imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS);
> -	imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
> +	imx_clk_scu2("mipi1_lvds_pixel_clk", lvds1_sels, ARRAY_SIZE(lvds1_sels), IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu2("mipi1_lvds_phy_clk", lvds1_sels, ARRAY_SIZE(lvds1_sels), IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
>  
>  	imx_clk_scu2("mipi1_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_MST_BUS);
>  	imx_clk_scu2("mipi1_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_SLV_BUS);
> -- 
> 2.34.1
> 
