Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D626C77B72
	for <linux-clk@archiver.kernel.org>; Thu, 20 Apr 2023 10:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbjDTKWJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Apr 2023 06:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbjDTKVg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2023 06:21:36 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3C44C05
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 03:20:43 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q21so2273084ljp.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681986042; x=1684578042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4p+Jwfh4f6O4EpesT7nZbdGy3tVSOOPuyRDN6YS6gs=;
        b=EAwDI9yyVDLLbl6cAmcIwJbwcp8ZpDiZ7blcuGT4r1FqsctbdaZ4XrGUljVnifY3Zn
         Gndd3JpvtkoUpNJkkB37SgCfPDPh3+TTL6sH3TGYYmTp99MHNg1Q5KxI+eItbzsIWlRv
         UDveXKcjkTTPp4ZqP0Hx+0XrHpoNUfoJDi/J2NinFWQ1GW19KdEjHhm80L9X4DW/rc1j
         eFWJVxxL9lI1ylb4JevgcquIYmeSA+0qUBd/wWCniICejXyZTJVK4RLwiUlHvueh+dUa
         W/ST1rGntxJ+10N1r1mCsoT4xsmxNi34U/nXKOmhH6O6HRePbYTO9OLzUdPrQjc+Oq84
         5BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681986042; x=1684578042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4p+Jwfh4f6O4EpesT7nZbdGy3tVSOOPuyRDN6YS6gs=;
        b=H9dI59OzTVshvuW3utEY1CryDYFaXEG+Wg4iFieW4RPk+PhBQR+bomWPxoowt05n8i
         ix5XDWckgvTYPqy7FOXqCzcTbBBKTpfm8BlPTGxJciFEQxYX6iLtGXMiKlbZfbNA5Jo3
         J+kEKkLWRubyMXrfiVWEh1xR84MR8iDCzJKYisTZPDVhOqehy9718m1OvJasoGUv97op
         YR69WjZZYJasEweXat7QIbcYq/mUB45DUxcUWeaPSEMkt7Zlo82SbC7wATnt8IJJ+kjD
         Gix2Dgwv9kKkAk2dCou1cuyHqkLIaxCyVW1gM5+AqlDxv2lLXH3ALUWPU1tqACi/yLju
         sPPg==
X-Gm-Message-State: AAQBX9ccqvHqFd7Q5c1Y74BKMGb3kR7uk3yIGPHzi3rFoN4u1SanSXtB
        uwx9/7ZhhR0GEGS+PtpMd78tYQL8/Bfg6vOFPdc=
X-Google-Smtp-Source: AKy350YWnFordrnmpiF7wIFWOYpQ/eTVAH3HUoCFwHRfS6GXxx1v6PZoYzAu8N/3JQL6nqKGub3QJA==
X-Received: by 2002:a2e:9895:0:b0:2a8:bc05:1d7a with SMTP id b21-20020a2e9895000000b002a8bc051d7amr258934ljj.30.1681986042057;
        Thu, 20 Apr 2023 03:20:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id n3-20020a2e8783000000b002a8e4678da4sm186778lji.139.2023.04.20.03.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:20:41 -0700 (PDT)
Message-ID: <b9b6e799-c8a2-7d8c-4d87-56d899048454@linaro.org>
Date:   Thu, 20 Apr 2023 12:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 00/14] SMD RPMCC sleep preparations
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <66c41caf-bf21-61af-c6e4-52b34b69c1ce@linaro.org>
 <ZEDwLB3RwT6mHIu4@gerhold.net>
 <6175f709-8c88-6ec3-4c31-cac9f2440b52@linaro.org>
 <ZEEOJ7VhccqCNTbj@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZEEOJ7VhccqCNTbj@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 20.04.2023 12:04, Stephan Gerhold wrote:
> On Thu, Apr 20, 2023 at 11:36:24AM +0200, Konrad Dybcio wrote:
>> On 20.04.2023 09:56, Stephan Gerhold wrote:
>>> On Thu, Apr 20, 2023 at 03:50:16AM +0200, Konrad Dybcio wrote:
>>>> On 8.03.2023 22:35, Konrad Dybcio wrote:
>>>>> Keepalive clocks for other platforms were gathered by digging in old
>>>>> downstream kernels, please give them a test.
>>>> I have an implementation of rpmcc-within-icc ready(ish) locally. Turns out
>>>> some SoCs need a keepalive (19.2MHz, active-only) vote on clocks that
>>>> are NOT governed by interconnect.. So before we can disable clocks,
>>>> both will need to be implemented.. ugh... I was hoping we could avoid
>>>> having it in rpmcc..
>>> Can you give an example? Which clocks are affected on which SoC?
>> msm8998/sdm660 and PNoC
> 
> I don't see a PNoC for 8998/660, do you mean the "cnoc_periph_clk"
It's the same, but Qualcomm kept changing the name every kernel
release, so that's why we have 50 defines for the same thing
upstream :(


> downstream? Like the other NoCs it seems to be a RPM_BUS_CLK_TYPE, which
> means it does fit best into interconnect in my opinion. From a quick
> grep I don't see any usage of it in msm-4.4 downstream other than the
> active-only keepalive vote. So maybe you could just send that vote once
> in icc_rpm_smd and then ignore that clock (don't expose it at all)?
Hm, perhaps that does sound like a good idea! As far as I understand,
it's governed internally.. Older SoCs had a separate PNoC fabric
exposed.

Konrad

> 
> Thanks,
> Stephan
