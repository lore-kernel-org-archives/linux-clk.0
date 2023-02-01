Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0C0C38142
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 07:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjBAHNL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 02:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjBAHNJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 02:13:09 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2546593
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 23:12:56 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso648383wms.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 23:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1ANA5jda8hFhcW4wnuhHBQ5QsoIx/N9i5+azSVQIkU=;
        b=M6OJJINqma4xgknx3I/nC4W9w151opMzVhdYx6xn7a3FJeWyXCJ2yazFr2n32Ukg3m
         XiZNLijbZOe+aM+QnPVgOxumcZMgbEz3yF6/ldMBw+K8g5NN8sBoZG6T661Kg7w/sw5S
         wDo/SQzg+mB3hStOoEU/G1AlKTOUUMQsv0IVcdPI+ShfFi51kPrRvBQ5j84dgMAWSkjR
         bOg6PVzjLAL9YjenFUXNNrVr7UCuF00jkttT0wKLPYrDhk0GM7UdCQGHNqe01axDp7r0
         c1gOx2bsvoH33tG4Szeo3C244Vqif9ZyOPNU3ijylK+HzPkQ7wX21AGgG2YCwjRcReY5
         PUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1ANA5jda8hFhcW4wnuhHBQ5QsoIx/N9i5+azSVQIkU=;
        b=fktVB0OqgDs/LpLV5iTpbhIDR8T+eR12ue49i7RZNtrdvzkOOfyZEjKyj81xebOwzu
         W0WcjBZGrZ1Cfw/IMtcz0js+Iw45RosYLWJqCD6DcQLQd8N3SWOoJ4YR7yD3vHjo3bPx
         bTFjAqwOMUimMLYzFwtavkj3sYt35w4khJhPgZaDw3jjqooYXeorRKGEcSnAIDzqPOCP
         /rD0fNhCp4eRy5W9E//TzWiu7mR13hoT3WPhA8aJP+0zG2/cyD5VDr2yjKN2WVxKNUR6
         EQvrodv/F8nUZbQN+IrY+2zgX89kzOeVv0EBeJvo11CScA7ZUwWYiUxsBrajiFIeoJrV
         5NKw==
X-Gm-Message-State: AO0yUKV+/dU6n+PbVM2c4qioxaxLrLlWdAlM+jGqS8y1swS9wLriIMNa
        5xt2AqV+aNV8SpAJ7mH1pM5f1w==
X-Google-Smtp-Source: AK7set+Bz41PE69KS57pMdkk25+IOxAaTcAgby/+xCIuMuMjNQAsuRVtWW4rTj8y7Kx5D5XLGP7gGw==
X-Received: by 2002:a05:600c:2b46:b0:3dc:4aa6:a8a9 with SMTP id e6-20020a05600c2b4600b003dc4aa6a8a9mr637330wmf.7.1675235575138;
        Tue, 31 Jan 2023 23:12:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b003db09692364sm849921wmq.11.2023.01.31.23.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:12:54 -0800 (PST)
Message-ID: <bced492e-08f3-90d9-4ca0-41ab0e4cca9d@linaro.org>
Date:   Wed, 1 Feb 2023 08:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] clk: qcom: restrict drivers per ARM/ARM64
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
 <20230123094925.54824-2-krzysztof.kozlowski@linaro.org>
 <7ddf5c74de84c5dc291996423cb1eb46.sboyd@kernel.org>
 <febd59ed-ff7b-ffc4-5568-d856703c9123@linaro.org>
 <9367139a425dc7e4811c757b62f33a4e.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9367139a425dc7e4811c757b62f33a4e.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/01/2023 00:30, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-01-26 01:31:55)
>> On 25/01/2023 21:44, Stephen Boyd wrote:
>>> Quoting Krzysztof Kozlowski (2023-01-23 01:49:25)
>>>> There is no point to allow selecting pin-controller drivers for Qualcomm
>>>
>>> pin controllers?
>>
>> Copy-paste, I'll fix it.
>>
>>>
>>>> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
>>>> kernel configuration more difficult as many do not remember the Qualcomm
>>>> SoCs model names/numbers.  There won't be a single image for ARMv7 and
>>>> ARMv8/9 SoCs, so no features/options are lost.
>>>
>>> Are the drivers used in arm32 emulation mode on these SoCs? I recall
>>> there are some SoCs they run with the arm architecture.
>>
>> I did not add it to the few SoCs which have upstream DTS in ARM and
>> ARM64. I added only to the ones which are in one specific folder. Also
>> my patch does not affect defconfigs (qcom_defconfig and arm64/defconfig).
> 
> Cool, thanks for checking. Is it possible to take a dtb from arm64 dts
> directory and boot it on an armv8 CPU running in 32-bit mode? Just
> wondering if even having the dts file exist in the arm64 architecture
> really matters here.

If DTSI (and/or board DTS) is in arm64, you still need DTS or a link in
arm directory. If such one is added, then the restrictions here can be
removed. Have in mind that I did the same already for pinctrl.


Best regards,
Krzysztof

