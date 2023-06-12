Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370BBC88CB7
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 22:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237468AbjFLWdv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 18:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237887AbjFLWd2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 18:33:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12A4171F
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 15:33:23 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso5756890e87.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 15:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686609202; x=1689201202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2PCQlqi+TJ2WVpN7Fh1DlRfKq46s3e2YzGc0w2L6Sk=;
        b=nf1giaoWplwjY5MO/QSs/1pX0tnFfd+BoEJg/RGh5e6sX+GRenezX1jPtQG7k38XCH
         u6PdzX9Bu43OlmQHQCQmqjGAm+B2xRDRcJlu3W+QbB0N3VBNxTRJZ696sIrWRPRyFQUi
         HphMvsdOJAhWSyAXZJXIJbB2NgEDYIBG4uIuad7BCf3I9ng/KemzGx3RB7t+enHqLcm2
         6WQtrq9ap5tvsnXc24dmk2dpYnCCN5RhEeJaeCTgNpV5YV7Y7gYr+4cZdcPK7sOyVsco
         9QtbiGQ91V3cQakrpzHylx08jNygI+mVCqGtQDFgvQJOZIvnBo5lURy2ITBYxb6eX/v7
         W8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686609202; x=1689201202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2PCQlqi+TJ2WVpN7Fh1DlRfKq46s3e2YzGc0w2L6Sk=;
        b=Av7gMpwVrQdh2LFZfdCtDbeBmez+au32O97qoOwH4FvhVZJzDEA2NSwX4EZTIT+SgZ
         CZWDJPYggpdAe7YPFvNLORL40Cz5ZkMr2+5kwXRjhtGbRCpWjdm8IoC99tBA0yZDqQVj
         woWFeP8FnwFKANB18aM/CKXkY4vPBhsFDBLra76hLN6uNyUq7JL2Ab2fgfGQzpjhQQaR
         naTH+eT6IbBmw1Rn6yqHFc8QtWZqZd12tNDq5RFPjVWQzkBG48QqiLbhgjQOssDouef3
         +eYnYfL41f7Z6VDUfegwlN7x2d2bExjL6U+8xXa2WM5UjNxFPo3K53lEnCsjjo167RI5
         SV+w==
X-Gm-Message-State: AC+VfDxwxCOtU2fxElaR4KMAarlZDxn7Q8KS3b8ppmkJayOg1VX5AOU6
        X0dXKr5ESBlmHHuXD6cAjoKrEA==
X-Google-Smtp-Source: ACHHUZ7U7Hoi+1lM8Jrkn2aS7B25EYqSSYPuXx6aJFLUhRIAJjYlEQjk0xoy41+u6FLSO2lvmUGNAA==
X-Received: by 2002:a05:6512:3284:b0:4f3:b49b:e246 with SMTP id p4-20020a056512328400b004f3b49be246mr5115803lfe.5.1686609202171;
        Mon, 12 Jun 2023 15:33:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m1-20020ac24ac1000000b004f37bd02a89sm1559234lfp.287.2023.06.12.15.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 15:33:21 -0700 (PDT)
Message-ID: <7662638a-cfcc-647d-6b93-e2b2cc05d84e@linaro.org>
Date:   Tue, 13 Jun 2023 01:33:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/18] dt-bindings: clock: qcom,krait-cc: Krait core clock
 controller
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
 <20230612053922.3284394-5-dmitry.baryshkov@linaro.org>
 <3ce1bd9b0cb23e4e60b093327e705d69.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3ce1bd9b0cb23e4e60b093327e705d69.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/06/2023 00:26, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-06-11 22:39:08)
>> Define bindings for the Qualcomm Krait CPU and L2 clock controller. This
>> device is used on old Qualcomm SoCs (APQ8064, MSM8960) and supports up
>> to 4 core clocks and a separate L2 clock. Furthermore, L2 clock is
>> represented as the interconnect to facilitate L2 frequency scaling
>> together with scaling the CPU frequencies.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   include/dt-bindings/clock/qcom,krait-cc.h | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/qcom,krait-cc.h
>>
>> diff --git a/include/dt-bindings/clock/qcom,krait-cc.h b/include/dt-bindings/clock/qcom,krait-cc.h
>> new file mode 100644
>> index 000000000000..c3542b6d73e2
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,krait-cc.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (C) 2023 Linaro Ltd. All rights reserved.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_KRAIT_CC_H
> 
> Should there be INTERCONNECT here?

Of course, no. I'll fix it for v2 if this part stays intact

> 
>> +#define __DT_BINDINGS_INTERCONNECT_QCOM_KRAIT_CC_H
>> +

-- 
With best wishes
Dmitry

