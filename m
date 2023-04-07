Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CBBC76196
	for <linux-clk@archiver.kernel.org>; Fri,  7 Apr 2023 20:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjDGURg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Apr 2023 16:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjDGURd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Apr 2023 16:17:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60474C66A
        for <linux-clk@vger.kernel.org>; Fri,  7 Apr 2023 13:17:22 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x17so55769973lfu.5
        for <linux-clk@vger.kernel.org>; Fri, 07 Apr 2023 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680898640;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1Dozau9Cfq9VYaMqEkVJAHlGg5EPFMV8ybCE21m3s4=;
        b=UolUM2z0Wpfky7Un5OucPfkBEOdsVm1Ssn36f5GawY6zPNERQejvKqaz6qgAipqlAa
         ot0uvIKN+3DbX643XKOk3diLo9BDHlUV8ssCmM8hkWRC3maxIH72tY5T/fdR4ti8We8/
         +adignQsho73jcfInhXv3Y1XLJS3xyN8pnY2ZEiHuoqqS4cyeHOyj93d7pqVpjdvxyop
         mI3T0Jt3WCeHTUrO08x7rO2/DFJ6MAPvYNfq5ICcmeHyh8k9EvWLK2tASVjXreNnITHj
         ZwsQZVxyPwmm34EjJbiiBoJS1aj77pSBSO3ZhkaFkRh+u1AEYQSXMxQ0vG2GBW4LITp2
         hyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680898640;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t1Dozau9Cfq9VYaMqEkVJAHlGg5EPFMV8ybCE21m3s4=;
        b=R5n6OfKpkjSR5cF3xTTJ37BZpzrMDY8vKG+cm7MFfcNXuVnByPV/I0jqKslB1IksOl
         tQjLbVv7qHX9KfSmBF6nu5ogV6jzg2Cl5eh06AOxf08yDpMJCwwy9zKME/CLijBT1P7I
         +ggCJo50pkl/F0cu+7EGLYX0QhJp/w4VLVmmkHic2TU1ghwbgP6INAockji3oYkiRh0B
         0zBc964WjpNm75/Md7Uz9TBjSaq6m1/kFYo0pgtHC6AmkXbsUmbSqnTfLoWORtVzpxDN
         lO/LSC/MtQJaxKsIoDKzLWJKkt13YBKO7cUNQw4gp10eeoVyTZjWvSK7H6oSU21QDcj/
         J/IQ==
X-Gm-Message-State: AAQBX9eP4nsoMepbF+yHtfB2IYZd3jDexPphXA6zYHGlX/z8n73i7pz1
        R79EZ/py8cjWdC9iTBGAngaRxw==
X-Google-Smtp-Source: AKy350Z2JIekhTaqs1ClXrFa4SIlxWK9pWuzvd4Kdy8PeMZb0+IMYtMfKBSGlsY6ENxMpNpmx3raUg==
X-Received: by 2002:a19:7418:0:b0:4db:3a92:2c85 with SMTP id v24-20020a197418000000b004db3a922c85mr761822lfe.67.1680898640661;
        Fri, 07 Apr 2023 13:17:20 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id w1-20020ac24421000000b004eb51cf49d0sm854624lfl.306.2023.04.07.13.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 13:17:20 -0700 (PDT)
Message-ID: <422abc8b-5c01-238b-7793-212597dbffc8@linaro.org>
Date:   Fri, 7 Apr 2023 22:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 01/14] dt-bindings: clock: qcom,rpmcc: Add a way to
 enable unused clock cleanup
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
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
 <2a379401-fe87-9e30-5449-513dd23c52f5@linaro.org>
In-Reply-To: <2a379401-fe87-9e30-5449-513dd23c52f5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6.04.2023 16:44, Konrad Dybcio wrote:
> 
> 
> On 17.03.2023 19:20, Stephen Boyd wrote:
>> Quoting Konrad Dybcio (2023-03-16 17:31:34)
>>>
>>> On 16.03.2023 23:58, Rob Herring wrote:
>>>> On Wed, Mar 08, 2023 at 10:35:17PM +0100, Konrad Dybcio wrote:
>>>>>  
>>>>> +  qcom,clk-disable-unused:
>>>>> +    type: boolean
>>>>> +    description:
>>>>> +      Indicates whether unused RPM clocks can be shut down with the common
>>>>> +      unused clock cleanup. Requires a functional interconnect driver.
>>>>
>>>> I don't think this should be QCom specific. Come up with something 
>>>> common (which will probably have some debate). 
>>> Generally the opposite (ignoring unused clocks during the cleanup) is
>>> the thing you need to opt into.
>>>
>>> I can however see how (especially with the focus on not breaking things
>>> for older DTs) somebody else may also decide to only allow them to be
>>> cleaned up conditionally (by marking the clocks that were enabled earlier
>>> as enabled in Linux OR not addding clk.flags |= CLK_IGNORE_UNUSED) as we
>>> do here.
>>>
>>> Stephen, Rob, would `clk-disable-unused` be a fitting generic property
>>> name for that? Should we also think about `clk-ignore-unused` as a
>>> clock-controller-specific alternative to the CCF-wide clk_ignore_unused
>>> cmdline?
>>>
>>
>> There are multiple threads on the list about disabling unused clks.
>> Moving the decision to disable unused clks to a DT property is yet
>> another approach. I'd rather not do that, because it really isn't
>> describing the hardware configuration. If anything, I'd expect the
>> property to be describing which clks are enabled by the firmware and
>> then leave the decision to disable them because they're unused up to the
>> software.
> After some more thinking, I realized that this could be made opt-in
> simply with driver_data..
> 
> WDYT?
..on a re-evaluation, obviously not a great idea.. Old DTBs will not
be happy about that.

Konrad
> 
> Konrad
