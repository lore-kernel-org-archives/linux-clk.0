Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51A3C77B7E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 14:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbjFAOvb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 10:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233476AbjFAOv3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 10:51:29 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB33180
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 07:51:24 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2af20198f20so13050571fa.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631082; x=1688223082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlQa6nyYkrP42ALPoHQesic/eQ0yRPGYPn5Y7l5zRIo=;
        b=UZFxKojURWoFiXbFXlx8hnvi1gjYaMIsNB26Cgzw7733KuPIHLTGRLzq4W8EHDUvc3
         Ckhi3atFrAVPVH1F/hHiHGBKwxns0e7CJhUTKY0AZNZockvTZRfx7A5uIo0355Cf6ReN
         r0oLDRJYYvTn8UvN64VJ2MyGCLgkSpJjNj+b6cH3pRcqbCj5rFXuNde7vngHGtJ/mcBa
         N5EkbqfaBJ6b0PHfvtW6N/P3uDgsffLO/L8EiTi5vWO2sI9E7TBWB3oYE11Nrvu22i8n
         Rn5QHjJvH43nmXuSm4YeFV3yAV6T55AA/vjlbDhKuzgjc2QxO9+4vrigY9EnsHh0Wo8L
         e4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631082; x=1688223082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlQa6nyYkrP42ALPoHQesic/eQ0yRPGYPn5Y7l5zRIo=;
        b=NTgr+id5P8O/Brnrl/uo9whgIo1CRyOWEklftvLrU0LrxhIsBT6aPmDbYAfjV4JKlh
         8hehY4xZ6gf8FXrQv3W7GKpMtN1SD7JRhL1+j0EVgwrD4d5G6VgU1YetZ910QnXe1mKv
         Ym9S64d8cmfA+K0hGdTrMgmZols/j2q5u+oXtAIGulzYvbADPyTTLa7LiGgW2GrRe92S
         Nm5NatDrHllHL0KfvS8qgYUBtOnK6MSDX3+KRaRltejR7I08ESaWYgMKGgEdl3Lu3cDC
         YrHX8jLtewDZG5cKPNzih0wuv9ozskVyCHsez47kkZuUc/aLLvolc3k3fAHyDcDlCUnj
         JekQ==
X-Gm-Message-State: AC+VfDwmGbilUFGmg5VrE0XouuNJ6KB/DEZyQl4P3t/D7PdBb/aXWlD3
        dG4NkCfSIhG/b5jv07hIzahy+g==
X-Google-Smtp-Source: ACHHUZ4KzlhybJYdOtJZ4v16Y42fWzlTmzhvxjOxmHjAorYRhNaHxhyJjsaIC0k9tINOcNMy7Qeq3A==
X-Received: by 2002:a05:651c:10b:b0:2af:d2ef:49d4 with SMTP id a11-20020a05651c010b00b002afd2ef49d4mr4673473ljb.1.1685631082608;
        Thu, 01 Jun 2023 07:51:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e11-20020a2e984b000000b002a9ebff8431sm3803994ljj.94.2023.06.01.07.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 07:51:22 -0700 (PDT)
Message-ID: <95bd4c66-08c6-15f3-db6c-97f820fe5517@linaro.org>
Date:   Thu, 1 Jun 2023 17:51:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 3/5] clk: qcom: camcc-sm8550: Add camera clock
 controller driver for SM8550
Content-Language: en-GB
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230601143430.5595-1-quic_jkona@quicinc.com>
 <20230601143430.5595-4-quic_jkona@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230601143430.5595-4-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/06/2023 17:34, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to be
> able to request for camcc clocks on SM8550 platform.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes since V2:
>   - No changes
> Changes since V1:
>   - Sorted the PLL names in proper order
>   - Updated all PLL configurations to lower case hex
>   - Reused evo ops instead of adding new ops for ole pll
>   - Moved few clocks to separate patch to fix patch too long error
> 
>   drivers/clk/qcom/Kconfig        |    7 +
>   drivers/clk/qcom/Makefile       |    1 +
>   drivers/clk/qcom/camcc-sm8550.c | 3405 +++++++++++++++++++++++++++++++
>   3 files changed, 3413 insertions(+)
>   create mode 100644 drivers/clk/qcom/camcc-sm8550.c
> 

[skipped]

> +
> +static struct platform_driver cam_cc_sm8550_driver = {
> +	.probe = cam_cc_sm8550_probe,
> +	.driver = {
> +		.name = "cam_cc-sm8550",
> +		.of_match_table = cam_cc_sm8550_match_table,
> +	},
> +};
> +
> +static int __init cam_cc_sm8550_init(void)
> +{
> +	return platform_driver_register(&cam_cc_sm8550_driver);
> +}
> +subsys_initcall(cam_cc_sm8550_init);
> +
> +static void __exit cam_cc_sm8550_exit(void)
> +{
> +	platform_driver_unregister(&cam_cc_sm8550_driver);
> +}
> +module_exit(cam_cc_sm8550_exit);

Please convert this to use module_platform_driver

> +
> +MODULE_DESCRIPTION("QTI CAMCC SM8550 Driver");
> +MODULE_LICENSE("GPL");

-- 
With best wishes
Dmitry

