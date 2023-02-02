Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFA2C05027
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 18:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbjBBSmt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 13:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbjBBSmq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 13:42:46 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1677C31B
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 10:42:23 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id n6so2969742edo.9
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcrcjjpdxvOP+BtTWSce/AMhT/iVFENiab+a0FrVMNY=;
        b=Zq5rgzbS0KG7vA/hbRRwx8FMDWWoH+HMBofRc4RXhyH0JA+vo6cspQgeCOg073eYLg
         JVW4O5Bl/vJP3zPtG8mBj2EZtEYdo2G712RAmmWCMto+zmX548hNamQBkmvM8GIwR7HN
         Yf+2rVtyxzoy/6lYE8A/UbCTYq/HEG8ikcN1wUwtJ9AZNa1KpvppyWt654JYu1FMWP/C
         HFGHb4C/P7dKZea/6an8hJz5BD85sgieJvm2Wv+6jomVI2gDarS1uxf0S5Ep145pWYQR
         HomCcXEv8RjLDmdQbP3OrURKPLdOhIOaRxvZQG6iEqeG6Y/5p9h7hbqsSncnyUP+1qmw
         scww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcrcjjpdxvOP+BtTWSce/AMhT/iVFENiab+a0FrVMNY=;
        b=t7JOzwYHDcZglknu1vovuDm1NfbA4AzruIDDcD0b8sTVIE+sCkWxn7+AtaXsMkcIdP
         rmMSZgnJDe+UKzPlJI77P+QLDu/LFZ8Mk/ueK0DJF3x0B0sqyOYE09+CvuV1EEz6rTsP
         vgF/XRIwiRYZPzX27++lgQEuVfFgiVHUr+QURicgg+7x6SBh0h8KTrIvvCHthubyKtdn
         tRhQzL3C/60GoO10TbjbwVfTpbEnJgUPLvY/FLKhM2ds2LeoevoTnfjdKV+MfcU32THx
         8mFXwI1T9xL2oWhiiyxC9VDcJNIaFiTcAxUKN1xpudxALX9Sik4x0i4YWn/VX10y9g6q
         i5XA==
X-Gm-Message-State: AO0yUKULPW1dR0W/SnUAmIlSBhzeFWLzxXwrHEgH1aXnuq3guWY+i4OW
        HQj9kHKQUFdGUFD6z/0DAyJR/9lEedZD0IF/
X-Google-Smtp-Source: AK7set9QtIgxHBGYAaFywJ96klO+lAs7/+Uzw91KAaSUtY2UwhASS1NxneJienf7Xi743nxWcj9h6g==
X-Received: by 2002:a50:ce47:0:b0:4a2:45e3:ede3 with SMTP id k7-20020a50ce47000000b004a245e3ede3mr7384955edj.14.1675363334632;
        Thu, 02 Feb 2023 10:42:14 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id eq6-20020a056402298600b00497d8613532sm81243edb.5.2023.02.02.10.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 10:42:14 -0800 (PST)
Message-ID: <406e91ae-5477-4d8e-4e98-b30fc18e9e94@linaro.org>
Date:   Thu, 2 Feb 2023 19:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/6] mailbox: qcom-apcs-ipc: add IPQ5332 APSS clock
 support
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-6-quic_kathirav@quicinc.com>
 <2433c2c7-664d-0d1f-12ae-374cbd093dc0@linaro.org>
 <1b75ab1a-44c9-c4a8-7fa4-d601fc710d2a@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1b75ab1a-44c9-c4a8-7fa4-d601fc710d2a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2.02.2023 16:30, Krzysztof Kozlowski wrote:
> On 02/02/2023 16:16, Konrad Dybcio wrote:
>>
>>
>> On 2.02.2023 15:52, Kathiravan T wrote:
>>> IPQ5332 has the APSS clock controller utilizing the same register space
>>> as the APCS, so provide access to the APSS utilizing a child device like
>>> other IPQ chipsets.
>>>
>>> Like IPQ6018, the same controller and driver is used, so utilize IPQ6018
>>> match data for IPQ5332.
>>>
>>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>>> ---
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> While this is not the fault of this patch, but we keep adding
> compatibles with same driver data. I think this should start using
> fallbacks at some point...
Fair.

Konrad
> 
> Best regards,
> Krzysztof
> 
