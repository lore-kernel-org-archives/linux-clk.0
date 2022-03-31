Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A71DC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 31 Mar 2022 06:34:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiCaGfz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Mar 2022 02:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbiCaGfx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Mar 2022 02:35:53 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD8BF1E9D
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 23:34:06 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bg10so45954645ejb.4
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=c4SmVHsDkudYEyg9IrI8RgsuOT8JSF8xcW5md7xT/Ok=;
        b=ENXGltYC898VuIdpCOFU4AS0J3uxxgmclSA09v8DooceuwBa8oCfEbvMLy+Sh5cObS
         6mZZ0FsD2Ykf/PC/hUbJTVAL/QuojkKWcx+d2g5AGJCto6JjGVhNi3IoIwJiYCCGspUN
         w9+CJ9Imc5wP71XoTIy1XObq2B9J+XAS+bCprS0NWJscD8WKVLX013o/tyqYuG7cIrkd
         TTc/QhT/paqCaA2pu1AMxuOfTW3vfxwheMl3bYEU4HF1F2cUKPU20cPNrc9D/+tEjisS
         jabT3Yf+HXwrjQoFNCNn28Fi1ID8iUN1zRC0A7QmWmLJYB1HBtuy9VBlll2+Kf2bgGzH
         p7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=c4SmVHsDkudYEyg9IrI8RgsuOT8JSF8xcW5md7xT/Ok=;
        b=RxNksJN94PTG4VJypJpYZG9klAcPfWdVg9qzVkVoZyVTsQk18ew9HPTsYh69fp2fru
         CYpMFTFTXzLjBj0EJV5zQmW+O3lt0gQM99AZ3W0azmDLtopH4J+ItfjvFCuLdKC1+K4u
         x4LolCet3O/yj57rplE9pjGA8eI8ABSfSZs1JBw3YHVGL96vWui4RPo2CHD5gw29qDtE
         qUSZMgi8izd9EeGs65U/Osulc2sSsVWgiOQ0gGGIfj6pIEbEUlhgWB9f4/mqsPaCg3G1
         77ElTKOss9FF5EIa+jWw4GfyOIc2oKeVL1iqc7wqgIsMkBPLSLMrHQGzk7HeppyrKo2l
         pECA==
X-Gm-Message-State: AOAM530hONy5VXd5HSmkl2Z5yfHryIruNG3j1k8B4h7em9BLaN3sKhuf
        uJ1QlBS1WthjMfVLxCdIURA91w==
X-Google-Smtp-Source: ABdhPJw1hxcxfGo1o86WWmnvS53cQHn9OtNW7zDdd6anzYYBfUrPR2Ackm2vrlixW2tE2YBXYCgXdg==
X-Received: by 2002:a17:907:6d8f:b0:6e0:1512:913b with SMTP id sb15-20020a1709076d8f00b006e01512913bmr3744666ejc.491.1648708445076;
        Wed, 30 Mar 2022 23:34:05 -0700 (PDT)
Received: from [192.168.0.165] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7cb83000000b0041b573e2654sm2622587edt.94.2022.03.30.23.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 23:34:04 -0700 (PDT)
Message-ID: <cbe5c963-c727-0fe6-6e03-039c4334f7a9@linaro.org>
Date:   Thu, 31 Mar 2022 08:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add binding for MA35D1 clock
 controller
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-2-ychuang3@nuvoton.com>
 <866c6b42-434d-e7db-5319-2256cd7003d7@linaro.org>
In-Reply-To: <866c6b42-434d-e7db-5319-2256cd7003d7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/03/2022 08:29, Krzysztof Kozlowski wrote:
> On 31/03/2022 04:42, Jacky Huang wrote:
>> Add the dt-bindings header for Nuvoton MA35D1, that gets shared
>> between the clock controller and clock references in the dts.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
>>  .../dt-bindings/clock/nuvoton,ma35d1-clk.h    | 262 ++++++++++++++++++
>>  1 file changed, 262 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/nuvoton,ma35d1-clk.h
>>
>> diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
>> new file mode 100644
>> index 000000000000..3634e5edcac5
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
>> @@ -0,0 +1,262 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
> 
> Can you make it the same license as bindings?
> 
>> +/*
>> + * Copyright (c) 2022 Nuvoton Technology Corporation.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_MA35D1_CLK_H
>> +#define __DT_BINDINGS_MA35D1_CLK_H
>> +
>> +/* Clock Sources */
>> +/* External and Internal oscillator clocks */
>> +#define	HXT		0
> 
> One space after '#define'. Please do not introduce some non-Linux coding
> style.

You also ignored my comments from your v1 (because this is not v1...).
Do not resend without discussion or implementation.

Best regards,
Krzysztof
