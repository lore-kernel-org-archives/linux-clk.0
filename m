Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8022CC433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 14:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3281064F91
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 14:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbhBCO5W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 09:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhBCO5P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 09:57:15 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F40C0613D6
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 06:56:35 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id u14so2810417wri.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 06:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/khvAx8rQ8Qk52GP0rkxvX+3p71gytl4XILm6NOSqc4=;
        b=fxHOM3y6U+nbYfCeyvFmAzm91pa+sRp0VXwqggGywOy9f8Ej37Nis49Sd0M9Dha7Zs
         seI2re+vVv0HAocQpSeEF5t3O56DPj1Jab5MKnhzJ/YJaCORtqy6Vl90VXp8piPPhFxr
         QQq/BB+Q2SOU9QPcmrBWOxwaFWY0eJaoN1t4CBYxgIv5KX+c14nAUwuYYJswyI7rxit+
         tEHgIgsr8+wbd3ADZafgBZndSRuzAI1L7E2frf5rslC+c9PgF/NqQZExcRynjL5L2Uqg
         L5VZYLrOxSbghr6cpH9iIG7B6qXK3duQZ70YTmKtII8Hp3OJQ7LG/s/uGvh3OIz0tR8Y
         HG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/khvAx8rQ8Qk52GP0rkxvX+3p71gytl4XILm6NOSqc4=;
        b=EhZvMeCk2jyIpPMyYM1BiJOdkIr3Ti71v1w+aNVk71Q8HfYuu0gEvllqal2uZ5C3D6
         Pe4ZJykzLYfenB3T+vYv6t+CGm+Dm1HdKt+BtkazR1jvfWa3VFyFzXGv9xjzSkhGVdn+
         Mbfcsdau2zMb/kR/YNGUqWkFdHC8yKQEqxR1eN26d0Vj2yuhxB1iHMZHhxcIJdM+uyIk
         IKRXIM3z2k9u0ErrrYGMVPwNOSGvpMocga1zCchLy7BDCAisaZQ0QSsJVl3L2tUffCXm
         201fCgRoxXP+Cw32pDm3D8TtxM4MzOQhTzKkDKXyvc3iMX/1F3jN+FJ1dS+ajZogbJEp
         2qhw==
X-Gm-Message-State: AOAM531Rn39C/iChd7C7T0wtWuBe1Mt+AGmgmznGSVKikObArZjx7B+N
        m2g/rckChyGfwD8OrgBRdyeeTA==
X-Google-Smtp-Source: ABdhPJxlmTGKmFIfRymu6L6bKQmRbeAyXxl+996VN3I2FJ2wceggr+Cq4MlXXYpaiMsxCLOydf+2FQ==
X-Received: by 2002:a5d:4806:: with SMTP id l6mr4049170wrq.389.1612364193776;
        Wed, 03 Feb 2021 06:56:33 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g14sm4179375wru.45.2021.02.03.06.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 06:56:32 -0800 (PST)
Subject: Re: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
 <CAA8EJpquw_HBT+x=go_378_ZVqLiHmq7y9FvBEgoqESaTosy4Q@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <106dcea1-557a-a3cd-267a-43517815eaef@linaro.org>
Date:   Wed, 3 Feb 2021 14:57:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CAA8EJpquw_HBT+x=go_378_ZVqLiHmq7y9FvBEgoqESaTosy4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/02/2021 14:25, Dmitry Baryshkov wrote:
> On Wed, 3 Feb 2021 at 14:53, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> - Adds some missing indices to the videocc index
>> - Adds videocc clock tree hirearchy for msv0
>> - Adds a regulator to power the videocc consistent with downstream
>>
>> Once done we can move on to enabling these clocks in the DTS and switch on
>> the venus.
>>
>> Bryan O'Donoghue (4):
>>    dt-bindings: clock: Add missing SM8250 videoc clock indices
>>    clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
>>    clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
>>    clk: qcom: videocc: Add gdsc mmcx-reg supply hook
> 
> I remember now the old discussion about these two clocks
> (https://lore.kernel.org/linux-arm-msm/160092826778.310579.12225989905897101118@swboyd.mtv.corp.google.com/).
> 
> Is the message. reported by Jonathan, solved by the mmcx-reg supply?

The stuck problem is a bandwidth problem not a regulator problem, 
there's some internal clock dependency we don't have visibility of.

Both of these resolve,

Jonathan had a hack:
https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=tracking-qcomlt-sm8250-09-11-20%2bvenus-flto-simple-test2&id=d4bea74282d14244127a1e97766b6108ec68e22f

Dikshita proposed this instead, which, we will send out soon:
https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=tracking-qcomlt-sm8250-venus-integrated-sm8250&id=782202d611761e639af7e44d8344c0c098642b9f

> Also are these clocks necessary at all?

Eh well I'm not sure what happens if I try to dump the clocks but, this 
is an accurate representation of what is done downstream so..

---
bod
