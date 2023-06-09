Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CEAC7EE2E
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 12:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239298AbjFIMpt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 08:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239282AbjFIMps (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 08:45:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C57270F
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 05:45:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so2105312e87.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jun 2023 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686314745; x=1688906745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqzhrN9pZnLZEEaMP6DZ4D7gUVGJg2soYgokq2ZQmXY=;
        b=U2hoJl7bvWeuQNlcYG60WzzxhzukFA4kk8DzerHk+MH/nRm+n0jEtgdGlGBpOdpUrI
         lIHB8vnpMpRA0d0ysNQnmeAbbniSe3iRIifZ3hfJ+67ouEdq/JWiE6L11EIbrzIM6YMB
         rzVJH4vGT5UH5eAa8usCcXLTpTNnM5cH3gVYXOgaYERCpWCMlf8hc8B/FCrlTYM2MJgR
         V13S5gevk4cukMKAMX+SSd0ado0nfDoL4cu0sjE8RbzkkqaNgiekfpnsn0mG1beghC5k
         vfpO5tF75UyMl/7yOAKc+XVx/KVOvpilygpWHiG4pCJAMdBuOAV8EPikWMNeXKfFNucv
         5/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686314745; x=1688906745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqzhrN9pZnLZEEaMP6DZ4D7gUVGJg2soYgokq2ZQmXY=;
        b=dUTXkPP0DpBuE8jOtsApd/qsJ68cd0dQppvoQYZdAjLL18UiWPbR3Sk/RY3F1TqpnW
         SHwslYwE/QxqDJBsbf47Mz5hdYe+iyMw/wG4+OTdxpqPipfKChS6sMjMJ6E9rg2ghqkP
         9cwUvzT2ERwR41CRkNc546Gn/yWzGF6DxYRjaoq+2hCCc/cdJI+nbpDSzH2WApdecRgZ
         xXNJPc3KDJ0VMelOb26IHeJdInpy+pJtCHAqH+K3r6Q3SeL/JR+Dgp/gaXLjEcZwObxA
         oq/SfRSq+8hBGuaLLp8luntDyYZ+F7WGo4XQjYfQ7cN4E8ZJr8oCIuPBkyMeHybaXNBr
         59JQ==
X-Gm-Message-State: AC+VfDzgz+Ctgi4lAaaet1UmpS9uTp4G1RmVg2TggeqP9Lk0nBuPCAy5
        uZ9+9M7ZSoLTP/s40OWaXlJC1Q==
X-Google-Smtp-Source: ACHHUZ73qhFRlQjkdfcodVR00YCWIcOSrAUusZhwn92tcL5LUIQPLXadeg94Aa1h5SWcz2YTOaoXIg==
X-Received: by 2002:a19:4312:0:b0:4f4:b28f:6b9c with SMTP id q18-20020a194312000000b004f4b28f6b9cmr779377lfa.29.1686314744958;
        Fri, 09 Jun 2023 05:45:44 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 7-20020ac24847000000b004f4cabba7desm528961lfy.74.2023.06.09.05.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:45:44 -0700 (PDT)
Message-ID: <e075f78a-5eac-8200-853b-db73c3d5025c@linaro.org>
Date:   Fri, 9 Jun 2023 14:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V3 4/5] clk: qcom: camcc-sm8550: Add support for qdss,
 sleep and xo clocks
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230601143430.5595-1-quic_jkona@quicinc.com>
 <20230601143430.5595-5-quic_jkona@quicinc.com>
 <ee48f7fd-35f1-288f-2133-1c473e8804ab@linaro.org>
 <a818de04-ca30-f4fb-4c69-fd172b96f816@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a818de04-ca30-f4fb-4c69-fd172b96f816@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 9.06.2023 13:50, Jagadeesh Kona wrote:
> Hi Dmitry,
> 
> Thanks for your review!
I've noticed that many QUIC contributors seem to add this to the beginning
of their emails.. Top-posting is generally discouraged on LKML

You can find gregkh's reasoning for this e.g. here:

https://lkml.org/lkml/2021/4/21/143

Konrad
> 
> On 6/1/2023 8:23 PM, Dmitry Baryshkov wrote:
>> On 01/06/2023 17:34, Jagadeesh Kona wrote:
>>> Add support for camera qdss, sleep and xo clocks.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>
>> You probably missed the Co-developed-by tag.
>>
> 
> Yes, will add in the next series.
> 
>>> ---
>>> Changes since V2:
>>>   - No changes.
>>> Changes since V1:
>>>   - Newly added.
>>>
>>>   drivers/clk/qcom/camcc-sm8550.c | 180 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 180 insertions(+)
>>
>>
> 
> Thanks & Regards,
> Jagadeesh
