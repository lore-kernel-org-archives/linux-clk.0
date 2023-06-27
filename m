Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DA7EB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jun 2023 12:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjF0MNV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jun 2023 08:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjF0MNT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jun 2023 08:13:19 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C291999
        for <linux-clk@vger.kernel.org>; Tue, 27 Jun 2023 05:13:18 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so906608e87.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Jun 2023 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687867996; x=1690459996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FR5rzArc9VADnvY1rG5yKtlG15Q5l959I+GAPWhUE9c=;
        b=gLvNtTPACbA5Bl4vEPMFbdQW/4hvOyF3pp/00a3lZqzewn6UU2dmOwuvdB7efmlGTY
         6gi1ETMvzUb2Y4ey8rr+8cARws6uq/1S/06Ee73HjWwQ1tw95DQwI9i7CpCoIUULajbC
         4PXRm/qbEzGYJzLBTOWm2hlb5+QbKrquQsJzWBs3e6YtpSowtaH8NfJCV39V6FiRvAyK
         q+1654Gp4FlP+qoJ8kF0uaK6CEfcz4l3t7DDYA79nm7/4KAgouG1JmibpnZ/Gjy69tae
         dn+N46NnrP8iXGIgiwg+rC3aWnMefH2ysCGdEBoQpX5XthsUr3beSathItyVEy0NUN8b
         a2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687867996; x=1690459996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FR5rzArc9VADnvY1rG5yKtlG15Q5l959I+GAPWhUE9c=;
        b=k/Jj6vNmbDx2GJEtkcdM9wchiNGRlOBcgYWup1zDs+KTqq8Yi7NYs7ozTVHDRBJZjx
         RO6WALLi8Lso0sVe81KYma9D4UrOmYNXcB8ydR9sWtenUs5HzRvyGMRj/aHwyhZMxsqn
         nZbmrBfqNJIxwlPqBBTpFx813s2+q7cJWxdAu83uin2K+MLUlsMGxUg0sRqXcXp8IjFy
         JGMyJuokbuQ1EawMOZ1zI0tNAIMzUeu1B4zieZ9xU5a7Qv+/RuADFElKd5E2eNzEqDex
         sk1yrpDwdKXEW95VfwzXyTTyPtEX6s0q0Dnw0lt9g+a57AguJngTlHXhV+ao2VuT/qA0
         0shw==
X-Gm-Message-State: AC+VfDxfeNfn0TlM0tPEVyeZu+gvgl4BowtpYbVhcXtbqQA570fpz9mS
        j5eTwgx3dkVSB8WeezQR4fcnLFSfP6qgnlOQMok=
X-Google-Smtp-Source: ACHHUZ4q34rv+txfjWN8Rc7eKRSQSIsPu5VMHaAfloViYeJaxh5TBKafuQ+6KBcliQ7vPgFAQWYwvQ==
X-Received: by 2002:a19:4409:0:b0:4f8:7556:23e6 with SMTP id r9-20020a194409000000b004f8755623e6mr13534815lfa.54.1687867996549;
        Tue, 27 Jun 2023 05:13:16 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id j2-20020ac253a2000000b004fb2c1e33b3sm1119853lfh.243.2023.06.27.05.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 05:13:16 -0700 (PDT)
Message-ID: <8217b8db-cd27-185d-c6b5-e32009202c21@linaro.org>
Date:   Tue, 27 Jun 2023 14:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/26] ARM: dts: qcom: apq8064: add simple CPUFreq
 support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-18-dmitry.baryshkov@linaro.org>
 <0f139da8-ae01-fc28-d14c-0ea207cf760e@linaro.org>
 <2232c6e7-cbca-30c1-9ec5-1cea7f759daf@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2232c6e7-cbca-30c1-9ec5-1cea7f759daf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26.06.2023 21:49, Dmitry Baryshkov wrote:
> On 26/06/2023 19:40, Konrad Dybcio wrote:
>> On 25.06.2023 22:25, Dmitry Baryshkov wrote:
>>> Declare CPU frequency-scaling properties. Each CPU has its own clock,
>>> how
>> however?
> 
> yes
> 
>>
>>> all CPUs have the same OPP table. Voltage scaling is not (yet)
>>> enabled with this patch. It will be enabled later.
>> Risky business.
> 
> But it works :D
On your machine ;)

[...]

>>>   +    kraitcc: clock-controller {
>>> +        compatible = "qcom,krait-cc-v1";
>> Are we sure we don't wanna rework this compatible? Check the comment in
>> drivers/clk/qcom/krait-cc.c : krait_add_sec_mux()
> 
> I remember that comment. I'd rather not introduce another compat string for such old hw. Would there be any direct benefits?
> 
I'd say that the one we have here never made much sense.. Perhaps (since
nobody used it for 10 years) it would make sense to remodel it..

Konrad
>>
>>
>>> +        clocks = <&gcc PLL9>, /* hfpll0 */
>>> +             <&gcc PLL10>, /* hfpll1 */
>>> +             <&gcc PLL16>, /* hfpll2 */
>>> +             <&gcc PLL17>, /* hfpll3 */
>>> +             <&gcc PLL12>, /* hfpll_l2 */
>>> +             <&acc0>,
>>> +             <&acc1>,
>>> +             <&acc2>,
>>> +             <&acc3>,
>>> +             <&l2cc>;
>>> +        clock-names = "hfpll0",
>>> +                  "hfpll1",
>>> +                  "hfpll2",
>>> +                  "hfpll3",
>>> +                  "hfpll_l2",
>>> +                  "acpu0_aux",
>>> +                  "acpu1_aux",
>>> +                  "acpu2_aux",
>>> +                  "acpu3_aux",
>>> +                  "acpu_l2_aux";
>>> +        #clock-cells = <1>;
>>> +        #interconnect-cells = <1>;
>>> +    };
>>> +
>>>       sfpb_mutex: hwmutex {
>>>           compatible = "qcom,sfpb-mutex";
>>>           syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
>>> @@ -933,6 +1100,9 @@ qfprom: qfprom@700000 {
>>>               #address-cells = <1>;
>>>               #size-cells = <1>;
>>>               ranges;
>>> +            speedbin_efuse: speedbin@c0 {
>>> +                reg = <0x0c0 0x4>;
>>> +            };
>> Newline between properties and subnodes & between individual subnodes,
>> please
> 
> ack.
> 
>>
>> Konrad
>>>               tsens_calib: calib@404 {
>>>                   reg = <0x404 0x10>;
>>>               };
> 
