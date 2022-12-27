Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B572C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 12:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiL0MJD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Dec 2022 07:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiL0MJB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Dec 2022 07:09:01 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9332E1E2
        for <linux-clk@vger.kernel.org>; Tue, 27 Dec 2022 04:08:59 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bf43so19366780lfb.6
        for <linux-clk@vger.kernel.org>; Tue, 27 Dec 2022 04:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXLys1J24tWhJNMNDIL3lRZStG2ELm9eg0o3mPXaJEg=;
        b=o9F0Txy1w2CimvQdfCQgBZcoWxa7410Ee5lR8JVtYJczZMNHmwJ/2lVlIdqMHHnD/V
         gXPbD753SdPlwUGBPGQBVlyQY1mUVYcu2IgUkw6EXwTvKPc/hRzYRmsCa9Q06HBk0Sty
         r/dVk4jurwDcpDyJhLzdvm/0KedFb8JSHaB531r/AOJHKatIZh44iP9IXOBFHQPBGt41
         TsdkgbYVjjMMJDqYEu+MbbMKo/DIDrKAtOFm+UaEXEtjcskWBz0AYeUk1jin647rP92x
         LPL3KtN7P5ztTHpXT9h/z/H7aVa2vvKKG+E7k8HtNfdG9bRfyQs7eRakOumvvCsXElGJ
         01Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXLys1J24tWhJNMNDIL3lRZStG2ELm9eg0o3mPXaJEg=;
        b=LEeUeoI0DjSe9ierxD6i5wwLYW5FyET0gKmLaa3st4tAaYxCJi50AYjlecyg9vKkrd
         gwOl0+BWhcuXVXhnG4jxWjy830jOgzktjqvxNNOwfbkW3IzfFvRRq21QhutxUMA74tji
         alHRaldwRIKxsT5vqQnjpwcnGVL8TYJ/peWasZ3DZ0qedAn55GCaxDZ2VLc1zNHVH6D/
         A104Ne5zdl232YFLr9HRYdGtelWlv4RBZT08AZQPCA1X0hgLRM4ydg6rW308asGtf/7B
         lbSwyJqC7Ok8fW2aNIjBYoCfjIrseqfMkAOl+SB+UmF75t7z+1OQNOjkAZzoPIE2FG6B
         wGbw==
X-Gm-Message-State: AFqh2krxOoQCG6FWPO+3ePEbVPRG17CFnzXZC5r52vYVS0FRQjMHOgBE
        Rs+e4BE7oEvMbserEAHj0zIMbA==
X-Google-Smtp-Source: AMrXdXsbLJZTadwF8D6XZDSnCEJoJCoYR36AeRggDybJ2hvvIdV6i2+bqH9Qwk4krZ8KcHBZexorOA==
X-Received: by 2002:a05:6512:2805:b0:4b5:a53f:ac18 with SMTP id cf5-20020a056512280500b004b5a53fac18mr7181835lfb.69.1672142937989;
        Tue, 27 Dec 2022 04:08:57 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512070b00b004a45edc1de2sm2209319lfs.239.2022.12.27.04.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 04:08:57 -0800 (PST)
Message-ID: <a6622a6c-7378-4f3a-a34b-1227c51a3326@linaro.org>
Date:   Tue, 27 Dec 2022 13:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 12/12] ARM: dts: qcom: apq8084: add clocks and
 clock-names to gcc device
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
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221227013225.2847382-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 27.12.2022 02:32, Dmitry Baryshkov wrote:
> Add clocks and clock-names nodes to the gcc device to bind clocks using
> the DT links.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Though - again at the end of reviewing - I noticed you could have
gone .index instead, like with qcs404.

Konrad

>  arch/arm/boot/dts/qcom-apq8084.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index fe30abfff90a..815b6c53f7b8 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -388,6 +388,24 @@ gcc: clock-controller@fc400000 {
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
>  			reg = <0xfc400000 0x4000>;
> +			clocks = <&xo_board>,
> +				 <&sleep_clk>,
> +				 <0>, /* ufs */
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>, /* sata */
> +				 <0>,
> +				 <0>; /* pcie */
> +			clock-names = "xo",
> +				      "sleep_clk",
> +				      "ufs_rx_symbol_0_clk_src",
> +				      "ufs_rx_symbol_1_clk_src",
> +				      "ufs_tx_symbol_0_clk_src",
> +				      "ufs_tx_symbol_1_clk_src",
> +				      "sata_asic0_clk",
> +				      "sata_rx_clk",
> +				      "pcie_pipe";
>  		};
>  
>  		tcsr_mutex: hwlock@fd484000 {
