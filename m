Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A48EE49A0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Aug 2023 10:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbjHWK2H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Aug 2023 06:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbjHWK2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Aug 2023 06:28:06 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4680CD9
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 03:28:03 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52a0856b4fdso4166171a12.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692786482; x=1693391282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvuM6nH/6YTcW3ITFvO/Bk7VYEFeQzFDDqKyQWsxLTw=;
        b=s4yv90Ye5ZCzokXtN4s7jyCBjT1XtE9sLqRTtM+TGaVXzEdNBeg/shxGyys5+CXV1S
         uLea2QbwxHyo6pLCo/DQ/AWDXA0GDrCSnZEj5EKfGITZy4wzMKFgsmNqbqofjsgmYJaF
         j8eFzMsvuvTOERw/E0w17i5/Gd+HT/wkyLpN+/f9t/f/uAryMeVASqzvrAJoPbvySNwO
         Pbmf8Fguwn8nV7kLQjr+Vsm01aNH9zf/VtrB0BCEXiNtIE8x8kURkKiOQyAnKhwwsb5l
         OmLxSnSeJCHixQ4UjvIeeMPC5wj/no2RDheX/hJ7m6ReuugThDYUgnfpqvYQ76hNAlk9
         hRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692786482; x=1693391282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvuM6nH/6YTcW3ITFvO/Bk7VYEFeQzFDDqKyQWsxLTw=;
        b=bllmJz25oyqrNY3lJwBIK6zMaYhrwxhG7HHW1pZPQ+gWG8iRKl5FjnwznZiUYH49gq
         IbDp/qIowJuEHPflKvOGSCeV+AQ8HWYPRSKIIpGdymgUuDBRt6YNCGjz+jIFGFx860Se
         C2t1wR2zZsPqxKAzAMYZ6/ELuT0/Th4DY+zvhsYeVj1Brr8Oa+IP/YZ/TnJvLAO3C5RT
         I5YwJzOyHORM7nAvbA8Zl7L1FInRwxl6ffIuRkrtPE2s6o0mk0I1bwFLHfNZcsb093AF
         4LFRQMnWFpO7vbTwZ4x1fzTnlXZH8hQIPvQV/tbAOznwPE5iY2PTr3z2jo1sEmDCodY8
         3A/A==
X-Gm-Message-State: AOJu0Yz3omv2SCQfejisFjKhXdN/sNWbYv0/7wk7epCeo+qKAusDD7i5
        312+8yLAkQHxGO9zoRLJuN5l6Q==
X-Google-Smtp-Source: AGHT+IE//Pwjfo6u+MtWZyKJA0HohzqHgPMid1AFmo38HTxFEDwtEQR4MyJvQlnomEzgKPp6yv1HGA==
X-Received: by 2002:a05:6402:124f:b0:522:bae5:282a with SMTP id l15-20020a056402124f00b00522bae5282amr10061971edw.1.1692786482420;
        Wed, 23 Aug 2023 03:28:02 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id b1-20020aa7df81000000b00528dc95ad4bsm8497247edy.95.2023.08.23.03.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 03:28:01 -0700 (PDT)
Message-ID: <715b3a1e-a7bb-6ca7-e402-05b0e09dbe42@linaro.org>
Date:   Wed, 23 Aug 2023 12:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: add qca8386/qca8084 clock and
 reset definitions
To:     Jie Luo <quic_luoj@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230823085031.27252-1-quic_luoj@quicinc.com>
 <20230823085031.27252-3-quic_luoj@quicinc.com>
 <692b7775-eeda-3c5b-cc24-c5dbdbb38c71@linaro.org>
 <7eaca76f-e7ad-cb1c-5a1d-5a2b68357e9c@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7eaca76f-e7ad-cb1c-5a1d-5a2b68357e9c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/08/2023 12:24, Jie Luo wrote:
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>
>> You ignored tag, so I wrote you friendly reminder. You responded:
>>
>> "Okay, got it, thanks Krzysztof for the reminder."
>>
>> so again you ignored the tag?
>>
>> No, come on. Doing mistakes is fine. Doing the same mistakes over and
>> over is not fine.
>>
>> Best regards,
>> Krzysztof
>>
> oh, sorry for missed stating the reason for the tag removed, this patch 
> is updated, i forget to state the reason that the register address is 
> changed from 24 to 0x10, i will keep this in mind and add this info in 
> the next patch set.

That's not really a reason for dropping the tag.

Best regards,
Krzysztof

