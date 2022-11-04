Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC9DC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiKDVWb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiKDVWZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:22:25 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341E5E097
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:22:22 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 21so9470240edv.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dv6vKhA7/0tx8qHpzhe0LvJShqWbHA3mx3+c4jsPwTY=;
        b=e8Y3LSf/63D1wdxvc49AwexkfvAzLZy5y17OJ3AWONYSg1lc+iq2rn3y/0cvcAQ9Lo
         CcgIRwJinTJaPhFMRaZ8g2eadHQfgAwFVXwp0scKVcPVOhrreRQVNVoPsv0KRIAN5SZT
         ctiPB/cYzg179q6JMJVJjEHK45YMEMj/Rqg45SxiMAvpB0a0vsAVXxa6rnyrqLQBiFka
         Y14+CERUpL4MSo/HtjDJKuJKk27MhgwMmxrXN4iUn5/K0+MoCaG5WsSl0zt4QUmZk6eD
         8QCZAwq/iFUVAXV76iaYM7XwYdqDhJYLKYlr37PIO+2gJcb0TQMbA8bXvme19vBPZdBi
         MBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv6vKhA7/0tx8qHpzhe0LvJShqWbHA3mx3+c4jsPwTY=;
        b=nrsOCkZYxKfWNagUoV2HsW38SHFuuHAoYjn3r4768iGfW+xdirxNCRpRxjX2ABlLXE
         +1b01hAGNw1hPJFiKBTxiKvyZBaOGWmjVBk0knx9pnMiB83KbtVghBqMM+9YZoXleBMf
         xWmyhwGzXvbvW5CrnOebo/KgjrO+CDfpY2zyUgBBjCPBoumeWzbrb1qN7wMXuzE22nDZ
         ueSMtGrrPBbVJJu4++KlNgqM2PNOuk6NPeUXfG5jM8nSxFgJsFBQ9B4GPs6cGbbXlf4+
         kbf62lf5mWVCrh093pEcE10r2pfeA8mIwThnyUR9uVols4savGa/0SRvUr68kzPBKtTv
         Ch1w==
X-Gm-Message-State: ACrzQf1xJKcQua5pm95e4p1BTuUL8b0o4YLmCbQiCTKszKK3qBRwlvRk
        vbIuvT8eP0cO7xKWoJ0+EOVP58jYmg4mMg==
X-Google-Smtp-Source: AMsMyM7y7SOuTkKGl6VWuaHdUhj0dWMHNRFxppBbKmTRgGVCK3dL0OYx+rdnxb5yojNcWQiLMLbJ0w==
X-Received: by 2002:a05:6402:40cc:b0:462:555e:5f73 with SMTP id z12-20020a05640240cc00b00462555e5f73mr39047300edb.259.1667596940754;
        Fri, 04 Nov 2022 14:22:20 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id ku15-20020a170907788f00b0079de6b05c99sm31378ejc.138.2022.11.04.14.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:22:20 -0700 (PDT)
Date:   Fri, 4 Nov 2022 23:22:18 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 4/6] clk: imx93: drop tpm1/3, lpit1/2 clk
Message-ID: <Y2WCiogMOlFDv2Ic@linaro.org>
References: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
 <20221028095211.2598312-5-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028095211.2598312-5-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-28 17:52:09, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per Reference Mannual System Clocks Table,
> LPIT1 and TPM1 sources from bus_aon_root
> LPIT2 and TPM3 sources from bus_wakeup_root
> 
> So update driver to reflect that.
> 
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx93.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 7fdc30062a46..422ad3c89845 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -64,13 +64,9 @@ static const struct imx93_clk_root {
>  	{ IMX93_CLK_M33_SYSTICK,	"m33_systick_root",	0x0480,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, },
> -	{ IMX93_CLK_LPIT1,		"lpit1_root",		0x0600,	LOW_SPEED_IO_SEL, },
> -	{ IMX93_CLK_LPIT2,		"lpit2_root",		0x0680,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_LPTMR1,		"lptmr1_root",		0x0700,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_LPTMR2,		"lptmr2_root",		0x0780,	LOW_SPEED_IO_SEL, },
> -	{ IMX93_CLK_TPM1,		"tpm1_root",		0x0800,	TPM_SEL, },
>  	{ IMX93_CLK_TPM2,		"tpm2_root",		0x0880,	TPM_SEL, },
> -	{ IMX93_CLK_TPM3,		"tpm3_root",		0x0900,	TPM_SEL, },
>  	{ IMX93_CLK_TPM4,		"tpm4_root",		0x0980,	TPM_SEL, },
>  	{ IMX93_CLK_TPM5,		"tpm5_root",		0x0a00,	TPM_SEL, },
>  	{ IMX93_CLK_TPM6,		"tpm6_root",		0x0a80,	TPM_SEL, },
> @@ -177,13 +173,13 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_GPIO4_GATE,		"gpio4",	"bus_wakeup_root",	0x8940, },
>  	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, },
>  	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, },
> -	{ IMX93_CLK_LPIT1_GATE,		"lpit1",	"lpit1_root",		0x8a00, },
> -	{ IMX93_CLK_LPIT2_GATE,		"lpit2",	"lpit2_root",		0x8a40, },
> +	{ IMX93_CLK_LPIT1_GATE,		"lpit1",	"bus_aon_root",		0x8a00, },
> +	{ IMX93_CLK_LPIT2_GATE,		"lpit2",	"bus_wakeup_root",	0x8a40, },
>  	{ IMX93_CLK_LPTMR1_GATE,	"lptmr1",	"lptmr1_root",		0x8a80, },
>  	{ IMX93_CLK_LPTMR2_GATE,	"lptmr2",	"lptmr2_root",		0x8ac0, },
> -	{ IMX93_CLK_TPM1_GATE,		"tpm1",		"tpm1_root",		0x8b00, },
> +	{ IMX93_CLK_TPM1_GATE,		"tpm1",		"bus_aon_root",		0x8b00, },
>  	{ IMX93_CLK_TPM2_GATE,		"tpm2",		"tpm2_root",		0x8b40, },
> -	{ IMX93_CLK_TPM3_GATE,		"tpm3",		"tpm3_root",		0x8b80, },
> +	{ IMX93_CLK_TPM3_GATE,		"tpm3",		"bus_wakeup_root",	0x8b80, },
>  	{ IMX93_CLK_TPM4_GATE,		"tpm4",		"tpm4_root",		0x8bc0, },
>  	{ IMX93_CLK_TPM5_GATE,		"tpm5",		"tpm5_root",		0x8c00, },
>  	{ IMX93_CLK_TPM6_GATE,		"tpm6",		"tpm6_root",		0x8c40, },
> -- 
> 2.37.1
> 
