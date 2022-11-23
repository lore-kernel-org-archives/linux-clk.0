Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8364C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 14:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238490AbiKWOYo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238305AbiKWOYV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:24:21 -0500
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FCCDEF1;
        Wed, 23 Nov 2022 06:23:19 -0800 (PST)
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 22:23:17 +0800
Message-ID: <c3a1a0ce-94eb-6cce-34b2-d639b8116deb@amlogic.com>
Date:   Wed, 23 Nov 2022 22:23:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <kelvin.zhang@amlogic.com>
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9858039f-e635-2749-80a2-75072d6e9cea@amlogic.com>
 <8dbb3ce2-c8d9-70be-d1de-ed875de0ea1b@linaro.org>
 <3bdaa648-c607-a79c-f6bb-c75baa1e8509@amlogic.com>
 <663d8e29-b47f-8135-8b4e-c95b68559367@linaro.org>
From:   Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <663d8e29-b47f-8135-8b4e-c95b68559367@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2022/11/23 22:12, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/11/2022 14:23, Yu Tu wrote:
>>>> ../patch_clk_v5_1122/0004-arm64-dts-meson-add-S4-Soc-Peripheral-clock-controll.patch
>>>> has no obvious style problems and is ready for submission.
>>>>
>>>
>>> This is a checkpatch output. I am talking about DTS broken. dtc should
>>> warn you.
>>
>> Do you mean I will have wraning in compiling?
>> I actually compiled without warning.
>> ccf$ make ARCH=arm64 dtbs -j12
>>     DTC     arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb
>>
> 
> Nope:
> 
> ../arch/arm64/boot/dts/amlogic/meson-s4.dtsi:105.35-127.6: Warning
> (unit_address_vs_reg): /soc/apb4@fe000000/clock-controller: node has a
> reg or ranges property, but no unit name
> 
> Test your patches better before using reviewers time for trivial
> compile-time fixes. The same rules for C code apply for DTS.
> 

Like this:
	clkc_periphs: clock-controller@0 { 

                     compatible = "amlogic,s4-peripherals-clkc"; 

                     reg = <0x0 0x0 0x0 0x49c>;
You mean it should be, right?

> Best regards,
> Krzysztof
> 
> .
