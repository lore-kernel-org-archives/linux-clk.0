Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964D3C001DE
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jul 2023 20:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjGXUjD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 16:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjGXUjD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 16:39:03 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDA7198
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 13:39:01 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9338e4695so69947291fa.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 13:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690231140; x=1690835940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZE4lUSdFm6QKnndi6dJO980TAcjqHjMQk5oPhkhqQE=;
        b=n9Jzo1TuMwqZ11K1RzMnsYvMMXsfhNlTxP/6vxW97me1HTpUOBy8GGXMABGtemr2o6
         YFyBQPo6h9Jg8nvspcJbSTA9lxG42EVfuFgz5qXqHwiLDiXDKyz6BXlDS1bMoX4V81/2
         yJk5FDSGRzqk8V34FLCWKypmvznIsFz4auRby56t9kGBh6eJlJqpKiKWwhgnjBcaBhKQ
         jFuEEXeYg9bgsWwNaUximm+oUfnrjqc2AOpuY9OWpF662BTmf6N5HHgel0PCMUm7wbOI
         XXNrFVDuZxi+KbVRHVvTx5frEoyLMJgtg950ArVy6UWsqfJLTXZKcDmNw6DeasGMENuf
         OuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690231140; x=1690835940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZE4lUSdFm6QKnndi6dJO980TAcjqHjMQk5oPhkhqQE=;
        b=FG5qz5lBu690xvmqVRvylHixJrXHqEr/ZAwfBl+IjI0+HFg/YkGAl0bXx5AIWndfTq
         hoUKhsw2toWAlfCDkZ1inrJd3Y3wP3OSyiH5OL95XTXFmq1Ce4i+dlUNj0gP3fdsU/9F
         Go5G4lXhloMBmk5fD49duikdu19D/ucNwdWGNHUruKPyF+0wGd+cV7MfNPZHaZoz9XcF
         DNzSOKvNW8BeeD2AXzm+iY4WBkKQSrev675/wSUWcUY2gXX7PMU2AwCKXhJobjEZM67G
         ViZFh/sEHIYCWj4LrnzH1SRUuSImo1x3yGIff+ZjOJOtaEnR/shzetX7jKCfop8lWmnO
         nkpg==
X-Gm-Message-State: ABy/qLZx2D+OiRy0zZSgJpNpZT3UXS6n2wKgFGdZXH5PMkNH+DrrSF/w
        Cx0MFDqfSskJ4lRTHG5DnaoEnQ==
X-Google-Smtp-Source: APBJJlH5bYAVAZYHVRzn7JqMvL4ecNqOkr2hyh8Yv5Ys/QmSHycHw54Pvto8uIgFDvdP7NtaJLe84w==
X-Received: by 2002:a2e:9c10:0:b0:2b6:eceb:9bb with SMTP id s16-20020a2e9c10000000b002b6eceb09bbmr5954843lji.45.1690231139774;
        Mon, 24 Jul 2023 13:38:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s20-20020a2e9c14000000b002b94aed74d5sm3027793lji.72.2023.07.24.13.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 13:38:59 -0700 (PDT)
Message-ID: <3a58f297-5586-433c-8c33-96543bb3906d@linaro.org>
Date:   Mon, 24 Jul 2023 23:38:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/7] MSM8976 PLL,RPMPD and DTS changes
Content-Language: en-GB
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230723160827.22660-1-a39.skl@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230723160827.22660-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/07/2023 19:08, Adam Skladowski wrote:
> This patch series fixes introduce support for msm8976 pll,
> also brings some adjustments and fixes domains setup and few dts nitpicks.

Could you please extend the series with the DT patches utilizing the 
HFPLL? You can keep them disabled via the status property if they are 
not expected to be used yet.

> 
> Changes since v1
> ================
> 1. Fixed few styling issues
> 2. Changed compatibles for plls
> 3. Added fixes: tag to first patch
> 
> Adam Skladowski (7):
>    drivers: soc: qcom: rpmpd: Fix MSM8976 power domains setup
>    clk: qcom: clk-hfpll: Configure l_val in init when required
>    clk: qcom: hfpll: Allow matching pdata
>    dt-bindings: clock: qcom,hfpll: Document MSM8976 compatibles
>    clk: qcom: hfpll: Add MSM8976 PLL data
>    arm64: dts: qcom: msm8976: Split lpass region
>    arm64: dts: qcom: msm8976: Fix smsm ipc bit shifts
> 
>   .../devicetree/bindings/clock/qcom,hfpll.txt  |  3 +
>   arch/arm64/boot/dts/qcom/msm8976.dtsi         | 11 +++-
>   drivers/clk/qcom/clk-hfpll.c                  |  4 ++
>   drivers/clk/qcom/clk-hfpll.h                  |  1 +
>   drivers/clk/qcom/hfpll.c                      | 59 ++++++++++++++++++-
>   drivers/soc/qcom/rpmpd.c                      | 27 ++++-----
>   6 files changed, 83 insertions(+), 22 deletions(-)
> 

-- 
With best wishes
Dmitry

