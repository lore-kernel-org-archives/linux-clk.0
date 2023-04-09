Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF24C77B70
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 13:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjDINrD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 09:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjDINrC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 09:47:02 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4C03AA3
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 06:47:01 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id sh8so6937904ejc.10
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681048020; x=1683640020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qVGkKW+EWENAWvp7HsvarUoEIpNCD9RuGiyODmnzCnc=;
        b=MlGNCGh7gUXfpxxJNU0rhD1Z3MIzdG+6Vob7AZk5xWdHu5NeG10zyJW+OMB7jG8i9C
         7CkLwh82F4WGwXIQ2r0cSe4ChD2wEohl9GucqPRnhmIFn27VE2fv7Q3ETdBzQv0InIIF
         EMIvVphhah7+ztg3WkzuU3hwR4CzOcL8bDW/f5c6atRqOuSmogdZRijtYMCZRHP3VJ4j
         5oEyitgSp4uVb2MUt64wV9eoSzHRiYoNnTV2DG52+vKzLoercbG8/9RsD88fVwF5Ckmk
         ovtTZm+FClsgr7E0nDVXB7GOGQaZtDCSE4KunajR71YY9rM9b3fOj6KWB5DzsVHjKjSJ
         1VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681048020; x=1683640020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVGkKW+EWENAWvp7HsvarUoEIpNCD9RuGiyODmnzCnc=;
        b=FiVaA1vjoJqop/zJkzhPLWSSXgbW8DgRsK97nO1TA6LRzwy7g87028Gq6Mfwx6L9BI
         NY39aUxAqB2mGlsVnqLbweOqKf73jHnXF7BekGbhtWtmAxh0Z2sP15ANtfvnOuMxkWqy
         ZbLBO4FClmS96Ru33NlM93sSKJCnOb0YA3PjMCjBXnNJn6Xe0vWPa3OJpeCt4Ir5tGun
         vQTIQbzCe51LTYfjdPASJvwrRHXmVU5YgNUJfgCKOgu8zVPm4QgPCsKEQgfd6sRU1l9c
         mpdGvXSTPlg4lUtU3xnxDGoWLMDlOSzSU8DFaoF9T1h6DCWyeoFhPKE2JPnx4gtyInB9
         faAw==
X-Gm-Message-State: AAQBX9ddFGl+gGkgImUR/tZaQqb5fdbLLu3i3PcCBM/J5ea1SSjNLpj5
        QR5Itj4izCFS9RD7sgnchTjxCQ==
X-Google-Smtp-Source: AKy350a9atDUbjvFebF9fjuKLp2tJILWMQN2IzhGZ3vG1rLblRY3qOoDuOlRPPUEl+cWm5WPkMRyaQ==
X-Received: by 2002:a17:907:1111:b0:947:7a69:96cf with SMTP id qu17-20020a170907111100b009477a6996cfmr4505983ejb.22.1681048019783;
        Sun, 09 Apr 2023 06:46:59 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id re9-20020a170906d8c900b0093dbb008281sm4162829ejb.130.2023.04.09.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:46:59 -0700 (PDT)
Date:   Sun, 9 Apr 2023 16:46:57 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Subject: Re: [PATCH V3 5/7] clk: imx: imx93: add mcore_booted module
 paratemter
Message-ID: <ZDLB0SMCyYFFovI/@linaro.org>
References: <20230403095300.3386988-1-peng.fan@oss.nxp.com>
 <20230403095300.3386988-6-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403095300.3386988-6-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-03 17:52:58, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add mcore_booted boot parameter which could simplify AMP clock
> management. To i.MX93, there is CCM(clock control Module) to generate
> clock root clock, anatop(analog PLL module) to generate PLL, and LPCG
> (clock gating) to gate clocks to peripherals. As below:
> anatop->ccm->lpcg->peripheral
> 
> Linux handles the clock management and the auxiliary core is under
> control of Linux. Although there is per hardware domain control for LPCG
> and CCM, auxiliary core normally only use LPCG hardware domain control
> to avoid linux gate off the clk to peripherals and leave CCM ana anatop
> to Linux.
> 
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-composite-93.c | 8 +++++++-
>  drivers/clk/imx/clk-imx93.c        | 2 ++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
> index 74a66b0203e4..81164bdcd6cc 100644
> --- a/drivers/clk/imx/clk-composite-93.c
> +++ b/drivers/clk/imx/clk-composite-93.c
> @@ -222,7 +222,7 @@ struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *p
>  		hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
>  					       mux_hw, &clk_mux_ro_ops, div_hw,
>  					       &clk_divider_ro_ops, NULL, NULL, flags);
> -	} else {
> +	} else if (!mcore_booted) {
>  		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
>  		if (!gate)
>  			goto fail;
> @@ -238,6 +238,12 @@ struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *p
>  					       &imx93_clk_composite_divider_ops, gate_hw,
>  					       &imx93_clk_composite_gate_ops,
>  					       flags | CLK_SET_RATE_NO_REPARENT);
> +	} else {
> +		hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
> +					       mux_hw, &imx93_clk_composite_mux_ops, div_hw,
> +					       &imx93_clk_composite_divider_ops, NULL,
> +					       &imx93_clk_composite_gate_ops,
> +					       flags | CLK_SET_RATE_NO_REPARENT);
>  	}
>  
>  	if (IS_ERR(hw))
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 8d0974db6bfd..de1ed1d8ba54 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -352,6 +352,8 @@ static struct platform_driver imx93_clk_driver = {
>  	},
>  };
>  module_platform_driver(imx93_clk_driver);
> +module_param(mcore_booted, bool, 0444);
> +MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
>  
>  MODULE_DESCRIPTION("NXP i.MX93 clock driver");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.37.1
> 
