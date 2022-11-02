Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F86C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 09:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbiKBJMc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 05:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbiKBJLv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 05:11:51 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5D828706
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 02:11:03 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o12so27174049lfq.9
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epokCIiVNHGQ8fB3wg3FYwtGcEW+rWSyf21faKheRAI=;
        b=juvIj5xOyOZA5nYwp/qGUTDwqBrtyAa7ARbpZcO3+I6Z9nI5LHF6TvZQvUpEkYctIb
         0UeJXHtn/+oJaoJlM60N2nS6018jVI69MTD6u8RBJOKohbIxd5YQNK4ualeZ/vQYu7kD
         C6ELe8M8+8HW9S5fuhyojh7gmMTfQcMcb1JbVdk/WFxn3c9zJM5Zu8QbOwFx6RShBpPS
         h5VbcKFvCkTPq0QKU3fyJwDYwzaz8qPQP8wKJnwpwE3u5P7W63SAP2iwO0JClJp+a0el
         BqxWIjFIl6N/Bd0+QK3eBc68x4WF3fOMANY5MbPQA1NMSnp2zsl7ZOTpyvTl7KaaiR3C
         raVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epokCIiVNHGQ8fB3wg3FYwtGcEW+rWSyf21faKheRAI=;
        b=eoCzoT2VJSD61nPYTV20YaGCRHYQ9KSUgPluFEfDS82q+JOAtB+39wGUOjivlb+Egs
         B+8S/Q5HtZQ564BRQ69zX8/jqzjVweGRSJ0fxloaLxaM6rcdbZBe5wlCrI6ycVuB/YzM
         4oe684ECB6HYAX1PXN933rpMKoLPQRIeEd3KifiOH9Oy2ZhcGtQi/SRLWdfelxvr6AoO
         RL+CSphQcNl/8AEjRhQF25BDzdlMOkcuPkvTqcwsdv8PdXMCToGJJk1D4Cpp1tfQixgH
         S6eObOx0vE3dg7XFvk95YNbqib9bW5pcGTXwUrkXIoHX+fMcX3SWGtxGFY67oHRvdbDD
         2KNg==
X-Gm-Message-State: ACrzQf3fWNnVlHZliSf/u37WtSxYIM0Sz45TPXiqkWvTho7DLcSznov+
        n4wyx9l7dcGQ7071e/2OYH0PUA==
X-Google-Smtp-Source: AMsMyM5aw5oQ++WfXSz0qCxYQjVAmVhKmoo6hFujepwRTAbqFYrX3iatCFwE+HJHm4xUQOD1wGJT6g==
X-Received: by 2002:a05:6512:3159:b0:492:d660:4dd7 with SMTP id s25-20020a056512315900b00492d6604dd7mr8157040lfi.204.1667380261947;
        Wed, 02 Nov 2022 02:11:01 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id z6-20020a2e7e06000000b0026bca725cd0sm2075632ljc.39.2022.11.02.02.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:11:01 -0700 (PDT)
Message-ID: <73a5f42a-232f-c543-1490-fcf3f4f84307@linaro.org>
Date:   Wed, 2 Nov 2022 12:11:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 5/5] clk: qcom: dispcc-sm8250: Disable link_div_clk_src
 for sm8150
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221102090140.965450-1-robert.foss@linaro.org>
 <20221102090140.965450-6-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221102090140.965450-6-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/11/2022 12:01, Robert Foss wrote:
> SM8150 does not have any of the link_div_clk_src clocks, so
> let's disable them for this SoC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

