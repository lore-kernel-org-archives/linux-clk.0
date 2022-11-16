Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D790CC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 08:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbiKPIvV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 03:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbiKPIvP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 03:51:15 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15981A80D
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 00:51:13 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id s24so20918713ljs.11
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16W+WhRYw2qO31HAZVLt3mv3/qC3AjEWZLnL5iEaKNw=;
        b=E/eIyOzpn4tkTNxnGMFFoQYJH4B0F+2EkASmXoGGnp0TON6UlNT4E62dHdhJcPkyTl
         gTsTfb4lslvmv9HrRS46q0wDd3YlWja541Jv7XiZo2sAm7pvnPWMBFeg/QFv34JOZ0I5
         E3CGyZ4T45NkaNSS3ORtC/aHMfgf7gkreKrbYW0XWmCZxDtQ5js7ZGD3JdqzqvtPIubt
         rxk8wlN52PBtx1bf1tn99wUhlLUw/yGzm56OH3KM7uxH+mBE0caeuoik58wWkIJoq3E/
         CjSp9onVDgRefhG+vY8fgNEsfnBY2N4vYl4zljUul7jM66pHXgNhxzA/spMqzD5fzDV+
         UhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16W+WhRYw2qO31HAZVLt3mv3/qC3AjEWZLnL5iEaKNw=;
        b=TG8iMBFSTW5qnZHmwkK/UMWTSga/ypcXhH3zx1npzQE7SgEP7Bv5h3oKTwAhHIP8I4
         jZbKNclUiENKmw58nG7nzLswfPfhYDjtu4yhb8MJ1CY3SJrxI5j79yoOU176i7bSZMgD
         9oyWPsenNaTnVdTg/T9GBEdaWRAP/A1Z0JWR0IqvfMzNLHWRPJ4fdPNqMT6nPVBUBlYq
         K3jo1cMgWdNoAJJnLsAa+ls4Vp195oqVznXq5CE6ZhN4NMid4KXV7S6FEUosWGtPfjTT
         cLlQsabceb+vbVYicU75Sbp0fFtTqTXcZb+cHRU56ZyEhau164VQ/geJhOKHNxxezPld
         X40g==
X-Gm-Message-State: ANoB5pmEYl+aId/sPjYUfg4hhTDQhSyo9cLdbHpT0UCOkRw/FQEUt0kS
        E4SsvQaisZySorE5YVHJOOCjqA==
X-Google-Smtp-Source: AA0mqf4HK9tHUA7GTdHjmreR9R0RVHvQFj1mBQwdl6HN86KkMOofMEERzF1AQ7Y+70Nt//u6fsBn4A==
X-Received: by 2002:a2e:b5b6:0:b0:277:394:34e with SMTP id f22-20020a2eb5b6000000b002770394034emr6798698ljn.18.1668588672098;
        Wed, 16 Nov 2022 00:51:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q9-20020a2e84c9000000b0026dced9840dsm2820895ljh.61.2022.11.16.00.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:51:11 -0800 (PST)
Message-ID: <451f71d7-f921-e0ac-75bc-5e42db4bd200@linaro.org>
Date:   Wed, 16 Nov 2022 09:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dtbindings: clock: Add bindings for Renesas PhiClock
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alex Helms <alexander.helms.jy@renesas.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be
References: <20221115192625.9410-1-alexander.helms.jy@renesas.com>
 <20221115192625.9410-2-alexander.helms.jy@renesas.com>
 <e9fd112f-0fd2-e833-8687-9a256c307842@linaro.org>
 <CAMuHMdX-tziOhCLi-_s_MjPcHr4OW9=xA9xDVgf+fUya1R6TzA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdX-tziOhCLi-_s_MjPcHr4OW9=xA9xDVgf+fUya1R6TzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/11/2022 09:34, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, Nov 16, 2022 at 9:20 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 15/11/2022 20:26, Alex Helms wrote:
>>> Add dt bindings for the Renesas PhiClock clock generator.
>>>
>>
>> Subject: drop second, redundant "bindings"
>>
>>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
>>> ---
>>>  .../bindings/clock/renesas,phiclock.yaml      | 81 +++++++++++++++++++
>>>  MAINTAINERS                                   |  5 ++
>>>  2 files changed, 86 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,phiclock.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/renesas,phiclock.yaml b/Documentation/devicetree/bindings/clock/renesas,phiclock.yaml
>>> new file mode 100644
>>> index 000000000..2b36534d3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/renesas,phiclock.yaml
>>
>> Filename based on compatible.
> 
> Looks like there are more of them, so I guess the family name is fine?
>

If you are sure, then yes. Can we add them now? If not, it's also fine.

Best regards,
Krzysztof

