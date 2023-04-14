Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C30C77B72
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 15:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjDNPJL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 11:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjDNPJK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 11:09:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6106810F2
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 08:09:09 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dx24so2298016ejb.11
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681484949; x=1684076949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2YIosRAqD0RcoeUtDhEKssUjybK8X1yJ4TLNycZYAk=;
        b=Gry3UmYwLHT4qA7+1z/AMddLZsQimozLMMwWB4MRD3o5ySdLjkDZHDVcxUWOR1onoT
         ZsInt2oSiRVt0OFZtWE8k4p4TGAXqfbcQVEkMB7FqvEJ7aajSOX9KWoqdlJ98dcjITpw
         5BCEXKl4GWrnRsz/U1rIau+fJR/rxo8jzBkwPu5I5OtIIx9Dtoh7kAowBiWH1f2hU+Zh
         6jLDXvqKtJjIQtO39UKdUlrB5Dn2DT8xT3Hk3iFxwxMUohnN7dvLzk6C8iWcYlzqRsJG
         fGHP7rl241RIgOPjatWTEQFVOzptNlmmK5KhGvA/m9KUUMwwquuRmJC8FQuRMZYv/j5A
         9xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681484949; x=1684076949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2YIosRAqD0RcoeUtDhEKssUjybK8X1yJ4TLNycZYAk=;
        b=c8+xeIJa5qz2AQi/TC6Hvld1nwh6rTwkbZTwUEa5UQqT9INJTmx34y7z3kp7dp4Y4c
         jx2PsQHf4gMMApmxpGBq9t22a6OmDLO03nRwEuH/98oeqgxw08695uoG10trU9jNMKEv
         8+eF2V/gl22TwkPyfd3ZuXRZc7cqknOHt2x5835bRWfaNAAWVf7bqqP/H3LPIkVTpxUZ
         eIZgqpgieCi/9RoaZnl8n5UHZFsayEI9japMgNeZa0gaJVK6xJYTLjAPNTDTAUzHpnAE
         Yxm1z1ZKUxa+SmKw4vApMNY/7QJBu1OIEmIKAFi0nWVmdDS+gwyvoAOuqhiWHmI/czag
         txKQ==
X-Gm-Message-State: AAQBX9cs+UwJ8yF/U/uwC/etEDJeH9Nr8K+vKX1G3VaNTC0U2+3ZX2BR
        9eaUWE/jyQ0LayMOcav/G1c6IQ==
X-Google-Smtp-Source: AKy350Y5vscslMdJAx35nCQvPSRnHUrNqLPW/+KyljmDqgU/KP6IWdG1spU0fR5e6iRHfMaUK4wMmA==
X-Received: by 2002:a17:906:d053:b0:930:4eba:1640 with SMTP id bo19-20020a170906d05300b009304eba1640mr5090248ejb.38.1681484948890;
        Fri, 14 Apr 2023 08:09:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:39b7:81a0:bd41:17b1? ([2a02:810d:15c0:828:39b7:81a0:bd41:17b1])
        by smtp.gmail.com with ESMTPSA id sg32-20020a170907a42000b008c16025b318sm2525558ejc.155.2023.04.14.08.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:09:08 -0700 (PDT)
Message-ID: <7b4fe58c-9cf8-57ab-8cbc-c5ccf0b2a46d@linaro.org>
Date:   Fri, 14 Apr 2023 17:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V1 1/4] dt-bindings: clock: qcom,ipq9574-gcc: Drop the
 Bias PLL ubi clock source
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
References: <20230414134812.16812-1-quic_devipriy@quicinc.com>
 <20230414134812.16812-2-quic_devipriy@quicinc.com>
 <dc48d390-9c8b-d3b7-9c5e-6cbddb0e1306@linaro.org>
 <aca7b808-51ce-1921-2ee2-0e82cf19d960@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aca7b808-51ce-1921-2ee2-0e82cf19d960@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/04/2023 16:22, Devi Priya wrote:
> 
> 
> On 4/14/2023 7:47 PM, Krzysztof Kozlowski wrote:
>> On 14/04/2023 15:48, Devi Priya wrote:
>>> Remove bias_pll_ubi_nc_clk from the binding as it has been removed from
>>> the Device Tree. Also added Bjorn Andersson to the maintainers list.
>>
>> Was it really removed? Where?
>>
> It has been removed from the Device tree and binding in V11
> https://lore.kernel.org/linux-arm-msm/20230404101622.5394-1-quic_devipriy@quicinc.com/

I still see it in current next. Are you sure you refer to something
already merged?

Best regards,
Krzysztof

