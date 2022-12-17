Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1BBC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 15:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiLQPJQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Dec 2022 10:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiLQPJO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Dec 2022 10:09:14 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40AD140A0
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:09:13 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id cf42so7765403lfb.1
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biT63TB8v0K+mP/ORq96IzRfC1ozk+iKl1BUj8cuy94=;
        b=BQfwHvf/pd00L1oWfinnX3YZLH+cS+VoB2lgTRqumN6xSSg16Vsy82Ezdj7cDlJCIN
         wPqJpk8svmaXmOERMjJWNEi3SbgITvCIq8qDf4riuxeDn77z9Cxa4GqnhI93ln6I73+a
         udiZd1k4eIZaserfQ5HSb0NIwrS+7Mr87Y0iJDZA9c3KpJisLCgBGCBTBmQL+JbxKQ2l
         czGIeuxyPmu035daVMN+okpwH4FEGzLOEHnv1/cpJlUTrahrTwasbwBqrUQFTxZSl/qw
         CNuVcyw+BPblxIsHsq874/4nkg0HoI0iaxQJXeYu3sueGBcUfFNpwJcRC0SM7JG5w0D8
         oe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=biT63TB8v0K+mP/ORq96IzRfC1ozk+iKl1BUj8cuy94=;
        b=33Rfhv1X6/fSLkcaXCl34q2CuAisBxdXDC1Me2k7iqZUXg2U2emVVI62sNTzt6+/ue
         9PvVXhnVW6z6LbDkBBPqKQvDTL1yJx2poFiENrcxSgYaBxg2ZOfJmZdfx65lr5XRobcl
         2j8DHjU4y/ysMJGWxl+UuM6De7I6rLHh/kfZuW5bHx7eFBq2gSGfQpiuvkqrMA/69Sc8
         gEjOm63CLUHkCy3Pyk3t8GOBRadZDTlSsslwzsxi+58vYHwzBrIqOWZascmbx5MI11dG
         bguq9POkde2PYeWrbcBafZruJJxjbGlmXKHrejaMYmH0f2+FCEkOJKtHlIjthYJSipUH
         5siQ==
X-Gm-Message-State: ANoB5pmyFGlCRWedwHOkT6YGR0QhtZ6NM0/Va1qeODV8WxW/FW6wM72s
        8M3gcazV4OvVPVWVtveoIAvclg==
X-Google-Smtp-Source: AA0mqf7WuI8tGEnjrMKhaDPaMG16Ka/27YUNze3g+KbtwB+FuLjGJx805ayDka495KbNlPTLcb6GTw==
X-Received: by 2002:a05:6512:298c:b0:4b5:b22e:9653 with SMTP id du12-20020a056512298c00b004b5b22e9653mr9677620lfb.18.1671289752231;
        Sat, 17 Dec 2022 07:09:12 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id o27-20020ac25e3b000000b004a27d2ea029sm531821lfg.172.2022.12.17.07.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:09:11 -0800 (PST)
Message-ID: <45ccb4a9-138e-7d58-71b5-24af28675994@linaro.org>
Date:   Sat, 17 Dec 2022 16:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 07/15] clk: qcom: gcc-qcs404: fix the name of the HDMI PLL
 clock
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
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> The QCS404 uses 28nm HDMI PHY. The in-kernel driver doesn't provide the
> PLL (yet), but the out of tree patches used the name "hdmi_pll" for it.
> Other Qualcomm HDMI PHYs use either the name "hdmi_pll" (8960) or
> "hdmipll" (8996). Thus change the expected HDMI PLL clock name to
> "hdmi_pll".
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 23562096298d..5636c6524d0f 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -160,7 +160,7 @@ static const struct parent_map gcc_parent_map_8[] = {
>  
>  static const char * const gcc_parent_names_8[] = {
>  	"cxo",
> -	"hdmi_phy_pll_clk",
> +	"hdmi_pll",
>  	"core_bi_pll_test_se",
>  };
>  
