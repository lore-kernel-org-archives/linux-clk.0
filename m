Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ED3C61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 13:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbjBUNiJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 08:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbjBUNiI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 08:38:08 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3896FD525
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 05:38:03 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g1so17076357edz.7
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEKp5jxwSSp5xv1BprgYnfrSsvOH2oqVyu+hm71G5FA=;
        b=rF//HoJWLXcJthbLa7TIgEu0wOI//lZV5cE0z6TSi9Y6/DlAjSo5YbZr7OY6zwoYLz
         qeVptqcYvdbsYz9VXWMyaE5v36tGYKkcZjB5uL9EuLDgLa6Vr1jag1FrA2l/5wfHliSy
         fKD+js2T48YSBcQHmUBandzjMDsgwrKygnlgcS253My4hKbaGrb06xcDmE73J/tTaSox
         k4DtJkZNxsCpBBQJkbhClsEBwnEdUgJkeKhIBg+7bH2VlgjMNNAEGolcGw+OWIo3kOrI
         imH0de/B61hXN7ngislSUdcsfLHyaDfXDs75LxdH05EeRdZgVtz3a2i5XV3eNVBopREu
         A8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEKp5jxwSSp5xv1BprgYnfrSsvOH2oqVyu+hm71G5FA=;
        b=ZDNCv/GwXVBFy2zmZmpX3vdTf6UhXlf6E46RPSS/Alx4h94VBmARyX6N/TnrG6tMMT
         qZiSfwqPsDQTOsMjqwrWwmmdN48s+fjAgU8TqQcOGjJzMAFR+zYE3oKQci4WEarQXOK2
         Cj5vPZNEhN7woZ7ePEztCNtWS/yfUPz/lcqPMZs+M22EVnsQvdYvCOQyBksiBqjvVQKX
         Rpkm+5NvJtW+rYFzw7FoVE6RkzLv65X90cYNYXcOhpr1tQnixAzWjcR1YnvRoMm+lOse
         2x+wi/W2JPSU5yIAmLaC4wCnebGjqKINm57A5S04YsvyRvuzwmxVKmXPANVOnFKOqy4J
         HDhw==
X-Gm-Message-State: AO0yUKWdIP2qEOcd/2lDaqQiiDUEcr3ZHkvQK0u311Jfu/9KU6uQZjAS
        KCszYh8FbuUR5K4/RFzNFy2gNA==
X-Google-Smtp-Source: AK7set8b68dqxaiVXuJPBrEAexAK6vPXVsKEK7Ugt5Ougrz5aWPm3HYk/qg14MA5JIqtzCnZml+91Q==
X-Received: by 2002:a17:906:490b:b0:8b1:3a8f:a51 with SMTP id b11-20020a170906490b00b008b13a8f0a51mr9970495ejq.15.1676986681679;
        Tue, 21 Feb 2023 05:38:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r27-20020a50d69b000000b004acd14ab4dfsm2262994edi.41.2023.02.21.05.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 05:38:01 -0800 (PST)
Message-ID: <ae468e63-d8d3-dbfb-64da-75a147e1cd2d@linaro.org>
Date:   Tue, 21 Feb 2023 14:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-2-xingyu.wu@starfivetech.com>
 <430318ed-5b30-e549-a5ce-df83aa18adf9@linaro.org>
 <43d00fd9-ab24-442e-3f82-208edaf399d0@starfivetech.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <43d00fd9-ab24-442e-3f82-208edaf399d0@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 14:01, Xingyu Wu wrote:
> On 2023/2/21 19:25, Krzysztof Kozlowski wrote:
>> On 21/02/2023 09:33, Xingyu Wu wrote:
>>> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
>>> on the JH7110 RISC-V SoC by StarFive Ltd.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>
>>
>>> +    };
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 93eb504c3b21..2e70c9f21989 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19914,6 +19914,7 @@ F:	arch/riscv/boot/dts/starfive/
>>>  STARFIVE JH71X0 CLOCK DRIVERS
>>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>>  M:	Hal Feng <hal.feng@starfivetech.com>
>>> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
>>
>> No improvements here. You add here new bindings for one device and then
>> - without explanation - add yourself to all Starfive clock bindings.
>> Either explain it or drop it or move it to separate patch.
>>
>> You already got comment for this.
>>
> 
> Sorry, I didn't understand what you meant before. Now my understanding is that, 
> If I improvements JH71X0 driver no JH7110 driver, I could add this here. Right?
> 
> Is it OK if I do it this way to move it to separate patch like this?:
> +STARFIVE JH7110 STG CLOCK DRIVERS
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>

If you want to be the maintainer of all drivers, add separate commit for
this, so this is obvious. Or at least explain this change in commit msg.

Best regards,
Krzysztof

