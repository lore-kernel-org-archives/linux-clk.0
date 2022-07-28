Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824E1C04A68
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jul 2022 09:02:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235363AbiG1JCj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Jul 2022 05:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235350AbiG1JCg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 05:02:36 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9C665657
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 02:02:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id b21so1263615ljk.8
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=yfi+fc1Zb5qV2V2Wb3g8x7DGlXgAZj2Jvy0KQfSodWs=;
        b=BwyXq3EaFf0Zk/XqgsIyi1kp3V1mOAX5f18FjumLF+gccBiXx1HjsbONcMZ5QNMedw
         qBdvcDNoFoRD5ftiEAV8xn5QAfa+MrQPfJ5dU3yN5m22KH2s+nvoD0ht9nT6F7gXxPbc
         rPV85IBQZgWDggbXBX1wYRVVyjuT8+CafQDIc8dEt8L+vjvSOmAMfHsHgghhh0HDUQBL
         ZXOH0VMgtp6O4V0MCvEmE/QMXM7vxwkqlnz8I0mxwDBn0Te5PJBIKmBbUrGW9NT0PztB
         0M/i+IHtl1GHGK/WLthwFQOgXtpIUX+BsN37ymtq6SByXSx+DmeQmgvatDFKdxCfxSoT
         Cadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yfi+fc1Zb5qV2V2Wb3g8x7DGlXgAZj2Jvy0KQfSodWs=;
        b=75Cgv/RSSzybEmtuWB44R70KK9KPssodgEvNC9j4LNwLUcqD1HSD9MA9hAGwWAQ73d
         iNzaWn+sGZC8nK5YHR6WFqOxq+v6S9G0cvefICxq0Fw3HqN+wXa5a6zMECGqRE0mBq+8
         5mtbzHuNFNArcFH3Uq+fQvRywORLTy/rRrNkfz8u0nY0KerNqS2Ekdip7U8VLbqRVfPA
         EnT47pZG41Lx3bfVvZhjmng/Bdy/jtQaUtatKgIKmCQys2pdM5hEn5Y0LS+yRNZOILo/
         EgvJn8g2ESjhPNTTjUL6M/nMQKexKeLFyBWbihfdg2k5uJXbJrnI2Rmn+I6RUr6m+8pC
         kRow==
X-Gm-Message-State: AJIora/Ssdp/AdUcarqtVmy6UxK4Zv+eJmR+Pkriu0drPJ95GguHgeLm
        t4UqbQ16ixt1lyERNd9pl1QyLg==
X-Google-Smtp-Source: AGRyM1uhBJjljnPuyZUlcYQa2GgWlNAIASCeOULAJ0BJ+SvIe68yj6eKdiqLW80f0YKUzSiOuu+4OQ==
X-Received: by 2002:a2e:910d:0:b0:25d:f7e7:8cce with SMTP id m13-20020a2e910d000000b0025df7e78ccemr8115318ljg.252.1658998949558;
        Thu, 28 Jul 2022 02:02:29 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id l13-20020a19c20d000000b00489c6c76385sm97465lfc.268.2022.07.28.02.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 02:02:29 -0700 (PDT)
Message-ID: <367cf98b-ef06-8f44-76c8-9099a1ec13dc@linaro.org>
Date:   Thu, 28 Jul 2022 11:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>, Yu Tu <yu.tu@amlogic.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
 <1jv8rhfw8h.fsf@starbuckisacylon.baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jv8rhfw8h.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/07/2022 10:50, Jerome Brunet wrote:
> 
> On Thu 28 Jul 2022 at 10:41, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 28/07/2022 07:42, Yu Tu wrote:
>>> Add new clock controller compatible and dt-bindings header for the
>>> Everything-Else domain of the S4 SoC.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>
>>
>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c1abc53f9e91..f872d0c0c253 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>>  F:	drivers/clk/meson/
>>>  F:	include/dt-bindings/clock/gxbb*
>>>  F:	include/dt-bindings/clock/meson*
>>> +F:	include/dt-bindings/clock/s4-clkc.h
>>>  
>>>  ARM/Amlogic Meson SoC Crypto Drivers
>>>  M:	Corentin Labbe <clabbe@baylibre.com>
>>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>>> new file mode 100644
>>> index 000000000000..b686c8877419
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/s4-clkc.h
>>
>> Filename with vendor prefix, so:
>> amlogic,s4-clkc.h
>>
>>> @@ -0,0 +1,146 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>> +/*
>>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>>> + * Author: Yu Tu <yu.tu@amlogic.com>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLOCK_S4_CLKC_H
>>> +#define _DT_BINDINGS_CLOCK_S4_CLKC_H
>>> +
>>> +/*
>>> + * CLKID index values
>>> + */
>>> +
>>> +#define CLKID_FIXED_PLL			1
>>> +#define CLKID_FCLK_DIV2			3
>>> +#define CLKID_FCLK_DIV3			5
>>> +#define CLKID_FCLK_DIV4			7
>>> +#define CLKID_FCLK_DIV5			9
>>> +#define CLKID_FCLK_DIV7			11
>>
>> Why these aren't continuous? IDs are expected to be incremented by 1.
>>
> 
> All clocks have IDs, it is one big table in the driver, but we are not exposing them all.
> For example, with composite 'mux / div / gate' assembly, we usually need
> only the leaf.

I understand you do not expose them all, but that is not the reason to
increment ID by 2 or 3... Otherwise these are not IDs and you are not
expected to put register offsets into the bindings (you do not bindings
in such case).


> Same has been done for the other AML controllers:
> For ex:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/gxbb-clkc.h

This cannot be fixed now, but it is very poor argument. Like saying "we
had a bug in other driver, so we implemented the bug here as well".

Best regards,
Krzysztof
