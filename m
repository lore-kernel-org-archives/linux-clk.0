Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B423CC05027
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 12:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbjAWMrf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbjAWMrf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 07:47:35 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC4423D9D
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 04:47:24 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id kt14so30172126ejc.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 04:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyMrardfmGao9bmqVTbQS0TvWPDTXxdnG777PAvzCTo=;
        b=fioLPhxMLcQBTyJ6Y5lbPmWYyGhtSnKIQVkRNRogK128K17r/dJoOQO4hny3mkLHqi
         XkKlPE2/jgl7VQFT/98NUWkHFX3CcULaqLIJLCzu2+ZjcnydmPJYWt0ouRtV3xESrMfG
         tYCH8UOu9+DD77XilSqQGIhCqsiEOaTFWtDE8tJ+P8YUO1ccWcK6oqh2iF2RDqdjdBao
         tU4AdpkqXXLEWDmdsEIXE7jdX6EGk5O6YuKI2xYbgT7J72dKoeVPvJCeCoBfZyG9wzg/
         c5wKbD999qPoOzNdYhheJEkz0jZSg/sGwZ4wB/ZDKJwOtUX3mYFaJMU+9/k2+RLvDShJ
         kg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyMrardfmGao9bmqVTbQS0TvWPDTXxdnG777PAvzCTo=;
        b=RfUiHN75d6liy8psQXecw7mOxJ2otnutcJ4yhXaRhIusO7lCcB8mEmXYqYyjaBWYEI
         JHK2AoYAJuoYTCm8NZwUEb17oRyRH3xKXZy0gnz9d80DgxXebk10sSfV1IkH4PxKzNyM
         2YAiwT8DDlz1aQYrUb6+CntnVjdut3hWIev0uCe5XS5LF7Q8eORLV0gsncTTHnQ6Wcd6
         433Tz9vGKmpnfK+WcCR/sicBJPs2JipCBucaZ4bHhnEYx6iSPGgOTufccwJhjnE9qq5h
         gHreJRAqt8ovDGOkxUlDtjN5qRmJgxwgEfMeui3huq2LJ/Khi3nAymy11hL8KECgMh1M
         FfoQ==
X-Gm-Message-State: AFqh2ko3trNZWI/0pPgzMMGstBBSApfFsW+A59FHZOZuuYAdV80joGMQ
        0xJle4fCHFzPerHFTbxBkvNmOA==
X-Google-Smtp-Source: AMrXdXtqH4dbmV91o2iAN+FWl4kdOhL+VYe4xF9xHJjXoOL69zFAwe/Pltv26XLWZAaT3eUdsSnHwg==
X-Received: by 2002:a17:907:20a1:b0:870:23c5:8a81 with SMTP id pw1-20020a17090720a100b0087023c58a81mr26997951ejb.41.1674478043382;
        Mon, 23 Jan 2023 04:47:23 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id et21-20020a170907295500b00871f66bf354sm10353476ejc.204.2023.01.23.04.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:47:23 -0800 (PST)
Message-ID: <33f82972-abba-3ca7-b7d5-6aff36d48e5e@linaro.org>
Date:   Mon, 23 Jan 2023 13:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] clk: qcom: restrict drivers per ARM/ARM64
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
 <20230123094925.54824-2-krzysztof.kozlowski@linaro.org>
 <9cbbb9c3-f645-0066-a505-35cc7ae087bc@linaro.org>
 <0cee46b0-445c-6e9f-3bc3-50a107cbaf4a@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <0cee46b0-445c-6e9f-3bc3-50a107cbaf4a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 23.01.2023 13:45, Krzysztof Kozlowski wrote:
> On 23/01/2023 13:31, Konrad Dybcio wrote:
>>
>>
>> On 23.01.2023 10:49, Krzysztof Kozlowski wrote:
>>> There is no point to allow selecting pin-controller drivers for Qualcomm
>>> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
>>> kernel configuration more difficult as many do not remember the Qualcomm
>>> SoCs model names/numbers.  There won't be a single image for ARMv7 and
>>> ARMv8/9 SoCs, so no features/options are lost.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>> Not sure about the newest of the newest SoCs with Cortex-X etc,
>> but older ones, particularly including 8916 (as some vendors
>> in their infinite wisdom decided that shipping a 32 bit tz is
>> a good idea) having ARM || ARM64 would make sense.
> 
> Why? ARM || ARM64 is implied by ARCH_QCOM, so what would it give?
Err.. my mistake.. I skipped over your patch too quickly and
didn't notice you did not in fact touch 8916.. Sorry..

Konrad
> 
> Best regards,
> Krzysztof
> 
