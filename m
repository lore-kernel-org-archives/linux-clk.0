Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1956EC77B71
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 14:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239208AbjDFOpq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 10:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239285AbjDFOpa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 10:45:30 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C40AD3A
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 07:44:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x17so51189816lfu.5
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680792272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEzI51ciZrgIncfhw5bsm8CrnZlchCYmEqfodjJXk5A=;
        b=MHGsl5pAsYot9e+osKLnMyXGsWxprs2n2YzElSZZv1aoMVEJcw+5DmKy264jhyL0w9
         iGMyTkBGY/7zmg5i+l8jGz/O8k86LUS1iqtzTermHmOOaWocancJZj9Wk/ev1vbzosmD
         lUM4+Re/DHufKHQJXpxJOgrs38hLD8jwTDlp/4ND/0GjqsmraWIBJ/LSCF+QomJllpl2
         ZuJ2Du2FMBRCMqkawg21IaCYMTWFHfO83AlTtqnfmhlB25ickb5ziN/oHDXUZOJjJMVS
         pj7cPkun6F+3bKbsmLyfxP26IxYRU/D8sVaWDCplTUiHFtAcryZArkMlOql/0piopdqF
         ICwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680792272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEzI51ciZrgIncfhw5bsm8CrnZlchCYmEqfodjJXk5A=;
        b=b0UXSpDWT9Y3m1flGdC3CU7q1FwsIn+sOwlMawb88AOipnqYuwGN+jNamX1doBQPfl
         7iZ6zjjZceoRVDSZ89w3Ur6otNbgk8JQ1s1sgCv4zH1croDlB3tXQKpY7Vsv2JIn30iV
         PomA39Z+8Z3B2YgejZBU6JVk413cid9rnzXRjpADDlEAg+G87DxbOTYhun8exO4BuF49
         SZuPRsODeyosMkSi+k64YUSjBsm+97dQPWVONkq8IafkxgYkZJu3MZg7mMAd0+vUH0TP
         P5Zozd+KgXCg0Y90SRXs1X3QkO4r/ypZouXoDWozaNx8NjCR1ZSgCmEL9VRWlivo2nv0
         DOCg==
X-Gm-Message-State: AAQBX9epA8+pyAtoU3gHfW3L6e+lZHHlu7pfc5LPigY3ROKy35V603kJ
        J619+Q3FdUlsxeUJpJrKtG4Cbw==
X-Google-Smtp-Source: AKy350bgBhHXkKVdgwxsnJCnlU8McRMzVeEfNKkTmL+OwJoS3L2ugnZcDbPKs2h/5yE6WPVb752TEA==
X-Received: by 2002:ac2:5dd1:0:b0:4eb:79:fa5 with SMTP id x17-20020ac25dd1000000b004eb00790fa5mr2839908lfq.25.1680792271873;
        Thu, 06 Apr 2023 07:44:31 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25447000000b004eb4357122bsm287925lfn.259.2023.04.06.07.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 07:44:31 -0700 (PDT)
Message-ID: <2a379401-fe87-9e30-5449-513dd23c52f5@linaro.org>
Date:   Thu, 6 Apr 2023 16:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 01/14] dt-bindings: clock: qcom,rpmcc: Add a way to
 enable unused clock cleanup
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-1-ae80a325fe94@linaro.org>
 <20230316225803.GA4036689-robh@kernel.org>
 <62533d5a-f39a-0806-b4d9-932e2af6beef@linaro.org>
 <5601e0edc19dc03d0fc516f9ffe4d1aa.sboyd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <5601e0edc19dc03d0fc516f9ffe4d1aa.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.03.2023 19:20, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-03-16 17:31:34)
>>
>> On 16.03.2023 23:58, Rob Herring wrote:
>>> On Wed, Mar 08, 2023 at 10:35:17PM +0100, Konrad Dybcio wrote:
>>>>  
>>>> +  qcom,clk-disable-unused:
>>>> +    type: boolean
>>>> +    description:
>>>> +      Indicates whether unused RPM clocks can be shut down with the common
>>>> +      unused clock cleanup. Requires a functional interconnect driver.
>>>
>>> I don't think this should be QCom specific. Come up with something 
>>> common (which will probably have some debate). 
>> Generally the opposite (ignoring unused clocks during the cleanup) is
>> the thing you need to opt into.
>>
>> I can however see how (especially with the focus on not breaking things
>> for older DTs) somebody else may also decide to only allow them to be
>> cleaned up conditionally (by marking the clocks that were enabled earlier
>> as enabled in Linux OR not addding clk.flags |= CLK_IGNORE_UNUSED) as we
>> do here.
>>
>> Stephen, Rob, would `clk-disable-unused` be a fitting generic property
>> name for that? Should we also think about `clk-ignore-unused` as a
>> clock-controller-specific alternative to the CCF-wide clk_ignore_unused
>> cmdline?
>>
> 
> There are multiple threads on the list about disabling unused clks.
> Moving the decision to disable unused clks to a DT property is yet
> another approach. I'd rather not do that, because it really isn't
> describing the hardware configuration. If anything, I'd expect the
> property to be describing which clks are enabled by the firmware and
> then leave the decision to disable them because they're unused up to the
> software.
After some more thinking, I realized that this could be made opt-in
simply with driver_data..

WDYT?

Konrad
