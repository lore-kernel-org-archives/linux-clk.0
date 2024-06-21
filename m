Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583340856
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718992378; cv=none; b=O6sQHMStfOOgvkZ6mPa1A1ZoHVb2+sMlnXpB8f/eTD7Zg5rUDoxWpoaho5VxxJtXR2hHqokQZB0ghUQsoYi1XUFX+ujV6FmfkAdXYhM35tjwvkj7RM16XHaDZzpUe/1Z8JVvGt6OU1fK/5PrsBZI9vSkhQ+pXbypeu9D/Al49OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718992378; c=relaxed/simple;
	bh=l+e3TBsJGHgEO+B6v7c2lE1gihkDrqoV70vknaAijVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7MIJH+QUeJPF0a5kDGzcoJWNlzdu+g60d64rFQ1Vu4b9d4qlFgRXuPB8RdYEoewzs4NQiBRFEdj/Ig2TnKlOqw6Yks4j2yNI1CbpC8ppxNF6kpiGExZUYBiVyR/cu4VWoB5OJF7LTYcWJRrW3L+eeB3t+eekg69hA1UnafGoD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAnya+KK; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAnya+KK"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c5362c7c0bso1758655a91.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 10:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718992374; x=1719597174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eceM7eGroF/1YftF1UIl+bHo7iAVJgd1bq1phB6robE=;
        b=mAnya+KKAX0ifmnLMBKTtPbbcUguyOSmMna7nLO/mYGRdmXFwVnzZ2weQqjziZm1q0
         1PZKJCuUhL5mdEOp/rGJOaQZ7hQTo5heTwXFvZhDNyPe3/OYtMyaUr1S7hBEwFQhLSri
         7wMQpxHbaMvYGc0MnsOkczfYhHQSerGqPD7s+V5httGyaL46JRnSJ05ywsgwjXFHp49L
         ZgYzfDJ1qhDZI33s+ZARyIM97+bJPxMkEAlGzcyBnKGcmHhHcDAV9OuMGkZTubEgMggZ
         TMCrwKDlrhEJ7Vh16q7nnGT+ufMVfKGZMzChI7qbdaCFXxgx0L74g2tJGAL9gm2UtIaj
         Lp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718992374; x=1719597174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eceM7eGroF/1YftF1UIl+bHo7iAVJgd1bq1phB6robE=;
        b=X+mKlO8W28I66URACCYd6EcXhRyZjsIIznun01//r/J+PMdoKsyDkA+rC4I2gTt9Mx
         fEZsJr1Yd8hPLFyPLEsw+sFNBp/QTQlKOcC1aj9lXuyxU3ZSkoliYbWXcU1+TDlTp0wB
         xbX6xION/8WG9pe1gdEhMDjsCpq7atpKuhBZJP+lv0572AM7uyD6N74OPeVSZimSomPS
         q2oDxzwrAZyLalK9s+K5ZeW9Ci+j0eAY4r0I5MgJdoVcwYP4rHEb2H9JHG6kQfNX9yxt
         bujBVPDRR9hT/hLu+h9TnlgTN2bXtWfbMiSaN8393RdBqROXjZl8Z/0oT+Mme74n8iz2
         qCNA==
X-Gm-Message-State: AOJu0Yw88mXyiuemAyoYJ2AwJEf0YQNr8kuYCK9co+GedVIXc0ulbLBg
	QIkNFW+zLRQVdWhOAWEgZlHFh+Bq8zg0BFbuuCa1nS0L77FDytv4SHykk7Z3mDTo7lbDRx9rOF9
	/yQoBsQFoD46MWQ0lW/xnHXC2l34=
X-Google-Smtp-Source: AGHT+IGayfrnXuX32A8k7x+SGn5TpPg73uu0SeCkfjVvVUrHSzOi3yXl1TtWyEkUmcLr+2LUM8tReB5PmJphEOGdAos=
X-Received: by 2002:a17:90a:e615:b0:2c2:f2f9:a121 with SMTP id
 98e67ed59e1d1-2c7b5d6a450mr8877807a91.39.1718992374293; Fri, 21 Jun 2024
 10:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531202648.277078-1-marex@denx.de>
In-Reply-To: <20240531202648.277078-1-marex@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 21 Jun 2024 12:52:42 -0500
Message-ID: <CAHCN7xJA2i+k-n+02Km+83YXVEse=NDR_KmwQzhdTmCAJkP+BA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 3:36=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> Allow these clocks to reconfigure the Video PLL, as that results in
> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> clock accuracy is low.

What happens if you have both a DSI (IMX8MP_CLK_MEDIA_DISP1_PIX) and
an LVDS (IMX8MP_CLK_MEDIA_DISP2_PIX) display and both try to
reconfigure their shared parent clock when their resolutions/clocks
may not be the same?  I looked at doing that for the 8MP, but I was
running into display issues.

For example, I was trying to test an 800x480 LVDS display which needed
a pixel clock of 30MHz, and a DSI trying to run at 1920x1080 @
148.5MHz.

adam

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Lukas F. Hartmann <lukas@mntmn.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-imx8mp.c | 4 ++--
>  drivers/clk/imx/clk.h        | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 670aa2bab3017..f11dfe2028319 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -547,7 +547,7 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>         hws[IMX8MP_CLK_AHB] =3D imx8m_clk_hw_composite_bus_critical("ahb_=
root", imx8mp_ahb_sels, ccm_base + 0x9000);
>         hws[IMX8MP_CLK_AUDIO_AHB] =3D imx8m_clk_hw_composite_bus("audio_a=
hb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
>         hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] =3D imx8m_clk_hw_composite_bus("m=
ipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
> -       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus("m=
edia_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300);
> +       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus_fl=
ags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_S=
ET_RATE_PARENT);
>
>         hws[IMX8MP_CLK_IPG_ROOT] =3D imx_clk_hw_divider2("ipg_root", "ahb=
_root", ccm_base + 0x9080, 0, 1);
>
> @@ -609,7 +609,7 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>         hws[IMX8MP_CLK_USDHC3] =3D imx8m_clk_hw_composite("usdhc3", imx8m=
p_usdhc3_sels, ccm_base + 0xbc80);
>         hws[IMX8MP_CLK_MEDIA_CAM1_PIX] =3D imx8m_clk_hw_composite("media_=
cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
>         hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] =3D imx8m_clk_hw_composite("m=
edia_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
> -       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite("media=
_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00);
> +       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite_bus_fl=
ags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_S=
ET_RATE_PARENT);
>         hws[IMX8MP_CLK_MEDIA_CAM2_PIX] =3D imx8m_clk_hw_composite("media_=
cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>         hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite("media_ldb",=
 imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>         hws[IMX8MP_CLK_MEMREPAIR] =3D imx8m_clk_hw_composite_critical("me=
m_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index adb7ad649a0d2..aa5202f284f3d 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -442,6 +442,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *=
name,
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAUL=
T)
>
> +#define imx8m_clk_hw_composite_bus_flags(name, parent_names, reg, flags)=
 \
> +       _imx8m_clk_hw_composite(name, parent_names, reg, \
> +                       IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAUL=
T | flags)
> +
>  #define imx8m_clk_hw_composite_bus_critical(name, parent_names, reg)   \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_CRITIC=
AL)
> --
> 2.43.0
>
>
