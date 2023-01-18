Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17983C38147
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 14:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjAROIS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 09:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjAROIC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 09:08:02 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06519A8388
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:44:13 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id bk15so25827262ejb.9
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Dh0QLLZzta5LKG1zmma3eIkQGyszm+yGfi2ZxnY8pA=;
        b=TwCNCRUBe+6um3oYvtnga0duZE0bo0MKFCPyFy2a269oi7MNc0D4Ln0nQsc01r1dFF
         W7sNPKNQpT93Mx2YcaUeCWEfu/hLBXNc9n/4A5PsDeNpHH+iMvfc3tkowpA1A25yxVHv
         cADATgM2Hf5AS9ZzYEjvQw+bmIL4zi3+pl8K95KBPmgR/lOZ9GnRF+4nWuT7RftBqrp6
         NobVwEwYqMmmw9FT80MU7GVuNx4F0ZeSQyajJpn0J31PLt7ELmmHD9HiPIIEtrLJL/AX
         nYFcUlEj6QUyZ/J9WIibHWOR4cv/CQ4rfjK4RYtRxumD/WlEYNXwmfHyk2V1nZBZ+MDS
         Y4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dh0QLLZzta5LKG1zmma3eIkQGyszm+yGfi2ZxnY8pA=;
        b=bSfFa0w4jb8O3H16AYQyMYJf/gzaAfqDUhpqBomT2CVgX0CHlwiHfybLOQDq6RASQi
         5M3tPbBL3rIVeVvqTqqwlJ/jih0+S25A8IRcF/Hr9CjjZKyOO+HZfgeaVYkBJ2+AtTPj
         8hT0NNmRlo3VEQeupK1pIYH3EJeHgKWFA9lE3+vU/ZEzbMJtNzhf3O5O7ptPFnlcJ5HR
         kTmE+k8CvPccNoAxSpqeKa+7tixG7uVjMplWUcfs4MC0myyevk9iOEXR4g8GvttReb9G
         yTlgatoweJp4TJt2CsUcWf0sJsMGpnzF0X0rsMJq8Bp60R7cmxomPZSMK679aIz9glhA
         4uVQ==
X-Gm-Message-State: AFqh2ko8ayudsYiE1vsRWOYQCjC1Y1nk8eGtZzLGcLQB3sXPmCni4eSH
        mHCTm1buVfHKZyCTDF+EPnLJ2A==
X-Google-Smtp-Source: AMrXdXsbkgf2ylb56IUty71Eu7bxQxGqm5DhzImRcE3FZmcy5YZL4PQNGjPS7eTdbK3G7hvaLZ/nWA==
X-Received: by 2002:a17:906:8154:b0:866:d17a:e50 with SMTP id z20-20020a170906815400b00866d17a0e50mr6825572ejw.70.1674049451589;
        Wed, 18 Jan 2023 05:44:11 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id k2-20020a170906970200b0073dbaeb50f6sm14507622ejx.169.2023.01.18.05.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:44:10 -0800 (PST)
Message-ID: <2382c5f5-f57d-1fc6-497c-b355aed08036@linaro.org>
Date:   Wed, 18 Jan 2023 14:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117225824.1552604-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.01.2023 23:58, Dmitry Baryshkov wrote:
> Add device tree node for the CBF clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 150d13c0f4b8..7d8e31b84959 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3562,6 +3562,13 @@ saw3: syscon@9a10000 {
>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> +		cbf: clock-controller@9a11000 {
> +			compatible = "qcom,msm8996-cbf";
> +			reg = <0x09a11000 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
This should be RPM_SMD_XO_A_CLK_SRC, downstream consumes cxo_ao.

Konrad
> +			#clock-cells = <0>;
> +		};
> +
>  		intc: interrupt-controller@9bc0000 {
>  			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>  			#interrupt-cells = <3>;
