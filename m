Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B998BC64EC4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 00:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjCIAtK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 19:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjCIAtE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 19:49:04 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE55B76F4C
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 16:49:01 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id y14so222991ljq.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678322940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igEVtCv0Yun6uztxoSl+D0xNhXh8MI5zoU21SDQbQG0=;
        b=V/QU1+McEoNI0Pfi33CLU2ga7Ft38nhwIKGP0vuHVpxEXmUobSZGkp0nL7H+/bOxCL
         RsfoBTOM0PTItOhX6e3QL3EfMieWXTzEar5cFEoNG4UopGTquWZPFJq0hiQEMBlBoLQu
         xsDZucXDdxCUp7De4FNyH6MUuMO2cTu4O2VPzyY0ptxNk4HpecPlcE0Mu/QwmIra9jN1
         FpIXeo3SDZbOBSk/jw27ij28YiYw6TEyEALCpZw1azJQOuiLRE9ef1PARPaH5mqcvgr6
         MoQGOYmGKq/4Cxh+Kb7VNlgU7p/QqgKL24YlLi4tpR0Zr9kSLfYRnvZ2mnL7d+MhRQf0
         48Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678322940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igEVtCv0Yun6uztxoSl+D0xNhXh8MI5zoU21SDQbQG0=;
        b=7D9AE2VOdBaBdGhX8wO0/eovLD0o1k7/cqB4Waaqt6EKOHjSZVSKdfe9tdMSYY9K29
         YT4zoboyusLxgTPxQFnrgAdkELyY79V8MqRUdsnGEBtUfGPCO6zx4TiL7tuBqsg3ZbNm
         oee6lu1oOT+5rhGanSMSV233LDGdACm/kqXz6vAGVt0IpQs1cMokGuNto+bwEbgH9BdB
         Y5f2x9RexTKuY35WkZd1wBawYDOhP/1sAeWyh35Ph+mN0KZTXRr4dKgKUeqM2tV8WqLF
         qt6MMmOKuIf0MtEHYRpgLCUV5/3IyVj/Vq6fIS39lCLvIW8h9Lm0IQEklxO65SdjJVg0
         2FKw==
X-Gm-Message-State: AO0yUKWmrH9krRsHTmginSpaB+7X4SOyw/YGe3Z9AYckblt5TNdcAHKM
        H1qrLmqoJOpBIknG/tAghAcRag==
X-Google-Smtp-Source: AK7set+s4E9sI6MCIb1Plra3PVeHE9gylCv4Co5ejVzav4C7e1S1vavpawpRj+KHafIdqyx3ZUhqZQ==
X-Received: by 2002:a2e:9243:0:b0:295:a313:1365 with SMTP id v3-20020a2e9243000000b00295a3131365mr5810541ljg.3.1678322940206;
        Wed, 08 Mar 2023 16:49:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d16-20020a2e3310000000b00295b1afd27bsm2674916ljc.66.2023.03.08.16.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:48:59 -0800 (PST)
Message-ID: <557f5eba-8062-fba0-11c3-9abef9c7325d@linaro.org>
Date:   Thu, 9 Mar 2023 02:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 04/14] clk: qcom: smd-rpm_ Make
 __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-4-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-4-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> In preparation for supporting keepalive clocks which can never be shut off
> (as the platform would fall apart otherwise), make the
> __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX macro accept clock flags for the
> active-only clock.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

