Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD11C05027
	for <linux-clk@archiver.kernel.org>; Mon, 20 Feb 2023 12:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjBTMCO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 07:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjBTMCJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 07:02:09 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A2B1B318
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 04:02:07 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id da10so4939403edb.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 04:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msVs8JA1LOOg5WAvEHyNxyn8cBfxjxzBjlkKQHc4Sz4=;
        b=FoTiEeF7ggEN47LyaT9onUDRuLpxTBP10YrE9yn/t/ykulJR+LxmEshr2Vd1vVLjel
         0hyfdorngwQ2FAOFd8nbda8T9qykuiLGek4t+Q7ZIYx5qUfOkI3dWxtrYLvL9gLUyZm8
         SnpXgDtj9lJ5iycfzuvrQFWxOdwF4wfjhh4MoBerjQPr1/zTM+8byuS1PtywlSPr6An+
         1tqwt8Nu64CT3LmQ6B5eYJ11ZXZSmmxkDPs90G/ONLOPcST4tYk5B3ICAOHJmfntr93v
         rMkwTRi0o0rH37mHu7uqC5Mi3sfq/jE/EjJhvbRfjWpRbSWT/1hNjCoWeWK11+eAP4hr
         I/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msVs8JA1LOOg5WAvEHyNxyn8cBfxjxzBjlkKQHc4Sz4=;
        b=uIXO1qV5QX8fjDaQyeOLVN2skS/m6Npp/xJNvp0vpjIHtieBPwha/7mjk0Xucf5I3z
         0Uqz7cXBQ/lvgkfkH0k17skdrEQK7bjGLzxNYjexw4SmVYgsszyWuNxNt4p6+VFRupdW
         LeaHi7SMXL6thnzRRrpz8KvxpvbeDsiRwKj63K/NqevkpaNEamJIhd06Q0DhQ58gPYzr
         64Ra6ZeteIiFj0et3fqBhp9TPHfRA+7ll0EIwaAkx3TtqHI+SIaCq/cI3ywjr5FcXI69
         INcNiiFl43n+2zInv6nb2ujVbIDljIsxWVyM7pWa6qb9urrP9YUDFjr89MAw2J0mk0NU
         jlwQ==
X-Gm-Message-State: AO0yUKUuUaI+GAqTfsHQPPPNps746DCBSFQlTlIqbfznzur8njbtIsXm
        P6lvHUOtVT7c47v6HcN1D9Uxrg==
X-Google-Smtp-Source: AK7set/n+A2MTTWxIqtXy2xIDdZLE/ajyiSDi7/oejIjQh79j2y0QBrm44kwvOHAwazvgphv06Bp7g==
X-Received: by 2002:a05:6402:2485:b0:4ab:1681:b99e with SMTP id q5-20020a056402248500b004ab1681b99emr1962657eda.4.1676894525845;
        Mon, 20 Feb 2023 04:02:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r19-20020a50c013000000b004a233e03afdsm1432463edb.46.2023.02.20.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 04:02:05 -0800 (PST)
Message-ID: <6d07e524-bec7-9aa5-d530-3fa316ba10e9@linaro.org>
Date:   Mon, 20 Feb 2023 13:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
References: <20230219045318.564342-1-andersson@kernel.org>
 <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
 <61e8eb1b-f3ff-df76-c47f-b2c27442519b@linaro.org>
 <0592adc9-14b1-6c8c-09e6-2b7786386aa0@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0592adc9-14b1-6c8c-09e6-2b7786386aa0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/02/2023 13:00, Kathiravan T wrote:
> 
> On 2/20/2023 5:20 PM, Krzysztof Kozlowski wrote:
>> On 20/02/2023 12:47, Kathiravan T wrote:
>>> <snip>
>>>
>>> Bjorn,
>>>
>>>
>>> I don't see the change got picked up v6.3
>>> https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/.
>>> Please help to understand what is missing to get it picked up?
>> Did you receive email that it was picked up? Lore does not have it.
> 
> 
> No, I thought Bjorn might pick it up before the pull request. But it's 
> not. That's why trying to understand what might be missing from my end.

Then it's not a problem of a pull request...

Best regards,
Krzysztof

