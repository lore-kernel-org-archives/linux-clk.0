Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2375BC43334
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 17:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbiFURgK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 13:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbiFURgJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 13:36:09 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D762C673
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:36:07 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f39so7939354lfv.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=XImEucYj10R9wQ/Mb+msU8blmp9NRnZvfxsAmALiQH4=;
        b=b0EFmQgxhuwRO5Nndx5jOs0jCxhnv7UTdhlhE9OvIb+Z1pT53u4gbXk+AZfkGRGffI
         SS/nbwK53sD+jmJAhz/uVEfgt1nvJnhjLlvGZ2UYyhzrYHQBBsjptcvc1Wi78g6a/y+F
         s1PMf8oE5y7h2Xb2CZLNuggv+5UODxVg4dGx0Iegc1O8Vw6vTwPfi8xzhM9SxG05BjS/
         lnIllNKsrELmMqBb3B6CaWIDT0h4xlgbSZliIyPP84+Z7++ePTf7XwYzIXhqfI5G+ghU
         aEnezvTBLb8HOldUg7GPEajSabe7aZsaZWEkzYhbBx8mBYrmNlPf9mT7oKKvYuAd+vsa
         TV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XImEucYj10R9wQ/Mb+msU8blmp9NRnZvfxsAmALiQH4=;
        b=vLPWnbYOe+TNJYV4M3/HU0cZWN33twmWmsczAfRa/JwCyxOjOPIoZFdv81687iNGi0
         RSKFCfpCotzp8SUhtY7ThI8GqQoOpbl0Rp/0Vi5XUIl2scwPtxMIhY/2WHGFAidWurim
         kHN5+8tW44wG5OlJ0o4DgFlBhwOu7j6pRG71+xHAUq+fFmfeslxHvE35ErL25iBUHMN9
         EfhdleXYPWx7/oKlLkwVF3uTwPlJvvClsjMJ73VAKDA1nYGgEgr0dAil5pwf9YdFPquS
         HJGgsoP5ojPyTptA1ya9dsF+1FJ3l1A904uwHLAoCUNdkB4F6+INLsZ2luESkPfuArJ2
         MWpA==
X-Gm-Message-State: AJIora9olF2pM+fD5cb81WilBnoEuJLKZ5YtGu+AqnF6Rcgny3e2C3dd
        FdyWgswJoLswKgCN+w4l9hwO1g==
X-Google-Smtp-Source: AGRyM1vVQNCn0lDIOXlmiuWH9hu97LddP6ByBprzSdnG895Ipzds+fvr8/ckrZFNKS2G4mOxnOvVLg==
X-Received: by 2002:a05:6512:3194:b0:479:68fa:8b7 with SMTP id i20-20020a056512319400b0047968fa08b7mr17625950lfe.129.1655832966284;
        Tue, 21 Jun 2022 10:36:06 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
        by smtp.gmail.com with ESMTPSA id z10-20020a19650a000000b0047255d211b2sm2230914lfb.225.2022.06.21.10.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 10:36:05 -0700 (PDT)
Message-ID: <e90110b4-d3da-6fd9-9e3c-cda4666f00f5@linaro.org>
Date:   Tue, 21 Jun 2022 20:36:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] clk: qcom: clk-cpu-8996: use parent_hws/_data instead of
 parent_names
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220617122241.768736-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220617122241.768736-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/06/2022 15:22, Dmitry Baryshkov wrote:
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
> 
> The ACD clocks (which were not defined before) are modelled using 1:1
> fixed factor clocks to fill the gap in CPU clocks definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

A note to Bjorn (and reviewers). Yassine's patchset is superior to this 
patch, so I'd ask to use it instead.

> ---
>   drivers/clk/qcom/clk-cpu-8996.c | 139 ++++++++++++++++++++++----------
>   1 file changed, 98 insertions(+), 41 deletions(-)

-- 
With best wishes
Dmitry
