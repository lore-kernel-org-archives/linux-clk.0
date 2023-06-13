Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCC6C88CBB
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 11:21:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240180AbjFMLVZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 07:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241580AbjFMLVD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 07:21:03 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2177B3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 04:21:01 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso6598766e87.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686655260; x=1689247260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJexvCUYaVmjQj1NIVnYpyS9P6fcRoHfQo7408YP75I=;
        b=cpBLc9LMzv8sqmwV7f8UA+wHe9C/gVsv+v5KCfGXCI2E9sbv+7QuBgOeYHzCEnXiVp
         AMTcfBvxnUfnaGbVd+Ne8HppMXbmNl0vKQQtuZdw0E0Mm9SsgrAdix39usLPr2nW5mV4
         WjwNvAPxCK68KQijNbR7uiMoFk5WEl5ZB+zdpxPrHCuRVfyApDz6XTpiYrZ32ZkJCY5d
         fQI3NU6SGFQtZB5geNFrYmIVBc8g2joCOecrIpCULUSIblTacgeauiLjHctupdq7qSTP
         mZJJqCDxJwjOvf9YCOIpdCvcRZe75NfqoA1wXVwoYQcP0utcmLIUuBWrp98krWbrN/jx
         P2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686655260; x=1689247260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJexvCUYaVmjQj1NIVnYpyS9P6fcRoHfQo7408YP75I=;
        b=iSF5UDI+61GD/JhDkSrA89SeIw3c4BaE4/eKfx+DCh234mpn/jPCqQqMD2qT8QeSL8
         c/dxoQYg/SEsqGpKbkFBgZnYgN0fonBKnzA6PxKSX/mIw6eFjc7IwQI7hV+mGazac1tF
         +Bg9Bx83n+xiz0fpUZ2WZcOPP5z573WAZKPU5dkEN9B9lvSLNqv10xNvKsrq6Lv12IZN
         b0uHExizmM720F/RBDlT6JttlY0uKLRHIjO69KQ+cZckP9DIBDfjnrVCYjvMygTw5viQ
         yfI4kCF1JYWdWHvWenvRuOiBmWCzAvBkQum/UkErdcSsY3jeMZOyQJUo47eT3DQhz6HI
         hgkQ==
X-Gm-Message-State: AC+VfDz5sl5JqVGpuUbcjRuFn634Zlso2+0SQmpXKfXgKiAwoPqh+q1A
        imF9EN/h8Q4jcdxSViL2dq7MSg==
X-Google-Smtp-Source: ACHHUZ4Un3Kd8jYCXhk2BJfqRhFBDEwVeoA47+e7X2GVgEKjVn+3QHyO17A5QxxVIZ/nmWXXwWk6zw==
X-Received: by 2002:a2e:890d:0:b0:2a8:b579:225b with SMTP id d13-20020a2e890d000000b002a8b579225bmr4029208lji.40.1686655259830;
        Tue, 13 Jun 2023 04:20:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id y22-20020a2e3216000000b002a8e8c776e9sm2121628ljy.56.2023.06.13.04.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:20:59 -0700 (PDT)
Message-ID: <35c3fe5b-0c8f-4a2e-e3b3-f181edbdc956@linaro.org>
Date:   Tue, 13 Jun 2023 13:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 01/23] dt-bindings: interconnect: Add Qcom RPM ICC
 bindings
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
 <20230526-topic-smd_icc-v3-1-5fb7d39b874f@linaro.org>
 <ZIhO2Tgh5q4heBi6@kernkonzept.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZIhO2Tgh5q4heBi6@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.06.2023 13:11, Stephan Gerhold wrote:
> On Mon, Jun 12, 2023 at 08:24:18PM +0200, Konrad Dybcio wrote:
>> The SMD RPM interconnect driver requires different icc tags to the
>> RPMh driver. Add bindings to reflect that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  include/dt-bindings/interconnect/qcom,rpm-icc.h | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/include/dt-bindings/interconnect/qcom,rpm-icc.h b/include/dt-bindings/interconnect/qcom,rpm-icc.h
>> new file mode 100644
>> index 000000000000..ef61006c9c58
>> --- /dev/null
>> +++ b/include/dt-bindings/interconnect/qcom,rpm-icc.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2023, Linaro Limited
>> + */
>> +
>> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
>> +#define __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
>> +
>> +#define RPM_ACTIVE_TAG		BIT(0)
>> +#define RPM_SLEEP_TAG		BIT(1)
> 
> BIT(n) doesn't work in dt-bindings (syntax error), can you change this
> to (1 << 0) / (1 << 1)?
Just including the binding did not show it.. You're right..

Konrad
> 
> Thanks!
> 
