Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578CEC3A5A7
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 23:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiLFXTE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 18:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLFXTD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 18:19:03 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3424C2A409
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 15:18:59 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id z4so18989282ljq.6
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 15:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuf0EjUhRjplBTwFsKQ3xCYaGpbzfMVTferzr5ryCGA=;
        b=VfpmrSK7ToWDW77AEhfzzLM3v97h0qH9EDcUrJ/OhMKLU7BPZHwB49NPsKcn6UzaoK
         vyMsKCAF6B2GES02GyNFeTD6gojFg2p5EQCdL9AuvwUAhpg+ed67G3FYIIOka8Ix5JG7
         5RfiGMTjQJucuqmPOCgnIJS1v1G1MboLLX3CwT2c+GVviFWdFnBwf1orGbTfZiCn8Zc/
         00RJdqXF+DBjHk5JGVyWXUESejOsJYxfiSfewvddQfxegsQmWt24p8obw/BmCbEPejj9
         2X++dCO4Rm/VeJ9JOj4n9KzsUbFwLJH583UyZmkqrLqjRSiEvdBSktELQXO3/mutQ2R+
         e7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuf0EjUhRjplBTwFsKQ3xCYaGpbzfMVTferzr5ryCGA=;
        b=y4/vpWKRRfstYl22jE9Fiebi29TlB8RTPwCibagnMQ4gU5/Zbw7ZwoOZgYupvaU+oF
         /g+BQogT77sdQZL4n71w72PqdL8VSM5pblTpLOwy9eSm3dMPYNRRveX5BNi6lr7bd/gA
         Da4Ot025D7QNhVqhkUdWBvo6kFeAuQNfh39mYm6jKkwaRBssKs315fHZ7S913k6FvS+5
         J8nnsbef7mvlURbFoj8hPaun5N/sfTDjvwQLxWdROml7HU8ljNKVToPAtUxiWhlMayXD
         k1RWL6lyvaBZiNJ6susEJURqavkcrUtAxKSANNNOBDOFL5vVN+HTMwo6W+WJJrDMrllR
         aZNQ==
X-Gm-Message-State: ANoB5plNdxj3/Smmxf0DApXCNEegHrzPWf62M/3FoK/gApn19Fy/rUrr
        9U/Z+AOnEjs/R3o14JMasV2k4bnky55E72n6o3HwGjvd
X-Google-Smtp-Source: AA0mqf4483D/L/Zi3VPi9t5YrKjikrtaD4YsFl2h57mLM2T+dYplpcxFQTni4vLiPX8dfYp2spyKSQ==
X-Received: by 2002:a05:651c:153:b0:279:bbff:a928 with SMTP id c19-20020a05651c015300b00279bbffa928mr9602929ljd.415.1670368737559;
        Tue, 06 Dec 2022 15:18:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e13-20020ac24e0d000000b004946b549a19sm2641572lfr.45.2022.12.06.15.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 15:18:57 -0800 (PST)
Message-ID: <8504aa50-9378-6a9a-9d39-71befa620f20@linaro.org>
Date:   Wed, 7 Dec 2022 01:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 03/16] clk: qcom: smd-rpm: remove duplication between
 qcs404 and qcm2290 clocks
Content-Language: en-GB
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
 <e18ef65c-c134-305f-4b47-8004bee12fb0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e18ef65c-c134-305f-4b47-8004bee12fb0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/12/2022 19:04, Alex Elder wrote:
> On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
>> Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.
>>
>> Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I'm not going to comment on the "Fixes" tag on this or any of the
> later patches in this series.
> 
> Shouldn't this line be removed too?
> 
> DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
>                     QCOM_SMD_RPM_MEM_CLK, 2);

Nice catch, I'll drop it.

> 
>                      -Alex
> 

-- 
With best wishes
Dmitry

