Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCA5C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 13:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238425AbiKWNkw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 08:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238031AbiKWNk1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 08:40:27 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EA3638C
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 05:27:36 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id e11so16472622wru.8
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 05:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fT/xDuYv9xGq77UWP89SFz3uGJYiuqZ8uj1zssl6LEI=;
        b=m4LuSbWqBjT7NwHQH0tifRloLcrY3pwxm1CueZ4AmCT2gUl/V1p8xjXwKORPOqJCsK
         Rqu8SpS/v32Bq9OdGT9TY7Dhs5p1nLKSPt2dtKY3io58zqaHQj9BW4tpcFHZFlNu9Ib8
         AcGwX4cq5h7T4zTzji74Ahi3vC6i3D9LJbAoPYVTBvtel4xOpslBxfIsDolwComWC8RI
         Zi/Y0k4GpHPk6mU9ViYMW2fhXCLlqg6PomorrJEoA5YVpfLNcaTH2vgwZrR4XSt4nvOl
         QPVb5zDfc6vW0uX45KhY20BpCTHoeBQdpxpLnJigbUlq1ck3dMtNMvRYGQgHLY8l5Ezn
         PeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fT/xDuYv9xGq77UWP89SFz3uGJYiuqZ8uj1zssl6LEI=;
        b=lZWe9RSFfO0oxKJ62+YrijQYm8gglyBmiW2MC99cuJJq5LZ0pYqX8jykQTwMuJ+GVf
         4B4mY49nAtkQYYMBZ9iWTqnj2ARojTBF9D+2kBDe4gVJ3u3YYzD5268aNqj6nwziGWAH
         iAmo8qLqPAlzyuxb6zLKPGLMr/4DqTgY71M4wd1+F50zLJoHQxc9l9Xu1am+YzURzOez
         0/DIaqv+ZgbIpb0xeBgzER/2+UBK9XvPXOpsqsa97kdbWQkxIzazb61hy67tDXBKsxn5
         LPhLaYxlndjB97iRPJ+OwfUaed9Pym/q2QBnNT89yAIYAbzXMXZbDJSAnZ/Pvz2TaJwc
         OGUw==
X-Gm-Message-State: ANoB5plP5a+EW5U1eYM6jWA30EQdILU2L0pVGYzn/7Iy1dwoISir12dH
        N4YxvUjJXXkcoMzgVCIWJ8b+1A==
X-Google-Smtp-Source: AA0mqf6rOqEuavZEDT+cCpsbo0nI8+NuQqSYhObPcsBGUEd3IpX2Pk1gKE8zWfzCrTcLpzL9QcyX8g==
X-Received: by 2002:a5d:6b0c:0:b0:241:c595:9f05 with SMTP id v12-20020a5d6b0c000000b00241c5959f05mr14052664wrw.439.1669210054818;
        Wed, 23 Nov 2022 05:27:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003c6cd82596esm2609540wmq.43.2022.11.23.05.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:27:34 -0800 (PST)
Message-ID: <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
Date:   Wed, 23 Nov 2022 14:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/11/2022 11:10, Krzysztof Kozlowski wrote:
> On 23/11/2022 03:13, Yu Tu wrote:
>> Added information about the S4 SOC Peripheral Clock controller in DT.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index bd9c2ef83314..e7fab6e400be 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -6,6 +6,8 @@
>>   #include <dt-bindings/interrupt-controller/irq.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>   
>>   / {
>>   	cpus {
>> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>>   				#clock-cells = <1>;
>>   			};
>>   
>> +			clkc_periphs: clock-controller {
>> +				compatible = "amlogic,s4-peripherals-clkc";
>> +				reg = <0x0 0x0 0x0 0x49c>;
> 
> This is broken... did you check for warnings?

This is actually fine, the parent node has a ranges property:
https://github.com/torvalds/linux/blob/eb7081409f94a9a8608593d0fb63a1aa3d6f95d8/arch/arm64/boot/dts/amlogic/meson-s4.dtsi#L93

Neil

> 
> 
> Best regards,
> Krzysztof
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

