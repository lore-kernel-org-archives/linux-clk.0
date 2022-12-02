Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5B4C4167B
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 11:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbiLBLQa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 06:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiLBLQ3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 06:16:29 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06B9D20B4
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 03:16:27 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p36so2547920lfa.12
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 03:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BiSfLTl0PMvNNjl+HsepmgENg8ShUkFOSLdhB9Xo4Ak=;
        b=voKPCwh0grJWEj8uf/S3XZfKzLt6qIETqimibcK1G98MSfCjBX56q9aPKIdwCGnoCm
         P81AtH7H1aoEz0HpKUIxyRr37AiCfO34VDMW8+t8dzDchhmlBEeGWJqJDDUiFYTTnSIN
         gIUF5KZxFSkR5c0zp42WRnG8ty5Z7zT77tNl9OkQWWrgYRGq84WmrN9n9JTyJ15UKmfy
         hnPniS5yR8C6c5bdoEPrdFJEl1ML6IE2FtiUwD+AOL5VWu+toxENiKow23YDDITwTavl
         oT+4AAn3M+LdmEKOyg7mxe6TJzy/BW4011mq/Gf+YDHWjSx2G+CKzZLSQkumbH+UB+mU
         sbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiSfLTl0PMvNNjl+HsepmgENg8ShUkFOSLdhB9Xo4Ak=;
        b=i9EYsCrY4baWZyufaT3cwQVf1DH8ws/YfTbu96UYBswGXuW3mXR+OkMR1PxJ7wZbL9
         1u5Ah6EqSEWAy+Cc6aBS36bxSwWev8bpmXwzZwfAZyEuHfc2DO3+8KFzJdfT/NXVHRsV
         8r/9U6jV4H+AK/wWex3w7e87OGy+bpQE0sGmnTLNOknlHI1CVQVBYvkGYxYJ3INRxx4G
         q5Sp1g9ZHzt9XYGmyYibQrsifJm3UrszPeFJM6+g+o4B08nqGgVhg0tXYta/TIIgG1iv
         OQgCF7lsA5avFb4tT3jDeD+62cRUXKKaKLM1MGcJaskxwJv8LHb3jyOVYben/MZL3IAI
         4szg==
X-Gm-Message-State: ANoB5pk+usw6sslxN9oeOdLuHjVDVR27rdEpESE3A0XjWEhYzLahrhpy
        OYu6vLDnQ3Av9uPaSZDnJEsj8A==
X-Google-Smtp-Source: AA0mqf4oe/AnY6kz8dPDDe/OkcmzaFVXmcv7PdLGNMtmCdDy3++4yPPS1jhwg934DtAlqaBIL6uPKg==
X-Received: by 2002:a05:6512:3b12:b0:4b4:686b:4f7 with SMTP id f18-20020a0565123b1200b004b4686b04f7mr16762624lfv.256.1669979785967;
        Fri, 02 Dec 2022 03:16:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d11-20020ac2544b000000b004946bb30469sm983426lfn.82.2022.12.02.03.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 03:16:24 -0800 (PST)
Message-ID: <b425da35-c189-aabb-65b9-f956945d7b08@linaro.org>
Date:   Fri, 2 Dec 2022 12:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, sboyd@kernel.org, khilman@baylibre.com,
        kernel@sberdevices.ru, robh+dt@kernel.org,
        martin.blumenstingl@googlemail.com,
        linux-arm-kernel@lists.infradead.org, jian.hu@amlogic.com,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        neil.armstrong@linaro.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
 <166995398251.2089685.16059995540663317860.robh@kernel.org>
 <20221202095124.4ecpfqhtzf34lwbf@CAB-WSD-L081021>
 <cea3cdd4-3d36-1439-b211-047091c05a0f@linaro.org>
 <1jfsdy83h3.fsf@starbuckisacylon.baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jfsdy83h3.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/12/2022 12:04, Jerome Brunet wrote:
> 
> On Fri 02 Dec 2022 at 11:39, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 02/12/2022 10:51, Dmitry Rokosov wrote:
>>> On Thu, Dec 01, 2022 at 10:10:04PM -0600, Rob Herring wrote:
>>>>
>>>> On Fri, 02 Dec 2022 01:56:53 +0300, Dmitry Rokosov wrote:
>>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>>
>>>>> Add the documentation to support Amlogic A1 PLL clock driver,
>>>>> and add A1 PLL clock controller bindings.
>>>>>
>>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>>>> ---
>>>>>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
>>>>>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>>>>>  2 files changed, 68 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>>>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
>>>>>
>>>>
>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>
>>>> yamllint warnings/errors:
>>>> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml:26:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
>>>>
>>>> dtschema/dtc warnings/errors:
>>>> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
>>>> 	expected: http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#
>>>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dtb: pll-clock-controller@7c80: reg: [[0, 31872], [0, 396]] is too long
>>>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>>
>>>> doc reference errors (make refcheckdocs):
>>>>
>>>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-2-ddrokosov@sberdevices.ru
>>>>
>>>> The base for the series is generally the latest rc1. A different dependency
>>>> should be noted in *this* patch.
>>>>
>>>> If you already ran 'make dt_binding_check' and didn't see the above
>>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>>> date:
>>>>
>>>> pip3 install dtschema --upgrade
>>>>
>>>> Please check and re-submit after running the above command yourself. Note
>>>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>>>> your schema. However, it must be unset to test all examples with your schema.
>>>>
>>>
>>> Please find all fixes of above warnings and errors in the my patch
>>> located at the link:
>>>
>>> https://lore.kernel.org/linux-amlogic/20221201225703.6507-9-ddrokosov@sberdevices.ru/
>>
>> Why? This patch here is broken and it should be fixed. Don't apply
>> broken patches...
> 
> Dmitry is ressurecting a series that is several years old and not his to
> begin with.
> 
> He was unsure about take the code of somebody else.
> To be fair, he even asked for advice on IRC about to proceed.
> 
> Dmitry, as you may have guessed, for next revision, please fix Jian Hu
> original patches in place, not with fixup patches.
> 
> If your fixes are minor (not complete rewrite), please keep the original
> author and add your SoB

We never take intentionally wrong patches, e.g. code which does not even
compile, and immediately fix it in next patch.

Can you imagine adding such drivers? Which are broken in the commit they
are added?

So the patchset is old or abandoned, take ownership, add co-developed
etc. Just don't add known broken code.

Best regards,
Krzysztof

