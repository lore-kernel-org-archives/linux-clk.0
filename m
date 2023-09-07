Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BCCEC874B
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 18:11:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbjIGSLp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbjIGSLo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 14:11:44 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3F51FFB
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 11:11:12 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso14051865e9.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 11:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694110270; x=1694715070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFqkMkoGfZBVsH6xnLctgCtMkLPSJTvunrJK9f+Ch00=;
        b=F8lc9+Iph43ZTwa/qzXQWSSgY2KN6bgf8WCI/Jyk9hEsf5iPymOIhOBy4DQ1knVoeE
         K1CJQHaCw+wvJm0nqNIAGxUebIKP14pLFR37gqjopQhMruG2splL2r1MAz6XocM8MAWl
         F5zk9EIXIuVfycfFvzZSppUh/Gr3wZYs+WpS56aTcrUBpeQw+98zxlkaqQn3FGOouNnc
         fOK+AyZNZG3A17WZkWPCooo66uXXr7CDK1Wy+MK5O6k6kxepwbsn8qjpE5nh9tiwKAde
         HlOzXNZCsa/1kRDOqYZ9MIXh4nlORd/MOJ4055ByAtxYgsJYAG0vPTT5sWnleN5m6Gyy
         ZvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694110270; x=1694715070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFqkMkoGfZBVsH6xnLctgCtMkLPSJTvunrJK9f+Ch00=;
        b=QHjHZRN9DpoFt6BXfWWMiyeeFzymA6Jvl02Sw/siU6Og2DOKiw1sGLEPbHiQu9vgkk
         wsFWqOkiy4tQq00ZeS26kblbugi3wH+IWZRcaHntjHTRyTXcfNp9OV+5NyQcdSljMgk7
         h/Q39SeQDSqZ1Yf5dhqOVifjvbkPTBXg+RyLBVF3pfPlcNKqy9dpwJv7OZJGMraYnq4m
         Hr4yOY+kkguJffNWRngALM+JTFVk+YH7XBrcnofsiTUfwMokp+ty4AmPrzZ6j+Kw/Oua
         M5jQoDP0JoSP32cg+Xs0iNDSKSGBlsKsC0H1o5L2t6RqEa5JvBgqt3s8cSkjpjyfmOu4
         I6hw==
X-Gm-Message-State: AOJu0YyuwzzN2/LsljLIn08a43QTxHPkD+4iNQw3yCbsTIizjq7JWGsf
        9ntVCzdEZ01RhAqdTk7vbTbtgRByXAuBB68r9pOyAg==
X-Google-Smtp-Source: AGHT+IEljEoOCYozVMq6vZdOSyMHU2bfHYQG65/qzWJsAcVKrqUEA7eR1A8YDYnULtC6HoYpPOe74Q==
X-Received: by 2002:a17:906:5a69:b0:9a1:c3ae:b014 with SMTP id my41-20020a1709065a6900b009a1c3aeb014mr4071131ejc.20.1694077667680;
        Thu, 07 Sep 2023 02:07:47 -0700 (PDT)
Received: from [192.168.37.232] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709064a8a00b0099ce188be7fsm10093114eju.3.2023.09.07.02.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 02:07:47 -0700 (PDT)
Message-ID: <6c3b1b45-4322-4582-9009-cda5749570c5@linaro.org>
Date:   Thu, 7 Sep 2023 11:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] clk: qcom: clk-alpha-pll: Use determine_rate instead
 of round_rate
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com
Cc:     quic_saahtoma@quicinc.com
References: <20230901070041.13463-1-quic_devipriy@quicinc.com>
 <3fe1655e30d62493a24e1f97ab7bf710.sboyd@kernel.org>
 <f139041f-452a-46d9-b5af-a5ddef29c705@linaro.org>
 <69e1945bebd93916e4408fd8a141fdc5.sboyd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <69e1945bebd93916e4408fd8a141fdc5.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6.09.2023 23:14, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-09-06 00:33:38)
>> On 5.09.2023 22:40, Stephen Boyd wrote:
>>> Quoting Devi Priya (2023-09-01 00:00:41)
>>>> The round_rate() API returns a long value as the errors are reported using
>>>> negative error codes. This leads to long overflow when the clock rate
>>>> exceeds 2GHz.As the clock controller treats the clock rate above signed
>>>> long max as an error, use determine_rate in place of round_rate as the
>>>> determine_rate API does not possess such limitations.
>>>
>>> Does this fix something, or is it preparing for PLLs that run faster
>>> than 2GHz?
>> I did some grepping and we already have multiple of these.
>>
>> E.g. SM8250 CAMCC PLL2 (zonda) goes (or well, should go) up to 3.6 GHz.
>>
>> Today, only stromer PLL uses determine rate, but perhaps all of them
>> should.
>>
>> I would not at all be surprised if many otherwise inexplicable bugs
>> went away with that change.
> 
> Are any of those arm32 systems? It would only matter on arm32 systems
> because sizeof(long) is limited to 32-bits and we don't have negative
> frequencies.
Looking deeper, not sure if we have any armv7 chips falling under
this category, but there are definitely arm64 SoCs that can boot
arm32 kernels (e.g. 8953).

Konrad
