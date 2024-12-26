Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91421CF9B
	for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735224275; cv=none; b=hNvtzQFQ5+zqMAEHnXdYRYRirBe5jIyjRjyfPURgXsoaCxDSItg9UVHI2uICiy7x286yNiywnWtLmJJ8cJl+iq5GA0hC0H7CFOeA33irhz8c7P428v2tJRovCBwi7b/Z3UXw9zHj671uq6ViVhrDS9Far83a26y5xd/tNdiqXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735224275; c=relaxed/simple;
	bh=oiR1m+/R1lO7OoSCqZgA4U0p4g/dqDSxkVqMYZkRDU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcRlhzP6rJyQDtTbxHhEnp4B3kQm+xld9qr65r5r0gdMLsCxX45c6LQ1mQ6s+dfHsmrsswtnDDnBtZW83UluHAWh+Mff5dAOhVzsAXQ16jCg0bI3n91qLNLHIEzmdAkk06yR5wUg9Ptspx+dQ/VcwwN77oIDkuZaeVpuTqjjdN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfFfHfpV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfFfHfpV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso47039075e9.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735224271; x=1735829071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rn19r4HgbPbGx9r0DQ1iakhx3qC0hkuGhdxpRpgMI=;
        b=xfFfHfpVU74oS8rAdeJkIp8e+hB1ho9M8V6FjReY1TSlEaSOqA9Dn2V4e5ZoJUtP/i
         6nM7Q4jPUNSFPRtquYUyEbrnFecMdY676aproXksaVGPkVwePDbJfZbAJa75get1iiUi
         /ZfDkhmEEYKA4TrH0qPlenACVa1WveISOH76LZuzW8O+EVyPzfeW0yEIpXp1h7Nwg/hj
         B8AwE1c+tdmGJSny9vFuJAlsRKvF7gpWmAeYErxc9JKaEvWJIS2JCZgWiEkULX72+tfu
         3E3EA2oDuJKiKY/Sahmf4OUlErBCUf/7d3L/asJD/9+Yg2ytKeWbZ1mKfMHzTZ1ekNGG
         k39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735224271; x=1735829071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7rn19r4HgbPbGx9r0DQ1iakhx3qC0hkuGhdxpRpgMI=;
        b=Mio+emM3g1bez09sX/MojIwYl9VYD3BKE/5Rn00mu+o+R0Afi+sZJW4WONjnOEBXzC
         EHATpAe/nb/jSuwxSFj73Jl0oCQupviBZv/TpFZhMGKcqTPvZb9SFOn8JFtdhpHitfc1
         2NiTliEcWcx1EGp0Mhi9Gfipq0c9a0H/OKBdnrDgYvtGZjYhglVifL+oJZoCM9DSNw2g
         rFHk7HpEfSKiOkexkz49wHxvZU0J7XdD+4mItGDI9Y5ZekumLOXQSQH4wfspT2qm/9LI
         dzfW24vXQhk099bkVDjBaA4AlY6UASwVE3w8GnhwH6lqDUK2atzmsiDUhWd9h2gTuxXV
         Rxhg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/BOuJySp7HhmGmJIJhwf4C3e89+Iq3x4Uxl2fxEBura5Rlu8YuM556eL85d3dMYBdOYglMipPqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVuv3WXm0Qw4yPw6SEnww04QnzEdlJ9ByPHV1T4ILXJF5g68U+
	rEOJ5F4rhss2/N8RwN1Vb4MaRZXMz14HpJhWutR6oQoVA8G38XYZ/BaLvxgZ2uE=
X-Gm-Gg: ASbGncuS2ftAU/+warNTKeupq5rOGYobpzgCCjpRoSBAPvucs//iGjEU6+1efHLMdQM
	6QK1wUcLdsczVl9SK2Pgox4uRrffn5GIQbPcrRcnaAXJuloPo0lLHm8qE9mIM7LYzfn52PUr9DD
	TeUmK2PX0j6tSj1+RgNnRtBdthuoq76ZLfEWyHR+cFbkxH4bhpen04KiHiF74PnhvRrulExU1HQ
	jerkBvvBIZw5UpgKBZTFC8dr4iWgtUFXa9z4C2nON5U4rClt2WQ4v4=
X-Google-Smtp-Source: AGHT+IEs46r2QTrphoxhnYAjoEZ26B+gzvCJ6J2PHOuEvEPqcIAkbr1HCYher+BV97nl0i4rzQRD/A==
X-Received: by 2002:a05:600c:350c:b0:434:a91e:c709 with SMTP id 5b1f17b1804b1-43668b78c11mr157293045e9.28.1735224271050;
        Thu, 26 Dec 2024 06:44:31 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea47asm234453595e9.4.2024.12.26.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:44:30 -0800 (PST)
Date: Thu, 26 Dec 2024 16:44:28 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	"open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>,
	"open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] clk: imx: Apply some clks only for i.MX93
