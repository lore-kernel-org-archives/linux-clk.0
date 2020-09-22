Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC874C2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 21:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 983E6238D7
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 21:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijq884l+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIVVtR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 17:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgIVVtR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Sep 2020 17:49:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB853C061755
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2020 14:49:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so15407550ljj.12
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2020 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YyT3Cqj49TWLOGm0xlbDdLx8xJJ2VmHIBnxNCQNfr+8=;
        b=ijq884l+tRHc9b5yBCIKcy0PdJF9gVxr67m+oS3g/jGEcajKNEV+yzDDuII6GBXNA2
         kdmrCv0CNxj4TwKLPpuE9QxdokL09sjjdjxsLfRMvhTRLfkMTcYYuq0QdpLHPT+0tm/B
         AI0vaXE5w7flwhZc+x5QTFyrPzzrBNhgmfCTdKI/asZTclqF/e1EtDJQ3GvMNCTxpjeI
         aBIclP8F1DROshY06R/q7EmeHDclZkhTf0t2dYsrxMW6gPdtbA5am/V5BmWVj6W0D/VW
         3wa7SpX0jOzn7Zx3nea0GzfsrHnvZgdjjdzKvbm/Fq0pGEtXuANpkFRd1BuNiYq4lCoj
         Hgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YyT3Cqj49TWLOGm0xlbDdLx8xJJ2VmHIBnxNCQNfr+8=;
        b=QA8F1ML11MR6N3lcRaryVWQJoYIbm/gCdwESegnHV/g2vgTK1k75onWz5eOAI8urDC
         I5sJ0DeaUh6R6R3aNSGdd8KrZr8vqrensUHn/QcGiBarB9nISD+6c7E0QpdqBdFMIKml
         wxcRRUlqN3jTKwCjaL2PU2Lf79y6k9RS+LEBqZdXRNM2ZxzbqEKybcdCdGFmzV8tlXC2
         hxBOl5bzjZbz8zeo69mpRHAbZ8QiacUbsCW3EQcXQLvtiKANLkmiM2H5JCTKaCmXgvPe
         zH+XJCBvom+4MYL+6y8mJd7GY+pdlaA5v8KychghTTXj6LUN3955HbrXkwnTui+2apTl
         qOvg==
X-Gm-Message-State: AOAM531VB+V0rQac3RLSQpDGU3NbkXwU2vgCaPkA2xmUP8rPYiqXWMqm
        bu2h5S6y+UUGgR07VpmS2KbsoA==
X-Google-Smtp-Source: ABdhPJx8yNE+u6mtpmZmCr8b6V1cSsLYwrxMiPnor/XnMrQIT/t+7IrzJ2/xbJK1Rufl7QO60iXY5Q==
X-Received: by 2002:a2e:86d3:: with SMTP id n19mr2304219ljj.368.1600811354955;
        Tue, 22 Sep 2020 14:49:14 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.186])
        by smtp.gmail.com with ESMTPSA id w30sm664526lfn.102.2020.09.22.14.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 14:49:14 -0700 (PDT)
Subject: Re: [PATCH 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free
 Mux clocks
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
 <20200917132850.7730-4-srinivas.kandagatla@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fd524c82-592c-fa41-f9bb-8693b68e4caf@linaro.org>
Date:   Wed, 23 Sep 2020 00:49:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200917132850.7730-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/09/2020 16:28, Srinivas Kandagatla wrote:
> GFM Muxes in AUDIO_CC control clocks to LPASS WSA and RX Codec Macros.
> This patch adds support to these muxes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig            |   7 +
>   drivers/clk/qcom/Makefile           |   1 +
>   drivers/clk/qcom/lpass-gfm-sm8250.c | 235 ++++++++++++++++++++++++++++
>   3 files changed, 243 insertions(+)
>   create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 2eda63b7c46c..4e46fd339e62 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -494,4 +494,11 @@ config KRAITCC
>   	  Support for the Krait CPU clocks on Qualcomm devices.
>   	  Say Y if you want to support CPU frequency scaling.
>   
> +config CLK_GFM_LPASS_SM8250
> +	tristate "GFM LPASS Clocks"

Since this driver can be built as module, few things are missing (see 
below).

> +	depends on SND_SOC_QDSP6_COMMON
> +	help
> +	  Support for the GFM Glitch Free Mux LPASS clock. Say Y
> +	  if you want to support GFM Clocks on LPASS for SM8250 SoC.
> +

[skipped]

> +
> +static const struct of_device_id lpass_gfm_clk_match_table[] = {
> +	{
> +		.compatible = "qcom,sm8250-lpass-audiocc",
> +		.data = &audiocc_data,
> +	},
> +	{ }
> +};

MODULE_DEVICE_TABLE(of, lpass_gfm_clk_match_table);

> +
> +static struct platform_driver lpass_gfm_clk_driver = {
> +	.probe		= lpass_gfm_clk_driver_probe,
> +	.driver		= {
> +		.name	= "lpass-gfm-clk",
> +		.of_match_table = lpass_gfm_clk_match_table,
> +	},
> +};
> +builtin_platform_driver(lpass_gfm_clk_driver);


Wouldn't you like to use module_platform_driver() here, like other LPASS 
CC drivers do?

Also MODULE_LICENSE is missing.


-- 
With best wishes
Dmitry
