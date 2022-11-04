Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F4FC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiKDVmt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiKDVms (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:42:48 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C459A4387E
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:42:46 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id f7so9489206edc.6
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg1nxhSdhqb33g9FGYVmWNSbcGrJaakkVgN/anXR2c0=;
        b=I4ZmiKvKu0bh4DTyzybENVVIYCZGuwq0+49NaEj/XSYsn+s3QCEWWrIqWbtHHXESQF
         1x8xBzAiiwBdM6cR8+WElgHkEBBhfnZzHTfrEBWgwDdtrYl7kvxzPO8Rn8LFSzYlh2w3
         CNYBmsXg5HLUFA1g0RGO2aAmA05j4+NvweGz2kcTriHY26+oHLlGhyi+w//UIYT9LNj8
         GKyC6vtPeJ8r8kGP4dvlJEyBcMWqX+F3xCAKE3H3YaCLUs8vDqGyLXAhGy+nrclMUPxD
         XAJmTp6wZ8uPlYXP3NirtPxDgyLhMOawKDzeaM5bG3B/C12WuJk6h7HrLdieBzL7u5Wt
         oSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg1nxhSdhqb33g9FGYVmWNSbcGrJaakkVgN/anXR2c0=;
        b=fEiRbDuVybUxeXXZKHYe4xctByY4rosFLd37wcwzQ5x3lePMss+DbGISMKy56EEZJN
         geov6AcwpzJk8VqyBiwy6Hsq09fVHUs/huMM6SH6YoLazbpNKMK9MIGp5mI2/peTkxR7
         4YtI9m3Lk5HFC3oq1ZTprlSz/sKMq9Ti4zFgMO0mmToFCadupY/6Ymoa9H+OFXX4nJ5n
         KiLf1QNUGdR4jPhwlwhDsJdWqDvpy2kxGLVTtdQWl3irx22zpfTlwKBkayBI6OZSyQAL
         6J1KbdzuL1uHdR91DKyKVskpCdhy1Csyc1fKxX/hpw04DfnMnWARgW8Acnb7n9H1AHG8
         3JjQ==
X-Gm-Message-State: ACrzQf3nD6lcpSRNd5okjHPLChw5gtYJjtShIlmedGI1x5AGheBJ82Z9
        XCbFruJ7l+FIxuT+0zVMbcKGCA==
X-Google-Smtp-Source: AMsMyM7NAVrlIA+aTC7iR7/ZUaiCNJPc93qZ04EZdIH1JhZ0afooHByDqqY6uqAlqM2FidFx0AkUew==
X-Received: by 2002:a05:6402:440d:b0:450:de54:3fcf with SMTP id y13-20020a056402440d00b00450de543fcfmr36865871eda.312.1667598165334;
        Fri, 04 Nov 2022 14:42:45 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090623e200b007adaccb9d83sm36789ejg.193.2022.11.04.14.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:42:44 -0700 (PDT)
Date:   Fri, 4 Nov 2022 23:42:43 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     shengjiu.wang@gmail.com, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, marex@denx.de
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: imx8mp: Add ids for the audio
 shared gate
Message-ID: <Y2WHU4pKDbDLT3Oz@linaro.org>
References: <1666935144-7364-1-git-send-email-shengjiu.wang@nxp.com>
 <1666935144-7364-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1666935144-7364-2-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-28 13:32:23, Shengjiu Wang wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> All these IDs are for one single HW gate (CCGR101) that is shared
> between these root clocks.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  include/dt-bindings/clock/imx8mp-clock.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> index 9d5cc2ddde89..2f6fec299662 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -324,8 +324,17 @@
>  #define IMX8MP_CLK_CLKOUT2_SEL			317
>  #define IMX8MP_CLK_CLKOUT2_DIV			318
>  #define IMX8MP_CLK_CLKOUT2			319
> +#define IMX8MP_CLK_AUDIO_AHB_ROOT		320
> +#define IMX8MP_CLK_AUDIO_AXI_ROOT		321
> +#define IMX8MP_CLK_SAI1_ROOT			322
> +#define IMX8MP_CLK_SAI2_ROOT			323
> +#define IMX8MP_CLK_SAI3_ROOT			324
> +#define IMX8MP_CLK_SAI5_ROOT			325
> +#define IMX8MP_CLK_SAI6_ROOT			326
> +#define IMX8MP_CLK_SAI7_ROOT			327
> +#define IMX8MP_CLK_PDM_ROOT			328
>  
> -#define IMX8MP_CLK_END				320
> +#define IMX8MP_CLK_END				329
>  
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> -- 
> 2.34.1
> 
