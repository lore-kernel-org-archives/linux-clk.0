Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDAFC05027
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 08:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbjAZIZZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 03:25:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjAZIZY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 03:25:24 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1639346162
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 00:25:22 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ss4so3014393ejb.11
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 00:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tM3VxaZl5zM/CvacUjymAdWLAMbgccvEVqlU6otBNnQ=;
        b=YvL/1hGK6z7nzWuKnEak5LIgPXd1aXGdeRqiuswEK1ACNaSY43vN8ALvam89282NBv
         rMoo598yoratWLEaja+0iQh3K2Lry7x9MX9C7zq/dsLEUSmPjzsgDbrW0y2NoVnZYNsI
         O6Hm89f60CkhdNRKyBTkXDtpjdyQvXADFb0X9AnvwcrpzBDE/zDzER1afaf/jiKKetsH
         3zXkwoqZfYWbj3UEpu1G6xDFIh50Shl+Yd4aPFAkeC2JbCV/pcMinnFEiLUnY+jdI89W
         vN57vEfeHywtjqg3MfFcFSHJ1mx6krSO6OPZqEpDd58FH5SV8ijNDhpRFOOsCNI2njJO
         3YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tM3VxaZl5zM/CvacUjymAdWLAMbgccvEVqlU6otBNnQ=;
        b=rvazhLsvT9JHbKFgymzN1YYLWnDzNGJH9IGh3kUOFvo3JHlryY8LUjAGLwdt+XbDd7
         aW9sqmBE9ldA250nOa7FpBWu+G8IDMWKbCNPfUoNy9SG6UqCsaHEWb7ajxV0haRKl2ID
         Q8m3iBcE3rgTuRDd9hUHzh/mXG9oUwyzC/Y35TCr0jjkupLtiQfTEl6CtfDZ8HDXvxgU
         bvCUTaL9qEvlkUV+Dw+0ql9frdjisJ/azz7t5Y2wnVZVIQk6BMZvjfGp3h1xdREdhrQR
         uS+ayWr4NKnkaO4a6SiM8oCkCi63/DLKrinQJl8rC+ZSymnC/lcu0PQgAbWvdtBd+a+D
         OINw==
X-Gm-Message-State: AO0yUKWZgPcroaN4B1x5cE28959UxtTkIX5fvs4BP29kg1HRns9hdcCQ
        PBLe3cxD55US2kmzNqgAoYBhnw==
X-Google-Smtp-Source: AK7set8tJvn/zurhAyQETXWD3WcA97e9Cz1fjhRmWhiU40b/Voppwz01Doj+a5ajyLdaKaXJ4MFw9A==
X-Received: by 2002:a17:907:94cf:b0:878:5d33:c0ec with SMTP id dn15-20020a17090794cf00b008785d33c0ecmr2147178ejc.40.1674721520641;
        Thu, 26 Jan 2023 00:25:20 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hw19-20020a170907a0d300b0086eb30fb618sm222763ejc.183.2023.01.26.00.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:25:20 -0800 (PST)
Message-ID: <91e64f7f-fafe-e717-0caa-94c077cff501@linaro.org>
Date:   Thu, 26 Jan 2023 10:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 07/12] clk: qcom: gcc-apq8084: add
 GCC_MMSS_GPLL0_CLK_SRC
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
 <20230111060402.1168726-8-dmitry.baryshkov@linaro.org>
 <253adc1f1cd97fb13b9aa2b3b8e0ed1a.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <253adc1f1cd97fb13b9aa2b3b8e0ed1a.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/01/2023 23:50, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-10 22:03:57)
>> Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
>> the multimedia subsystem.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Does all hell break loose if this is ever turned off?

Good question. This is just a c&p from msm8974, which employs the 
similar combo of gcc and mmcc. I suspect that the answer is no, as we 
are still in world of alive people :D

-- 
With best wishes
Dmitry

