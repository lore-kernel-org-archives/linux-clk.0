Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E97C001DC
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 07:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjGSHPk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 03:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjGSHPi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 03:15:38 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922E41FF1
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 00:15:30 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-992b27e1c55so841482266b.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689750928; x=1692342928;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gggJ+ho+4kj2kjwWGJKnU62Dt5ugjbXcyEz5Qkidj0=;
        b=YebysdanKJANlFyUHs9plVBEgFmwKf11bG4SHPl8XzI9EnEbrXcq/O+QpEcoKq9nKI
         sakHKu75o603EjesPtcgQqaAXGfIj4pQczscyFQyfKNLPrt7WgPMVo8Lw+Z/UTE9jmfR
         16qv8texVJsqyyGm6Ns5nF80FdvjgRrZr3Je69hUDuaGeyIoTL05q2Xh6NOG/SMZfkZw
         uzizrSQCyzvv6Mz44mS/69zNTeXfiMMdU42bcLSvttlOd0zoXppAOuYHeKZK7eI3OD5b
         PNbG8pS79fcWtQFzOGr7qbQ5b5r+4eAbZc/HvWoqwXDmcLNfYX5SiciCrJX4mRQdi3aS
         78SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750928; x=1692342928;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gggJ+ho+4kj2kjwWGJKnU62Dt5ugjbXcyEz5Qkidj0=;
        b=fJT9SyQ7V/PH+5m418xSjJGnHqy4kz3SplDW4RoOIjLf/OKI6VuP6ircdZ1hicFKfK
         0uddsUjLUZ2OSH9J8UKj6SCMVAXXU9p+R4pwzF0q1sTJHl1XF7jiiHkxiQZ3kKdueExz
         2rbEQJa9jvsmtjqDQWs0sS1jHBscu3Evdii+hhzWR2PNYQciXf8Z27r1DCqTremHmtMi
         FauL7JVc9+hTwbcS5uGIy4Vkpjc4FZbP9XW1+Cca72BR2ueumqhTxJ/x8Ya2ufv34ywR
         j+I5xcT9n9TczHuM9gkYN66aa7617h1xVYy3KEFAg1Q5gu0SUKKeZWNz4h7EuBydAMAP
         1obg==
X-Gm-Message-State: ABy/qLYXINABK+GJbxyRK29xrXZLdlIpgE4T5LzeBTiSqayGrCbK6bpD
        60cZ7itVW2uVzJ5pv1GrFhXfFg==
X-Google-Smtp-Source: APBJJlHLkdms+lG9OGE3bzJfekgpJex4DoVYe3quR18JfSewiMXO/5zW65XnL1HZbhgzDCFzhrfDJQ==
X-Received: by 2002:a17:906:c1cd:b0:991:cf4e:a361 with SMTP id bw13-20020a170906c1cd00b00991cf4ea361mr1521535ejb.26.1689750928736;
        Wed, 19 Jul 2023 00:15:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id m14-20020a170906580e00b009930308425csm1933490ejq.31.2023.07.19.00.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:15:28 -0700 (PDT)
Message-ID: <9c540e3b-d8d1-0807-a21e-d01a301c1972@linaro.org>
Date:   Wed, 19 Jul 2023 09:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,02/11] dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring
 up clock macros
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
 <20230718120501.3205661-3-quic_mmanikan@quicinc.com>
 <9d473f0b-bd6b-f426-3bd2-2890e8a79431@linaro.org>
In-Reply-To: <9d473f0b-bd6b-f426-3bd2-2890e8a79431@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/07/2023 09:14, Krzysztof Kozlowski wrote:
> On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
>> In multipd model Q6 firmware takes care of bringup clocks,
>> so remove them.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V3:
>> 	- Rebased on TOT
> 
> No clue what is TOT. We have TIP, but you should not use it as a base.
> Other used names are mainline and linux-next.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Un-acked. I said last time that this does not compile and I do not see
any improvements here.

Best regards,
Krzysztof

