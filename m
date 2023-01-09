Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D419C5479D
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 10:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjAIKtb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 05:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjAIKtb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 05:49:31 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D35B4E
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 02:49:29 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id fc4so18936063ejc.12
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 02:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqAqPhIqERgD29GWWy+ln9sbSBK7E7D/BXF1DQNgTDU=;
        b=O2+RQyS8HsQ7EWLgCpAFgp+Vo3Omg/v6W5paOULH5B7BSlhnwQP/nFusR6fwnTU9gp
         O4Q6ZhCect9eMFhcnj9t+ssyCA+MJvXSHvhhHCXi1z/d2V8H5FfqzpbJ3EtLQ2iojyVG
         DFdjwFodA+NvbyhmpAMLyv4tAdroDBSBb1dlpVMMBU0m5dL4j1G+DAMaNrG7g4R3kdye
         G88ukGxjX/VOSUv0oz06f1S1dfu8TfJXd+QOa0O3i+XlAlJlBClDMuPR3s8nw9BvMLdA
         NikjApF5FhKT4adr5i91Yx9Oplfat0/3y1VYr8hFbR5ER0THlyojVdP1ZoXZEwD7/a5o
         bbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqAqPhIqERgD29GWWy+ln9sbSBK7E7D/BXF1DQNgTDU=;
        b=sesG6P1vgq6SFya6xMp3IL6r7Pv77CIaA6+RS7OIWIrYAvd8YWrmdDCPyCwsBiWnZD
         JXmhLwihDHESdgBCfYocj76MHaXYelg9NFJbmZAY91dPSo7XISOB3JT6DubCwWnDdzuj
         xk7bxdquUabaJp0CyWYTXxyUFTdEAJr/NGsptOfy7HpmId3baqhbnFaH1/9RoCpouqwp
         giHJ19aTB6rewBykS15SEl9t4RE4Z6ij63GZxf8YKv15ezHc2PUVIsSF+WE8k7oAJt8B
         6zaBJM1rw+iWykZYV9SWbfdH9E1ThUP1cO3I67PjqcJxWEHNZVheaNUXwr7ErNbMi9Xl
         EZSA==
X-Gm-Message-State: AFqh2kpPvkF2NFz6U66XDNpR9p5lS4BeX69cHlK6K2jOdIpSWbE0pF8r
        vJAYHSxhrg9E3pvg/qzcuBmYGQ==
X-Google-Smtp-Source: AMrXdXuDMndAcHwHQy7+2S02KFcRC5cWaGLNPd+fcA5kFAGcMEV2c1u69dIoKNmuKgcu+Jr/wn3GvA==
X-Received: by 2002:a17:907:c011:b0:7c0:e5ca:411c with SMTP id ss17-20020a170907c01100b007c0e5ca411cmr52648321ejc.17.1673261367517;
        Mon, 09 Jan 2023 02:49:27 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id a20-20020a17090680d400b007c4f32726c4sm3579814ejx.133.2023.01.09.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 02:49:27 -0800 (PST)
Date:   Mon, 9 Jan 2023 12:49:25 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        18701859600@163.com, bsp-development.geo@leica-geosystems.com,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH V4 1/1] clk: imx8mp: Alias M7 SRC/DIV to M7 CORE
Message-ID: <Y7vxNX2HAp5TPoWp@linaro.org>
References: <20221214030719.4123889-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20221214030719.4123889-2-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214030719.4123889-2-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-12-14 04:07:19, LI Qingwu wrote:
> Defined IMX8MP_CLK_M7_SRC and IMX8MP_CLK_M7_DIV in imx8mp-clock.h
> but never assigned. It will cause the system to hang if using them.
> Alias IMX8MP_CLK_M7_SRC and IMX8MP_CLK_M7_DIV to IMX8MP_CLK_M7_CORE
> for backward compatibility.
> 
> Fixes: 8c83a8ff4dd9 (clk: imx8mp: use imx8m_clk_hw_composite_core to simplify code)
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
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
