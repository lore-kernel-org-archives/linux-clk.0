Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C3AC3F6B0
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 17:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236538AbiHVROH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 13:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236398AbiHVROF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 13:14:05 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE5311A18
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:14:03 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l23so199022lji.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tz0j2pf87w5WDgyn6bI1nYe8CCFyc7tqWxzOVvSy5yA=;
        b=bMCoqFUFRDRcnLvuZWIWvV56U00hHyXhKR/B1t7o6r54jBUgfV7m42RYzXiuemjAgy
         8VrqRmwCp3zjEG00QJMPTUrDyO3yCtW/B8c+EXJ8MPRfFp2AUVDysnNw+lcDBQW3Gf6Z
         NwqzL0Ig4cGzYOkOTJ9/iamTuRPReDlpCyJgHAlYk2aZAsXdmAqoYLF1IRdbtK8on/kP
         eQtDJrO1uGBhOA6/yY5XpTh/nVGT67zLtP5ANGUf2R1eUprI1CBhRBchBBq/+vXXV9X5
         iL1hpo96/UVpmDpEHdR3oNMpb7LvnMYhzjaX89pl1NDGKJS7tESYSJaxaJ9EM1aeTAtO
         iqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tz0j2pf87w5WDgyn6bI1nYe8CCFyc7tqWxzOVvSy5yA=;
        b=6jIMiXXqNbDqUc+g8l0xtwykKE4eHlfxjLQJ+qSqlPN41lVPQOWNxf5k8YBdN3p7j0
         HQMuI2rvNSpj5EJ5EOeZTSbjKpawMJJ2cRNOCiHPYFOiJ3Kjix+3/WN3/2z7AEcocnat
         4dLsabauff+MacVQ2hPTxcB0mu+/cXjyUS7rToyO2H8Imtds6OVYnyb9NwxLHbyfnRVl
         ASDJ/RxSlQJQ1Ep55wUKhJ5VrNTG9fksdgqHGDoINfXaLU2Cb4Bh0ffIKiXFKMz5ZzOm
         cm7/EGl8hKQ96b7hHKeF1qfYate6H+9pkMMeA8riLi9pO5134iMCc9rBa8FoN19Bmi2b
         m+zg==
X-Gm-Message-State: ACgBeo3UF0yY2cBmNpNUmwx+uP5XjoV2Bz3tBg409x3BkpRAQaqz0TVK
        6+qoLFOwO8v2tInOdfU4WZUpYg==
X-Google-Smtp-Source: AA6agR4U2zYSyYPBPPu79ExcvuOqTDFUMXw12tok1EyJWkv5IwwycdoPuWKbIRu+wwZLauHCRuEaTg==
X-Received: by 2002:a05:651c:1503:b0:24c:81df:e1f2 with SMTP id e3-20020a05651c150300b0024c81dfe1f2mr5730733ljf.182.1661188442236;
        Mon, 22 Aug 2022 10:14:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p4-20020a2e93c4000000b0025fe7f33bc4sm1911981ljh.49.2022.08.22.10.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:14:01 -0700 (PDT)
Message-ID: <4a5a664a-2ada-5657-9dc1-a999230d798d@linaro.org>
Date:   Mon, 22 Aug 2022 20:14:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 2/6] clk: qcom: Allow custom reset ops
Content-Language: en-GB
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220819221017.v4.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 19:40, Akhil P Oommen wrote:
> Allow soc specific clk drivers to specify a custom reset operation. We
> will use this in an upcoming patch to allow gpucc driver to specify a
> differet reset operation for cx_gdsc.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