Message-ID: <Z21rzK6Nejti6lsA@linaro.org>
References: <20241225001443.883131-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225001443.883131-1-peng.fan@oss.nxp.com>

On 24-12-25 08:14:43, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Enable the LVDS gate, MIPI DSI, PXP, FLEXIO and MU only for i.MX93,
> because i.MX91 does not support them.
> 
> Update enet clk entry format to align with others.
> 
> Fixes: a27bfff88dd2 ("clk: imx: add i.MX91 clk")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> V2:
>  Update subject and commit log after phasing out more clks
>  https://lore.kernel.org/lkml/20241203130530.1206526-1-peng.fan@oss.nxp.com/
> 
>  drivers/clk/imx/clk-imx93.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 58a516dd385b..5bdd2bdce46e 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -70,8 +70,8 @@ static const struct imx93_clk_root {
>  	{ IMX93_CLK_WAKEUP_AXI,		"wakeup_axi_root",	0x0380,	FAST_SEL, CLK_IS_CRITICAL },
>  	{ IMX93_CLK_SWO_TRACE,		"swo_trace_root",	0x0400,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_M33_SYSTICK,	"m33_systick_root",	0x0480,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
> -	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, },
> -	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, },
> +	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
> +	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
>  	{ IMX93_CLK_LPTMR1,		"lptmr1_root",		0x0700,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_LPTMR2,		"lptmr2_root",		0x0780,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_TPM2,		"tpm2_root",		0x0880,	TPM_SEL, },
> @@ -177,10 +177,10 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_WDOG5_GATE,		"wdog5",	"osc_24m",		0x8400, },
>  	{ IMX93_CLK_SEMA1_GATE,		"sema1",	"bus_aon_root",		0x8440, },
>  	{ IMX93_CLK_SEMA2_GATE,		"sema2",	"bus_wakeup_root",	0x8480, },
> -	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED },
> -	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED },
> -	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub },
> -	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
> +	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub, PLAT_IMX93 },
> +	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub, PLAT_IMX93 },
>  	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
>  	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
>  	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",	0x8640, },
> @@ -188,8 +188,8 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_GPIO2_GATE,		"gpio2",	"bus_wakeup_root",	0x88c0, },
>  	{ IMX93_CLK_GPIO3_GATE,		"gpio3",	"bus_wakeup_root",	0x8900, },
>  	{ IMX93_CLK_GPIO4_GATE,		"gpio4",	"bus_wakeup_root",	0x8940, },
> -	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, },
> -	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, },
> +	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, 0, NULL, PLAT_IMX93},
> +	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, 0, NULL, PLAT_IMX93},
>  	{ IMX93_CLK_LPIT1_GATE,		"lpit1",	"bus_aon_root",		0x8a00, },
>  	{ IMX93_CLK_LPIT2_GATE,		"lpit2",	"bus_wakeup_root",	0x8a40, },
>  	{ IMX93_CLK_LPTMR1_GATE,	"lptmr1",	"lptmr1_root",		0x8a80, },
> @@ -238,10 +238,10 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_SAI3_GATE,          "sai3",         "sai3_root",            0x94c0, 0, &share_count_sai3},
>  	{ IMX93_CLK_SAI3_IPG,		"sai3_ipg_clk", "bus_wakeup_root",	0x94c0, 0, &share_count_sai3},
>  	{ IMX93_CLK_MIPI_CSI_GATE,	"mipi_csi",	"media_apb_root",	0x9580, },
> -	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, },
> -	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, },
> +	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, 0, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, 0, NULL, PLAT_IMX93 },
>  	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
> -	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },
> +	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, 0, NULL, PLAT_IMX93 },
>  	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
>  	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_axi_root",	0x9700, },
>  	{ IMX93_CLK_USB_CONTROLLER_GATE, "usb_controller", "hsio_root",		0x9a00, },
> @@ -256,8 +256,8 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_HSIO_32K_GATE,	"hsio_32k",	"osc_32k",		0x9dc0, },
>  	{ IMX93_CLK_ENET1_GATE,		"enet1",	"wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX93, },
>  	{ IMX93_CLK_ENET_QOS_GATE,	"enet_qos",	"wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX93, },
> -	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular",        "wakeup_axi_root",      0x9e00, 0, NULL, PLAT_IMX91, },
> -	{ IMX91_CLK_ENET1_QOS_TSN_GATE,     "enet1_qos_tsn",        "wakeup_axi_root",      0x9e40, 0, NULL, PLAT_IMX91, },
> +	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular", "wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX91, },
> +	{ IMX91_CLK_ENET1_QOS_TSN_GATE, "enet1_qos_tsn", "wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX91, },
>  	/* Critical because clk accessed during CPU idle */
>  	{ IMX93_CLK_SYS_CNT_GATE,	"sys_cnt",	"osc_24m",		0x9e80, CLK_IS_CRITICAL},
>  	{ IMX93_CLK_TSTMR1_GATE,	"tstmr1",	"bus_aon_root",		0x9ec0, },
> -- 
> 2.37.1
> 
