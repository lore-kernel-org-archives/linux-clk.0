Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A15C54EBE
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 14:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjAPOrK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 09:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjAPOqx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 09:46:53 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FFE22038
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 06:28:37 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so68537018ejc.4
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxLG6TTl8Ic/7g0hQk8ggT8NcHPanULLyMvVruCtN2c=;
        b=QGlGugyS3UvUwNLlIz8UrjuOagHJQAqHFl0b7LiY3pjSEWd3QV1zO3d7SD+ZdOrza/
         x5G601a1q2QAghOuPl7OdIp9uPmU80fKtCLExlG0gqWjm6fUeq7GSy9iQGAcg40I4EQD
         uBAIPv9fIr6E02fF+8KfST95igZxAubbSqvFiLGzsFV1t2wHawhuQyiS4tuxLUNCZVcm
         IiZ/evYO0C57J+AqkIVIgcTDq3eESoliRyBmTsdEnB5TzNDp3BBNwGSSAMLmo2niFZ2R
         BjVB1PJEfyiH2hs5yn26f08V0UfgPzYpxG7tmnn7c0kQrvek5qNl7gTTU6p4wQQlV5rJ
         QJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxLG6TTl8Ic/7g0hQk8ggT8NcHPanULLyMvVruCtN2c=;
        b=lcYPhCfMZTH6G1i+Z3jBzInX6eNM3/6bQCjSFlNBxss6KXqeM7qv5yrU3ytURwtC6r
         tAeK3cQ4OPYUHOZSG0BtSOUIYEXmti/3JAWphezSk+00jpjwOclqgRkYSF4Gg/f6x7ij
         kHahzUe/gy6eX/N9F++IePf1C0JN/GYs80PvrM/kAT1Fdz+BRcPUOFe75xfTw9Bllxa2
         SFLv4HpCkfRNf9MRj9JOVBnjY6upvYDPibSVu8oYovBoBgX1xIcDvdoROk19lOyIqNNY
         9E7bE6DPX1Xb8Fxx3j4vztLZ53HwXRdUUx/8hDQ5WMaeYOgwvieogExEbX2tTZFGg8+a
         ugGA==
X-Gm-Message-State: AFqh2krWlWE6nTYaRwcg/YyQTbxO0XZAkyGqvD67gqnNT3D2aMMGBpsD
        QHQeg5prTDLaejllJjTp7BSgwQ==
X-Google-Smtp-Source: AMrXdXvhKj+dWSAovh86aIL0ls/STdzn8oZMPR+FmLegGDzAEOO/UU2HiZ10lUEtT+U1aacM+pz0zw==
X-Received: by 2002:a17:906:5786:b0:7c0:e535:13fc with SMTP id k6-20020a170906578600b007c0e53513fcmr100863185ejq.37.1673879315637;
        Mon, 16 Jan 2023 06:28:35 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id lb14-20020a170907784e00b007c0fd177c0bsm11753152ejc.46.2023.01.16.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 06:28:35 -0800 (PST)
Date:   Mon, 16 Jan 2023 16:28:33 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>,
        abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        18701859600@163.com, bsp-development.geo@leica-geosystems.com,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH V5 1/1] clk: imx8mp: Alias M7 SRC/DIV to M7 CORE
Message-ID: <Y8VfEfnWwt8+QB1W@linaro.org>
References: <20230111101030.686885-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20230111101030.686885-2-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111101030.686885-2-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-11 11:10:30, LI Qingwu wrote:
> Defined IMX8MP_CLK_M7_SRC and IMX8MP_CLK_M7_DIV in imx8mp-clock.h
> but never assigned. It will cause the system to hang if using them.
> Alias IMX8MP_CLK_M7_SRC and IMX8MP_CLK_M7_DIV to IMX8MP_CLK_M7_CORE
> for backward compatibility.
> 
> Fixes: 8c83a8ff4dd9 (clk: imx8mp: use imx8m_clk_hw_composite_core to simplify code)
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>

Stephen, can you please pick this up yourself?

Thanks!

> ---
>  drivers/clk/imx/clk-imx8mp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 652ae58c2735..601eea7ab99d 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -522,6 +522,8 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
>  	hws[IMX8MP_CLK_A53_CG] = hws[IMX8MP_CLK_A53_DIV];
>  	hws[IMX8MP_CLK_M7_CORE] = imx8m_clk_hw_composite_core("m7_core", imx8mp_m7_sels, ccm_base + 0x8080);
> +	hws[IMX8MP_CLK_M7_DIV] = hws[IMX8MP_CLK_M7_CORE];
> +	hws[IMX8MP_CLK_M7_SRC] = hws[IMX8MP_CLK_M7_CORE];
>  	hws[IMX8MP_CLK_ML_CORE] = imx8m_clk_hw_composite_core("ml_core", imx8mp_ml_sels, ccm_base + 0x8100);
>  	hws[IMX8MP_CLK_GPU3D_CORE] = imx8m_clk_hw_composite_core("gpu3d_core", imx8mp_gpu3d_core_sels, ccm_base + 0x8180);
>  	hws[IMX8MP_CLK_GPU3D_SHADER_CORE] = imx8m_clk_hw_composite("gpu3d_shader_core", imx8mp_gpu3d_shader_sels, ccm_base + 0x8200);
> -- 
> 2.25.1
> 
