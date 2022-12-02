Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8725BC47088
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 10:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbiLBKj6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 05:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiLBKjx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 05:39:53 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D895C4CE2
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 02:39:51 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so6740259lfb.13
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 02:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zeYMO6S95PVeGTfoyxNR76aAZjf7Y1iGkIH6FUXQn8=;
        b=uOb+/2naG5q/UNM9i0EvhDyeO/YGQAwiXlkSiDeudE36XTB7KeIwvNxkwZcs/Vyiv+
         WbJRVLvve+y/HbRoeRWD3tuWxHtNlCHMyAR4P+pC3vNd50ZypWqHNs6D4oyj6M6f+qwq
         lazaOJngBtLmCd5ITR8xDgRIG6zscsVvFykW0kRJlqoQqZ1IXa0wyFo6T8lSS6w9qVlQ
         s9yHEawcr2lS6HuPqw2vGmg2wGUNv/XeOzD66EiXcbPnk/U0g/w+fJgiNwPNTS15igpT
         w4DpgiQeUDyLCZh/nE8qnWBtRBoQLBOWXX4ViL8lVRsWENlTikAv9oP00IlJ9EC3Qz/9
         R1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zeYMO6S95PVeGTfoyxNR76aAZjf7Y1iGkIH6FUXQn8=;
        b=XGWNwTUPiDNfjIjRsKCqLOfNH2IJeFhjq/LD+PgNSEDL/5JNbK8BNVh7srcGGUY/5+
         qpGmIaoO+zVAKZVmtN2gE7nJcAYtMrjZQSt1gBWGB8MCVDOKD5O3rFk3dk2l4MdrwYHH
         wePqJftjhOfFFs/EAT92xPim1+EDllPqydBo/PKVOK8DI5dXdSzdCiVtiWWYSZShQl8u
         5lz8FMAddlUBxt97ytmCTiWhIic4NhEYuHQ95pd8pfQ9LLrfq6xoDzFkAmVYLOC8dgIu
         iaLPOqvFNwd87tHujCqQgiNePgNYFvZmiiQ2NTT5vREIWyfvv/eFc5PXD3Mzj98+O+t7
         zd3g==
X-Gm-Message-State: ANoB5pkLgE6KALGe0OkU38+Nr4QHl5E9rtvTSWmFjqRkZPfn1zsXs7w6
        4oAHTAWLJr2Qf4EWZ3NmGsDqnA==
X-Google-Smtp-Source: AA0mqf4RLRwoE2W6vreNSnUadEWIj3OMyVQu8S8FIcdH1f3dKB0BMtIXD0h7hHk0eMYVnq1vc7D4eg==
X-Received: by 2002:a05:6512:3a87:b0:497:45e:4557 with SMTP id q7-20020a0565123a8700b00497045e4557mr19760801lfu.230.1669977590007;
        Fri, 02 Dec 2022 02:39:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p23-20020a2ea4d7000000b002799e629b09sm598381ljm.56.2022.12.02.02.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:39:48 -0800 (PST)
Message-ID: <640ad325-91c4-109a-5ccd-05ac653a29bb@linaro.org>
Date:   Fri, 2 Dec 2022 11:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 03/11] dt-bindings: clock: meson: add A1 peripheral
 clock controller bindings
Content-Language: en-US
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Rob Herring <robh@kernel.org>
Cc:     martin.blumenstingl@googlemail.com,
        linux-arm-kernel@lists.infradead.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        jian.hu@amlogic.com, jbrunet@baylibre.com, mturquette@baylibre.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        rockosov@gmail.com, kernel@sberdevices.ru,
        neil.armstrong@linaro.org, robh+dt@kernel.org, sboyd@kernel.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-4-ddrokosov@sberdevices.ru>
 <166995398331.2089708.18189499743713568568.robh@kernel.org>
 <20221202094940.elhjbz7tbgxesr52@CAB-WSD-L081021>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202094940.elhjbz7tbgxesr52@CAB-WSD-L081021>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/12/2022 10:49, Dmitry Rokosov wrote:
> On Thu, Dec 01, 2022 at 10:10:04PM -0600, Rob Herring wrote:
>>
>> On Fri, 02 Dec 2022 01:56:55 +0300, Dmitry Rokosov wrote:
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the documentation to support Amlogic A1 peripheral clock driver,
>>> and add A1 peripheral clock controller bindings.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>> ---
>>>  .../bindings/clock/amlogic,a1-clkc.yaml       | 65 ++++++++++++
>>>  include/dt-bindings/clock/a1-clkc.h           | 98 +++++++++++++++++++
>>>  2 files changed, 163 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> ./Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
>> 	expected: http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#
>> Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts:18.48-30.11: Warning (unit_address_vs_reg): /example-0/periphs-clock-controller: node has a reg or ranges property, but no unit name
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dtb: periphs-clock-controller: reg: [[0, 2048], [0, 260]] is too long
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-4-ddrokosov@sberdevices.ru
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
> 
> That's totally right warnings and errors. All of them are fixed in the
> my "fixup" patch of Jian's original dt_binding schema:
> 
> https://lore.kernel.org/linux-amlogic/20221201225703.6507-11-ddrokosov@sberdevices.ru/

No, this patch must be fixed. It's not correct.

Best regards,
Krzysztof

