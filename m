Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DD2C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 11:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355231AbiCPLCi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 07:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355226AbiCPLCh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 07:02:37 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445C760077
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 04:01:23 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z92so1256753ede.13
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=j3v7DktL3ddi9374noY82uKNTdAF/kxo3zK0ti9poTo=;
        b=ag7rpmGq64Dt2m4x/ymb15hq8v9NNthzmlkesTFljZKC6Ypood6gIx6dYZCWxeJP3k
         JCtG3cwF7IlErSUsSfhLXzB/rJffvX6r6t6axGZOErm8S+MWL2lVc9OpQUWVCLSWx6AC
         752064Wc2Ox33hA96YTm4ibav3fN/3yFjapfUYJMNLUuBkw7lh4uAQLtIY+blEBMMHzl
         ewj67LXPPOueqoE6OASpoHHRfaVTiiZjTaX6nX9EuLIrKyPNfGgPXzrG9ApNQf09bFje
         BW3hcNWGfbehsQYVacaD1UnbMVTWX9BL/5n5iSsz6JDG7Ub7H+rVc8tmswrWhVmGb+eM
         lxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=j3v7DktL3ddi9374noY82uKNTdAF/kxo3zK0ti9poTo=;
        b=L2QA464I7yqkQqFjpFfpF4DeU1efyOkrtN59ELu/pSgJwg4PV8+zgiCcKCaV5wDI0R
         kSop+MaY83P0kWgDxQ8Hd1tW4KebRJdWoPTHQD4Is0xklQEIgKJrug3qpVyRlmYps8jL
         WffJ3Zz3CsusmZSCk05rC9vQM1dIsOTqfOGLb0sTIja/7M9pbRHWzxJKf2vWtJeydau6
         mnZbpyM/uXtoUz8Tkq+RXU8F52KVY5DIFc2l0TqBcncNZ4VRTzTx8EwftDQ06X0DBLuH
         XR2x25Ix2IDA2uNaMNdCoVbOjPS2+wdBz247t9YbXhHd/G/2bV1ZgyAkF0BJo2yntEUm
         Rj6g==
X-Gm-Message-State: AOAM530NxnQpq8hIzpEnpPH/4p1KiIvutD4ws9b9YBgRtUgUi48Ytvhw
        t3I3wv0Dr4Jy3ud32NGRqK9eQhEuId/Kh3mGIQlLhQ==
X-Google-Smtp-Source: ABdhPJz9uTMpP8wIRwICJOsdbaUoqk6CQS0ySWvzyFknprjpuA3rI9gkHi+NCH4oiFpKv6T8LV0ikDt+M87WhwMLTY0=
X-Received: by 2002:aa7:d789:0:b0:418:673a:7f24 with SMTP id
 s9-20020aa7d789000000b00418673a7f24mr18134428edq.333.1647428481584; Wed, 16
 Mar 2022 04:01:21 -0700 (PDT)
MIME-Version: 1.0
From:   Etienne Carriere <etienne.carriere@linaro.org>
Date:   Wed, 16 Mar 2022 12:01:10 +0100
Message-ID: <CAN5uoS9F1cjN+WLks1S=GzA1SHw=o-ibFbu-VsUzJ4NydAkAdw@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 12/13] ARM: dts: stm32: enable optee
 firmware and SCMI support on STM32MP13
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ahmad,

> Helo Gabriel,
>
> On 03.03.22 14:09, Gabriel FERNANDEZ wrote:
>>
>> On 2/25/22 16:13, Ahmad Fatoum wrote:
>>> Hello Gabriel,
>>>
>>> On 25.02.22 14:31, gabriel.fernandez@foss.st.com wrote:
>>>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>>> +    firmware {
>>>> +        optee {
>>>> +            method = "smc";
>>>> +            compatible = "linaro,optee-tz";
>>>> +        };
>>>> +
>>>> +        scmi: scmi {
>>>> +            compatible = "linaro,scmi-optee";
>>> This compatible doesn't seem to be documented upstream. I am looking at v5.17-rc5.
>>> Do you have a reference detailing the difference between this conduit and
>>> plain arm,scmi-smc (as used with TF-A on the STM32MP151).
>>>
>>> Cheers,
>>> Ahmad
>>
>> Hi
>>
>> Ahmad,
>>
>> it's on going.
>>
>> https://lore.kernel.org/linux-arm-kernel/20211029102118.GG6526@e120937-lin/T/#mf46c83f0aadce3061ee93fa22159405f38d881a0
>
> I've found that thread in the meantime and got some clarification on why a new
> transport for OP-TEE was added. One question I still have though is why make
> this transport the default for STM32MP13x instead of using SCMI over SMC like
> you do for STM32MP15x. OP-TEE could still be made to service SCMI over SMC
> and it would allow people employing TF-A as SCMI provider an easier migration
> to the newer SoC.
>

Just to rephrase a bit what's being said in the referred mail thread:
On STM32MP13x, there are SCMI messages that must be processed inside a
thread execution context in the SCMI server. There is no standard SMC
function ID defined that the SCMI/SMC transport could use for that
purpose. OP-TEE provides such a threaded context. Therefore STM32MP13x
explicitly expects SCMI services based on SCMI/OP-TEE transport, not
SCMI/SMC transport.

Best regards,
etienne

> Cheers,
> Ahmad

>
>>
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            linaro,optee-channel-id = <0>;
>>> +            shmem = <&scmi_shm>;
>>> +
>>> +            scmi_clk: protocol@14 {
>>> +                reg = <0x14>;
>>> +                #clock-cells = <1>;
>>> +            };
>>> +
>>> +            scmi_reset: protocol@16 {
>>> +                reg = <0x16>;
>>> +                #reset-cells = <1>;
>>> +            };
>>> +        };
>>> +    };
>>>       clocks {
>>>           clk_axi: clk-axi {
>>>               #clock-cells = <0>;
>>
>


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
