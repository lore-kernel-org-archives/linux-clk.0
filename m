Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A895C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiKDVcG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiKDVb7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:31:59 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E342EF03
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:31:57 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id d26so16478473eje.10
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AXeLyBT66GcyNMkGNLXyVq2BhJDegmKs2IP6Dg3V8qs=;
        b=s4ZFu+PCO6R25MJtYlf69zGk3gnbGDZkaUqyPYLtWvW6MIMnBIjnyTKebSWOx9jAnF
         6LiEgJJ0FDwh04Zurj3z1tPIq9+Lr+nYILvIKiw1U1tJ3njQ9J3EooL7eICl+nZ1IEIX
         nfDiUD5j8fbuAqAgnFbqHSQBGbciDdKaruJ8U26Syo6k/m5HNSw40sAl6gq7mCfwTopi
         lt6wyHQ59TL/bHONQ9xyM2dZVQyVMnj7+UnZ4WwOhAdvzMtigS+X7RaUR1iC4NjsdImw
         G6z9z01hWRlXxPGHwJEqMKVZ6uvExDq3RKgmJO61cryUMW630NioRgpW2cCA2OYcsvFj
         l11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXeLyBT66GcyNMkGNLXyVq2BhJDegmKs2IP6Dg3V8qs=;
        b=QxDUHkjWWbMa6D5EvVjGcnpZdQs249xr+A0J/5sxWMWByLeaI4XT1jw3hXTqHsxlS6
         sAY343zVWDDsIGvJ6UsBLfiSrq6zgpKClfw65YhV/64ex6xSpAYLOovpmEMC2i+FQr5E
         W4N/lAtjntjQByFVeOXGxfFsP93xAYSzfw+nbX3OlpdWKDgy9zOeBH7iNmPkVNg36bho
         OVOP5bDLMRqgrBtF0Q5VLLRXqDnZgiTrDMx7judsoIDu3je/teRouV+ayV0WmMpgxeWU
         HLyxf4x5j5ojr/0Uf/RvaWL0ZMqKbdw6UpKSq5ju5Mf6P+P16VLk2wVWDJKMCqK6Yutz
         +Mvw==
X-Gm-Message-State: ACrzQf2jsfVxO6FktewH7urbZ2kjIpvJ4Zc4A0tdwDIFOcvNtX9QvxI3
        xsyIJQdhuKj02qY326q6TSkL9Q==
X-Google-Smtp-Source: AMsMyM5b811dTOciUQ1WKFKeaNpDRnVgKPJ8hWO1y+EM8yeTBh4emwKaqkeDo/SAaFhkTuhBWRukyw==
X-Received: by 2002:a17:907:746:b0:741:4a1b:cb1f with SMTP id xc6-20020a170907074600b007414a1bcb1fmr35116157ejb.370.1667597516128;
        Fri, 04 Nov 2022 14:31:56 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m19-20020aa7c493000000b00458dc7e8ecasm263591edq.72.2022.11.04.14.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:31:55 -0700 (PDT)
Date:   Fri, 4 Nov 2022 23:31:54 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 6/6] clk: imx93: keep sys ctr clock always on
Message-ID: <Y2WEyhj7L8nyoBuu@linaro.org>
References: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
 <20221028095211.2598312-7-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028095211.2598312-7-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-28 17:52:11, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Keep sys ctr clock always on to make sure its register
> can be accessed for cpuidle.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx93.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 7dace96f36df..b42a877ecca1 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -242,7 +242,8 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_HSIO_32K_GATE,	"hsio_32k",	"osc_32k",		0x9dc0, },
>  	{ IMX93_CLK_ENET1_GATE,		"enet1",	"wakeup_axi_root",	0x9e00, },
>  	{ IMX93_CLK_ENET_QOS_GATE,	"enet_qos",	"wakeup_axi_root",	0x9e40, },
> -	{ IMX93_CLK_SYS_CNT_GATE,	"sys_cnt",	"osc_24m",		0x9e80, },
> +	/* Critical because clk accessed during CPU idle */
> +	{ IMX93_CLK_SYS_CNT_GATE,	"sys_cnt",	"osc_24m",		0x9e80, CLK_IS_CRITICAL},
>  	{ IMX93_CLK_TSTMR1_GATE,	"tstmr1",	"bus_aon_root",		0x9ec0, },
>  	{ IMX93_CLK_TSTMR2_GATE,	"tstmr2",	"bus_wakeup_root",	0x9f00, },
>  	{ IMX93_CLK_TMC_GATE,		"tmc",		"osc_24m",		0x9f40, },
> -- 
> 2.37.1
> 
