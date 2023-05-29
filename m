Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457D0C7EE2C
	for <linux-clk@archiver.kernel.org>; Mon, 29 May 2023 08:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjE2I4B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 May 2023 04:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjE2Iz7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 May 2023 04:55:59 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E1FB1
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2023 01:55:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4eed764a10cso3161618e87.0
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2023 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685350554; x=1687942554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9SKh0wUUFk/Pi4ssDuCveKjqnzKGPLh/iR0wcCQsTL0=;
        b=IE5mvKAoB2PSjn4wg2bkNVE/IQr/QOntgSpV9Ir1wYaPpK9YyheLFxtDX06hyRuwZR
         EjTq2W4G5bHJLqYup8ub/GZrXXRQcrr3Bcdfwb1Kxqw302RfnD3XyQ0JWCLt/KdkVBZV
         Dl218uY+N3ECWDKn8XKS+6qgzfHytkc5QeP4BysO/eMRvNJPhedWGDbHfn8vnMEdVrSP
         VDg+mmaDjhqIegwvIWuETp9dUwg6aZlPOFdp5eQMDBpBO6PgdWcNVY68G+SUF5sbDWH4
         GXeF1IV72lwJTHVpFeUF/S7pIz4n7vEjhw8T+BpnDoIHZfdSY0rIgPh0grjGTgoMKCnC
         Ip5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685350554; x=1687942554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SKh0wUUFk/Pi4ssDuCveKjqnzKGPLh/iR0wcCQsTL0=;
        b=h+uOIvgSv+qfulVj59HSWUCUWlBIyXGrb7ZlX4yd30xsG27yvH1a30D1BpGpStmJ6v
         YhLgBbVhtNsvMbp31ywNHdAD61YBr7pr3AohjOVohVYbmHVGwCM+t97i88HtfNpk2G2z
         kA97paLUPH2KTevAszaKcGNbRPrVdMRDnEDyGZvjJ4pDCQodKqZ+U83ozeJx1iZdI9ad
         GZYMMrJxrVtHfNhk4BXH3O/uIS74L1o7Bij92XC5a7q03h4i+XSD87GhF+cNk4AHIN8M
         cJzy/SXH4uayaVNhcmSCo0e5fMO9f0cbpDYFwJQlDOq1FtXwBRcjGnHVLGFYt/z4hfaI
         1kXg==
X-Gm-Message-State: AC+VfDwaRd6ym1wUsRycjo84cRzOcHjSO/BLPzuvaPwUdvOKOCDaEMXd
        KrG1JJM6irxlggRwS2c1yXt83w==
X-Google-Smtp-Source: ACHHUZ4ho2XAk9IBumdH1MxERcbIvT9QBqFH8YC8u9N3f4kiAbqAymvcGYpYFDzPnkclzAJQv1rdeQ==
X-Received: by 2002:ac2:4556:0:b0:4f3:8260:f18c with SMTP id j22-20020ac24556000000b004f38260f18cmr3290041lfm.57.1685350554264;
        Mon, 29 May 2023 01:55:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id i26-20020a056512007a00b004f4cabba7efsm1895400lfo.198.2023.05.29.01.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 01:55:53 -0700 (PDT)
Message-ID: <8420862d-c292-99aa-3d48-7734a772dab6@linaro.org>
Date:   Mon, 29 May 2023 11:55:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] clk: qcom: cbf-msm8996: Add support for MSM8996
 Pro
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230527093934.101335-1-y.oudjana@protonmail.com>
 <20230527093934.101335-4-y.oudjana@protonmail.com>
 <2d044f14-65c0-be3f-595f-4ddb46df6fef@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2d044f14-65c0-be3f-595f-4ddb46df6fef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/05/2023 11:18, Konrad Dybcio wrote:
> 
> 
> On 27.05.2023 11:39, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> The CBF PLL on MSM8996 Pro has a /4 post divisor instead of /2. Handle the
>> difference accordingly.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   drivers/clk/qcom/clk-cbf-8996.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
>> index cfd567636f4e..ab988e6f1976 100644
>> --- a/drivers/clk/qcom/clk-cbf-8996.c
>> +++ b/drivers/clk/qcom/clk-cbf-8996.c
>> @@ -48,7 +48,7 @@ static const u8 cbf_pll_regs[PLL_OFF_MAX_REGS] = {
>>   	[PLL_OFF_STATUS] = 0x28,
>>   };
>>   
>> -static const struct alpha_pll_config cbfpll_config = {
>> +static struct alpha_pll_config cbfpll_config = {
>>   	.l = 72,
>>   	.config_ctl_val = 0x200d4828,
>>   	.config_ctl_hi_val = 0x006,
>> @@ -137,7 +137,7 @@ static int clk_cbf_8996_mux_determine_rate(struct clk_hw *hw,
>>   {
>>   	struct clk_hw *parent;
>>   
>> -	if (req->rate < (DIV_THRESHOLD / 2))
>> +	if (req->rate < (DIV_THRESHOLD / cbf_pll_postdiv.div))
>>   		return -EINVAL;
>>   
>>   	if (req->rate < DIV_THRESHOLD)
>> @@ -265,6 +265,11 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>>   	/* Switch CBF to use the primary PLL */
>>   	regmap_update_bits(regmap, CBF_MUX_OFFSET, CBF_MUX_PARENT_MASK, 0x1);
>>   
>> +	if (of_device_is_compatible(dev->of_node, "qcom,msm8996pro-cbf")) {
> If this was a driver for more than 1.5 SoCs, I'd propose using a
> different mechanism here (match data flags or something), but since
> there aren't (and hopefully won't ever be) more 8996s (automotive etc.
> inherit one of these configurations so that doesn't count), I'm willing
> to say

Fingers crossed for no additional 8996 variants.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>



-- 
With best wishes
Dmitry

