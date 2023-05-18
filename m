Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33201C7EE24
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 14:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbjEROJH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 10:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjEROJG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 10:09:06 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB4CE51
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:09:05 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-965b5f3b9ffso249843066b.0
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684418944; x=1687010944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynI1F9GRlorpTQ3//tjzRjm9oO2VDWxwaEiCp14cw+8=;
        b=l/uqrQwhsN91ktGXDLHSeOnK04VqjMfjApJem9V22gmlQ2PMPpJ6PIkXIknZORpOo9
         13oiHJvgawnfSmhP1Ekes3Z0PPfLCy7iq9Iq3J7xclj9g9fC3oevOOr7p1GcLJiVBKJc
         G0+K2R6js7q7WGM8H9bHuIMwtHp2MUfnLiny7Yhi8cLh+m5yxXb5L3HTgJXkaR29N/Sw
         gWEvPp3eVirnwoR3WyUu9ewAt76N+QSUvYWIK+1F2B1Jp9H0B/+1vGRP4/jwHj2GvYae
         Fr7Cl3+lRz91r81XjP8byuGztLkI1zQZucjp41lch/kdQwYOxjFdcXyPq06pSBjTUxux
         B2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684418944; x=1687010944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynI1F9GRlorpTQ3//tjzRjm9oO2VDWxwaEiCp14cw+8=;
        b=T699KILs1jg8fBvxVN8+vLIz2AoDlc5Die/nb9W/s6i42O9CkLUqYu5XB/W4yjGWm+
         bVFf7q4yEcJKWEwF9Y8r+Y1fzjyxxASjnWBVpP8X/uVrj0xW0N4wWbG1QlXZlMGCEWnk
         sSkg4L0bG/+9+WQCTbCrXM98goo2IRNKi3+xZZj4SDUj7QYoq6uGKByvp697SCzcQmDX
         OOnKD0ClQ70GM1+7eSS6L9oT1aFeiUYzJuTQyF2ON+RHkBqkn6YJh+/WIvq/qadHh4KL
         s6OMn3Ql7K8tZFSkp64LuHj2vniOdW77gBo//lZQZLXF6heGngrB+/Tdh/C9boPqSEas
         /1yg==
X-Gm-Message-State: AC+VfDxOnxkvR0m1udiSxehRToiV6mkmeXwyg1QmhnXeI7YLeble/fRb
        zBMgTFcIJ3WxQ5mcAjgpYjZ6gg==
X-Google-Smtp-Source: ACHHUZ7AWtaKIYmvs/UYoBsfo7y1w1zvObfFUtKx8gAePaPSKP9wKSev0O+652RoyHlDI7I/+hlO1w==
X-Received: by 2002:a17:907:7f18:b0:96b:1606:f015 with SMTP id qf24-20020a1709077f1800b0096b1606f015mr5350697ejc.18.1684418943709;
        Thu, 18 May 2023 07:09:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e24:6d1b:6bf:4249? ([2a02:810d:15c0:828:7e24:6d1b:6bf:4249])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090654c700b0096f4389714csm441423ejp.55.2023.05.18.07.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 07:09:02 -0700 (PDT)
Message-ID: <cd38d95f-95bd-056e-e3d0-d6c95e3fd80e@linaro.org>
Date:   Thu, 18 May 2023 16:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add binding documentation for TI
 Audio REFCLK
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>, Jai Luthra <j-luthra@ti.com>,
        Andrew Davis <afd@ti.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
 <20230515-refclk-v1-1-5e89f01d6733@ti.com>
 <20230517-reprise-unroll-e2223cab3846@spud>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-reprise-unroll-e2223cab3846@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/05/2023 19:15, Conor Dooley wrote:
> On Wed, May 17, 2023 at 01:04:05PM +0530, Jai Luthra wrote:
>> Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
>> SoC.
> 
> This seems fine to me. Perhaps Krzysztof will differ...
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> ---
>>  .../bindings/clock/ti,am62-audio-refclk.yaml       | 44 ++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
>> new file mode 100644
>> index 000000000000..7c4cf7abe007
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/ti,am62-audio-refclk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI Audio Reference Clock
>> +
>> +maintainers:
>> +  - Jai Luthra <j-luthra@ti.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: ti,am62-audio-refclk
>> +      - const: syscon

I just don't get why this is syscon? There are no references to it, no
DTS change and nothing in the driver suggesting it has to be syscon
(creating regmap for internal use does not count).

Andrew,
Is this the pattern we discussed and wanted to remove?

Best regards,
Krzysztof

