Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFF0C678D5
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 01:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjCIBZH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 20:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjCIBZG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 20:25:06 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534208481B
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 17:25:04 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i28so407112lfv.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 17:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678325102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjICGJVzL9nMVxJMs+OboL/eAW90Z3QAFSkvi53FGao=;
        b=Ed2bTBKtTClst/w1EjQHKPeNePjpsA4GxBQXAQVLyjRnNjBSeHkE2MJTANaj75p+uC
         x3Qq6NyxAdPohkUHX0jSikkKtPxV0q2U3ENDT4IPAUdrkY0/EFPDHkBgIjA4vOukKj6k
         6m0866x1+byXXQ3fOyGGJYYfq2wEJQYGEr3aoi87B0b/xSK4ssf97JTjxV3NziZdRseU
         OphBB3R3oxXriX7Qr+cSMOD6eIO4aJLXatsBwXQYXDAu6XxtPS4wHmRGutdAYZLY08F6
         VxBrPi6XFnDWejIx6DW4UnqwOI9ZiHDh5/xBVv7pr2HPf+RXS9q1QuSINg9RUqkPOfcm
         rNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678325102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjICGJVzL9nMVxJMs+OboL/eAW90Z3QAFSkvi53FGao=;
        b=uu0UtnHXeFa7C4vclCXTeWjnGI+9zx8Zwf97X2BgoP4804C7olhM/+E/JNIPo+GU0n
         /Llct1l9/uTO0AqJ+lDKYgw7s2Ir8VIrXpqaQpfcWH2cuaPBtM6jUsrUUZKTGdNig09U
         oLgz7C0q193KWyio+saUnpjQVA4sVb7tVQH4lO6EkFE8Wu+gLMxRBo0YD/WVYllZ+pYw
         FHJkGT2FjDD1QIKzSrckX5amlk0xulHe6omBN5EIojv0KgCTS5zhFqVOhnfu/gvx6DgC
         vHI8IfUwUDpN668wbfYRHU1sBFZVL131CAOgl/2QF9dBiiamXQ6cvxAruzEC5iQ700D4
         UWbA==
X-Gm-Message-State: AO0yUKWoZL0JXsGj1biYQC6ybyMpbtgNLyICzabGFiZfGw/as6qCvbfR
        wqTBumhGwoiS9v15XQyhwi4e0A==
X-Google-Smtp-Source: AK7set9qk0csjoBrJFjF/OrPqZdoEG2HNHzXi12l5w++8Y06QxOXIYVILjTkqTxsLExiWuFkVnMV/A==
X-Received: by 2002:ac2:4a9c:0:b0:4d7:bda4:e6aa with SMTP id l28-20020ac24a9c000000b004d7bda4e6aamr5386780lfp.24.1678325102558;
        Wed, 08 Mar 2023 17:25:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k6-20020a2e2406000000b002958bf18efcsm2679398ljk.104.2023.03.08.17.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 17:25:02 -0800 (PST)
Message-ID: <2ded450f-7d94-909d-41fc-e0fc612ae6f2@linaro.org>
Date:   Thu, 9 Mar 2023 03:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 10/14] clk: qcom: smd-rpm: Introduce
 DEFINE_CLK_SMD_RPM_BUS_KEEPALIVE
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
 <20230303-topic-rpmcc_sleep-v2-10-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-10-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> In preparation for supporting keepalive clocks which can never be shut off
> (as the platform would fall apart otherwise), add a macro for defining
> such clocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

