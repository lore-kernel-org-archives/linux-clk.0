Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B5DECAAD1
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 10:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbiIAKqn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 06:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbiIAKql (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 06:46:41 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC06DF827E
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 03:46:39 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v26so13566028lfd.10
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=q7GfTDbztJBtRyiLzAqPadkhGM0mICn7vR8np4hSo2U=;
        b=ja3k4IT1AJG3cTCogL7Ah/V1RQRMAVc58+3EPHiTIgJpWylZ6l9lvyybcbBMtwi5ja
         k58U2jE80elsd8XkoJS2GhgxfxkdJUehErE0PfH+5xVMcqZYvJSiEW9Nx+BC8zSpBHRL
         VaaJE9+ODRL9JTue5gYdc2KC9nJ9q8XGBE89uyVYg+iMqRFS8UPg3Sw0Mza6SzFxt+po
         BeEUF+igPo9ys7LxA1p4qG2/DZskUpLsee36hl2L0o+33KJNDCuDNDOuWY2sviZX17gd
         FvlQqJI1fZdUyJmO6l9DS1QgBTUpB7s0Y6iYalWWhGng3v6dpvmByewFuXjrjrJRi8H9
         yCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=q7GfTDbztJBtRyiLzAqPadkhGM0mICn7vR8np4hSo2U=;
        b=bu3I3E4oLNaTlIQU8n3bpQ7qVjZ2Snwj3hu6B+TaV1U9G7rs85oyTe7PM7WtgUfBGL
         d7GiM+HbrRcFyh2TmBDnyWvJS/INABOL88QQUwu7zwsfhsshL5614vupjTBMmEMvdkhA
         JCyBVI72s+VDvDaX2gb9FOQ8EiYYRFam8WpuCMFBIyIgZigXCT0AGjnCDp4U8Iu3d6gb
         3nCON2oyj/Vjx5SDE0cWV1eZkihzpgsH4sYr1XIkold4KzkcPr3OrPd5WBSNeKy0tuF3
         KatWM7LP5A5sIH9gNoBB2ZDI9FL3HvXvq/DNRVlFCehe0P8eQHcqCgOZqv3wDsvN3xTU
         pIyA==
X-Gm-Message-State: ACgBeo1lQa9kVeGOWzuKsBt/D5gO/+p15MdOgi1WDoYARcsA/hq1K4em
        v4cXW/HiIJ/niwJtx8P3lKlgdQ==
X-Google-Smtp-Source: AA6agR42QJyzzyisVHax2ivC+hHxBqHzv3MiqXDqBhGKYSNiL2vKQOpWCYeqeHW9DRVEoPuU292NYQ==
X-Received: by 2002:a05:6512:2520:b0:494:6fbe:2269 with SMTP id be32-20020a056512252000b004946fbe2269mr4951805lfb.387.1662029198290;
        Thu, 01 Sep 2022 03:46:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3-20020a056512220300b00492f45cbbfcsm2286586lfu.302.2022.09.01.03.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 03:46:37 -0700 (PDT)
Message-ID: <ff2d8784-0cf9-fac9-4360-71cac30fbd76@linaro.org>
Date:   Thu, 1 Sep 2022 13:46:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Content-Language: en-GB
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
 <20220901103449.GC32271@pengutronix.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220901103449.GC32271@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/09/2022 13:34, Philipp Zabel wrote:
> On Wed, Aug 31, 2022 at 10:48:25AM +0530, Akhil P Oommen wrote:
>> Allow a consumer driver to poll for cx gdsc collapse through Reset
>> framework.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> (no changes since v3)
>>
>> Changes in v3:
>> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
>>
>> Changes in v2:
>> - Minor update to use the updated custom reset ops implementation
>>
>>   drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
>> index 9a832f2..fece3f4 100644
>> --- a/drivers/clk/qcom/gpucc-sc7280.c
>> +++ b/drivers/clk/qcom/gpucc-sc7280.c
>> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>>   	.fast_io = true,
>>   };
>>   
>> +static const struct qcom_reset_ops cx_gdsc_reset = {
>> +	.reset = gdsc_wait_for_collapse,
> 
> This should be accompanied by a comment explaining the not-quite-reset
> nature of this workaround, i.e. what is the prerequisite for this to
> actually work as expected?
> 
>> +};
>> +
>> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
>> +	[GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
>> +};
>> +
>>   static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>>   	.config = &gpu_cc_sc7280_regmap_config,
>>   	.clks = gpu_cc_sc7280_clocks,
>>   	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>>   	.gdscs = gpu_cc_sc7180_gdscs,
>>   	.num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
>> +	.resets = gpucc_sc7280_resets,
>> +	.num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
> 
> See my comment on patch 2. I think instead of adding a const struct
> qcom_reset_ops * to gpucc_sc7280_resets, this should just add a const
> struct reset_control * to gpu_cc_sc7280_desc.

While this will work for the sc7280, the platform that Akhil was 
developing, this will not work for other platforms (like sm8250), where 
the dispcc also provides traditional BCR resets.

-- 
With best wishes
Dmitry

