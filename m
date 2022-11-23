Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF80C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 14:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238028AbiKWONa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237799AbiKWON2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:13:28 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDA62D1F4
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:13:26 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a29so28285303lfj.9
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/Gp8oNJZw3cLXUYP8ks4PwvnFzrrxOR4KiPfsrpS5s=;
        b=Eu4w0mKIlQN/48m6aFJ+zpEBptQk93sPQh9M8czvaTGBgj/obNFUppnhII4bHaL+t8
         WDRLzC/3Bq9UVwLtv7GnkM96heFTdJivk2h6ne0AJWun7grt5tlGRIkzjFdSsrMuxmm9
         fOEoOPvp1SOx/oesbnKiK5xb2kGivh5DafLvQPvRzONO+0HYgfFbCsn5INIWAqht3SWV
         XGyvUJUdga+HZqaWOemqlq7N/FMRO9J5Gswx85kxcWL5ADEik4+K0/FZgRLrjRPkD6Cx
         EIDe//PF9Abt7YL/j3jqsSf12pvXQUFX1J8fSacwR2zK+LGdDdBoE3fd3uPb87puxjNj
         KbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/Gp8oNJZw3cLXUYP8ks4PwvnFzrrxOR4KiPfsrpS5s=;
        b=Wp+cvvmVFQFpPF4y12JMmk01yfREa6qAvEXtqY0npTrCmSvP+OEOQKpRNKuaypJxzr
         LX3cxmGjWQuxu7RhoUR5BsOfTLqKtVPtAqn8mWv5SHymkLKxp6UrZ9FYTWGGlHVoGCkX
         E708B7WoUKMR+VUrB2KTDsp+s+cDGxn8TUaIBWPhZpiRfL3V/hgyznZQzF4xsWw9xM0o
         D0Z718lBj/YTSqIMjrRcQsDzm8oGn9ftz8pcCLXAltWdtqjaTxoU3CrJiDz20BdCsMYT
         ZDtrnbsEAGufrehZ5eZKgmeMwDBdIBTUd7K/yJypgmjLSZ88p8qeccYOM9k+BgCwGM8R
         9fTg==
X-Gm-Message-State: ANoB5pkp5p0gqtsqJe+0CVAaTo/KZwFWXAg6z2ka/mVrTdvIj7mAFTnX
        Pjn9FTS7Xfd7RjqfL80MyjCClA==
X-Google-Smtp-Source: AA0mqf5quQBr81TBL9QYOBAQk89wKtHmN891t6m5JcSES8bjEfXcUWIQE5L7V2X5rE6LA0yj51omnw==
X-Received: by 2002:ac2:5f62:0:b0:4b4:6ca6:c669 with SMTP id c2-20020ac25f62000000b004b46ca6c669mr9176286lfc.338.1669212804830;
        Wed, 23 Nov 2022 06:13:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 21-20020ac24835000000b004a2588520f5sm2893414lft.166.2022.11.23.06.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:13:24 -0800 (PST)
Message-ID: <7f3a34a0-a5b0-3a72-8e0e-00656bd77ff6@linaro.org>
Date:   Wed, 23 Nov 2022 15:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To:     neil.armstrong@linaro.org, Yu Tu <yu.tu@amlogic.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
 <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/11/2022 14:27, Neil Armstrong wrote:
> On 23/11/2022 11:10, Krzysztof Kozlowski wrote:
>> On 23/11/2022 03:13, Yu Tu wrote:
>>> Added information about the S4 SOC Peripheral Clock controller in DT.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>>>   1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> index bd9c2ef83314..e7fab6e400be 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -6,6 +6,8 @@
>>>   #include <dt-bindings/interrupt-controller/irq.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>>> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>   
>>>   / {
>>>   	cpus {
>>> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>>>   				#clock-cells = <1>;
>>>   			};
>>>   
>>> +			clkc_periphs: clock-controller {
>>> +				compatible = "amlogic,s4-peripherals-clkc";
>>> +				reg = <0x0 0x0 0x0 0x49c>;
>>
>> This is broken... did you check for warnings?
> 
> This is actually fine, the parent node has a ranges property:
> https://github.com/torvalds/linux/blob/eb7081409f94a9a8608593d0fb63a1aa3d6f95d8/arch/arm64/boot/dts/amlogic/meson-s4.dtsi#L93

The parent ranges do not change here anything. You cannot have a reg
without unit address and the tools report it. No need to use reviewers
for this...

Best regards,
Krzysztof

