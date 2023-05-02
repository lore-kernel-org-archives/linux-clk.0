Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E77C77B7E
	for <linux-clk@archiver.kernel.org>; Tue,  2 May 2023 07:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbjEBHjT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 03:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbjEBHjS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 03:39:18 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325CC1734
        for <linux-clk@vger.kernel.org>; Tue,  2 May 2023 00:39:16 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso4616734a12.3
        for <linux-clk@vger.kernel.org>; Tue, 02 May 2023 00:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683013154; x=1685605154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scTz1jek6y5+l9SdnFhQuw4xm0TqGFxUx1QJtMkBaKs=;
        b=a78uGnmVax8AdRjW7AZExnTkFv0eZsYVvkFy9hSpCNS7BQWv/JTxTXGsGlZC+zElEj
         KoKYLSHCYTr/1zL7bF2dOMQpw7GaKekzYVJhwCaPG8i8/e6EzraLOtrvdCCbNgcX5Xmf
         CJ/kv6zdhMDyHqFX/SXg3u3lGfxOkIpNvQkUFn4JVGKd/fzgbhkH/gUAREsh2DKlZmqp
         ZXMowX4HX2Vod+P3AwaYLgLokcFMX2nWav0jQS1A5bDmEtRaXKP8sI3h6uaiTzrDmGl9
         SQMfnLmKxhWomqVPS56m1w7efyVqycAZ9FzAyfWfEszYmkk1PtmMj0wvRnWLL0wn4VDb
         J/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683013154; x=1685605154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scTz1jek6y5+l9SdnFhQuw4xm0TqGFxUx1QJtMkBaKs=;
        b=mFxYIw49h8P/As+8zEDNtoBOWmOX0395ELD9zsf2Hpbw3RVsOHobw9s3hm2ayzV3ka
         +zCTR0NHMgaIkDdVVby5RlDMYl00/YFEioc+CYcrTx8MIVdnvokXg2O0FEbuPf/ZCbR9
         cpTpgmESgKzlRHlBp/dH7mJSLFoKnOHivy/UTiMZsXvaT2Z/Ev62FGSnfkTdlrLG0n5k
         kacnWucMPjPIJamRlsQNkKd2bg/b+1kZf1kOxw3APbsJUu+udJdKoTEPuu35Cfa7Tha0
         YurmLnodBZoZKP19G4DfZsMH8LjH9EQ4nvpPcctpDK546oh6F6qlFHdADlSMPxxibtB6
         5BQA==
X-Gm-Message-State: AC+VfDzLRBlhR/p4sMAfylqISsVrNNOIhgilBOK4n2K5NNROqShzGQBf
        eVXxroh4EsYzEB2L5WL4Rzv4ZQ==
X-Google-Smtp-Source: ACHHUZ7YOKbuPjna9OS0ZMD0EoDB8ZuNxcxOz3Ez7c4/r1mSyr0N11xwD8t8vZieZrHbXmRjDxFyaA==
X-Received: by 2002:aa7:c758:0:b0:50b:c3a0:40e5 with SMTP id c24-20020aa7c758000000b0050bc3a040e5mr5612751eds.21.1683013154607;
        Tue, 02 May 2023 00:39:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id q9-20020aa7da89000000b005069175dcb7sm13212239eds.58.2023.05.02.00.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:39:13 -0700 (PDT)
Message-ID: <e29a7911-065a-04e2-f04f-027a0646362c@linaro.org>
Date:   Tue, 2 May 2023 09:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Content-Language: en-US
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>, mturquette@baylibre.com,
        sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>, jian.hu@amlogic.com,
        kernel@sberdevices.ru, rockosov@gmail.com,
        AML <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-6-ddrokosov@sberdevices.ru>
 <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
 <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/05/2023 03:38, Christian Hewitt wrote:
>> On 1 May 2023, at 7:51 pm, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> Hi Dmitry,
>>
>> On Wed, Apr 26, 2023 at 11:58 AM Dmitry Rokosov
>> <ddrokosov@sberdevices.ru> wrote:
>>>
>>> Add the documentation for Amlogic A1 Peripherals clock driver,
>>> and A1 Peripherals clock controller bindings.
>> Maybe a native English speaker can comment on whether it's
>> "peripheral" or "peripherals".
> 
> I’m not a grammar specialist, but I would write:
> 
> “Add documentation and bindings for the Amlogic A1 SoC peripherals
> clock driver”
> 
> Peripherals is the correct plural but reads better when you add
> context on the type of peripherals.

Drop the "driver" references - from the binding itself and from commit
msg. The bindings are for hardware, not for the driver, so: "for the
Amlogic A1 SoC peripherals clock controller.".

Best regards,
Krzysztof

