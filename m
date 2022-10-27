Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FB0FA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 12:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235547AbiJ0MlY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235620AbiJ0MlI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 08:41:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653847C18A
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:40:57 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g7so2581678lfv.5
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOGsOSU6qiApXuDl4gAi6VlxOgrLgNHBnKcPxr+QRFU=;
        b=cCF2ppUqxh38Komk3UstEWzGoeeosemva+oE1wDdzPFNXDdsCXAGt7pxUTDnYUPxbb
         7zPV8fEg6XYw1mw7fEGhgOc4F6bAu1K3i4gTSrTbaIPFcCdpB+Kj/Z9ZiwzQZBiqV5a2
         hq4nT7SKT2bGbvfV3ExMc6+SdFRpkpyq53V03rBNEZFo47wmvNKy6idVZixCr9vwmq2f
         Qm1YTz0QEtyPjDH/EWOYhf7k8R85j+JuJ3PwsFyBHXYtTiDLSbBHrlIuk5Gj5v0ynujU
         6LpYtEU9IrS7RsUEgLurVxtOpy4SwlvRtQEETAk6zl98lyD7i7d+H4L4CkoemMJt2JrF
         5Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOGsOSU6qiApXuDl4gAi6VlxOgrLgNHBnKcPxr+QRFU=;
        b=HglqS9YBMdW/N//3VLL3JcU7cmsoEsiFlBqoWeGEsBfL/MDkBw1hdN3bhNe90jpwnn
         nuewXVpzCsg6zS5eliJPq3wqJ9EDpcfOswOewav3TMlljjCOE+/UoiMWFlpl7VEauzZi
         3zTYvFeCVyQM+totwg5dS3jdOJBlp1KTWJ4d/VMYPvtsJfGP+6nI7aH/vRqe36H1XQrU
         2Db2SbFXaFaEh1nR/fWXnS6S583hf4Igj5yPl0H1al5uOXfavLmwuK0yoz1hE9rG2xkd
         f4VT62dHnQfKfxZsg6tmcue3+1bzGqTd/qkFEBRLwjNFuy55hZBFDfIf6SWGT3eVI+H/
         M3xw==
X-Gm-Message-State: ACrzQf1qynEZvHmxRGJr6IzO7xZPRghKmqyM/s5dnwBp4Zv1EMdodU9n
        Sl6duvqC6TkbCDTLUS6suUNt+w==
X-Google-Smtp-Source: AMsMyM4n44HMnbB16xltc6uPiXGeeBKXGjBuscM0W+8rVYB2d9/rXCms2g64vrLTehThtzLi3MY8tQ==
X-Received: by 2002:a05:6512:1092:b0:4a2:6a45:1f0d with SMTP id j18-20020a056512109200b004a26a451f0dmr19337622lfg.483.1666874455598;
        Thu, 27 Oct 2022 05:40:55 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id a13-20020a2eb54d000000b0026de1bf528esm210847ljn.119.2022.10.27.05.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:40:55 -0700 (PDT)
Message-ID: <3b58b4a3-5e74-d848-211a-e127fb4440b6@linaro.org>
Date:   Thu, 27 Oct 2022 15:40:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 5/5] clk: qcom: dispcc-sm8250: Disable link_div_clk_src
 for sm8150
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
 <20221027123432.1818530-5-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221027123432.1818530-5-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 15:34, Robert Foss wrote:
> SM8150 does not have any of the link_div_clk_src clocks, so
> let's disable them for this SoC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index d2aaa44ed3d4..f6f719616f63 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -1289,6 +1289,10 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
>   		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
>   		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
>   		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
> +
> +		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC] = NULL;
> +		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC] = NULL;
> +		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = NULL;

We also have to fix link_intf clocks:

disp_cc_mdss_dp_link_intf_clk.clkr.hw.init->parent_hws[0] = 
&disp_cc_mdss_dp_link_clk_src.clkr.hw;
disp_cc_mdss_dp_link1_intf_clk.clkr.hw.init->parent_hws[0] = 
&disp_cc_mdss_dp_link1_clk_src.clkr.hw;
disp_cc_mdss_edp_link_intf_clk.clkr.hw.init->parent_hws[0] = 
&disp_cc_mdss_edp_link_clk_src.clkr.hw;



>   	} else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
>   		static struct clk_rcg2 * const rcgs[] = {
>   			&disp_cc_mdss_byte0_clk_src,

-- 
With best wishes
Dmitry

