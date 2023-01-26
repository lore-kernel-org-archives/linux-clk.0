Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1611EC54EAA
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 09:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236936AbjAZJcD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbjAZJcB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 04:32:01 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E0C1258F
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 01:31:58 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h16so1087214wrz.12
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 01:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6SEUgOOLVttkjjyygG5mdkiQxsZy5JbV8mD91QaKQE=;
        b=QP6ZJaMSEwt3iT86IvkEkbU/MyVarBbGtLBV9NhNfsC02Ke2CfA9YLvM7caC0p2/pB
         gBJckIOpkYJsCRDx0eh19/J2RQRGKU6m6J9218NUX9Y4UXzmymgkPImQ+QpGc0t2qfPX
         Qqfa8bski53LX9/fzwOCPyqgxinPQ59WWCFTTEtbdaF87ITslN1RDsF0Cd5SSJ2p5rao
         RmtRxXX5fifr3psVVGnPkGEMdB3nAbEpLBGjMxtpHtJ3X48k7aIc4zrPEn5whpAuQ3YN
         Utbwz1gHkUEJtDJ/9WBHvjjinoJpyOwdruaXCwjK+/YOiOEM+O86bI+CzZkzQmaWLgPg
         yIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6SEUgOOLVttkjjyygG5mdkiQxsZy5JbV8mD91QaKQE=;
        b=kQMR1JMm7pKxeGHJVE0G5Y4MA5yv88hwwxSA9kARnQgPXp83kKH8trHqPKpouIjh9v
         MdkKouFWdw4CH8h7gtJ7S5Vj0ggBmJ2SymPsNojfhf+gZrf39im9Nix7TkAM6zoO17dy
         zwp7xxl8JfulcXYaHONoh14fXWd4ylo2JbmkZdG3pKMzn+wPeUl42SygTTovMg0SmzCu
         sjrKnwZWyWflFt4IE4Yd54Qe961J7ISc2c7Shfmu2Kjh3ciPzCFpESCR30OgR3HJ8Dag
         25YA/KfmNejkF6Q2sbZ1+p/myv6r8Wngzg7vxVHm78Wjl03S6JPBG6+EuClT+s1PPMZo
         Ar/w==
X-Gm-Message-State: AFqh2kpxVcHXzFHx3x7rWQYlWyuRqzOpcS2svo2RqtFMszigC+k97T5T
        pM46Y7nEHuJCQitUjNO7G3/JDA==
X-Google-Smtp-Source: AMrXdXu7j8rVDCIiqdsIyxSIbSHnAzH5HwyI7HwoZdj65P+j8DAIwfYwY/edM2IqHVLIM4GnY9EMuw==
X-Received: by 2002:adf:e109:0:b0:2bd:de40:21f9 with SMTP id t9-20020adfe109000000b002bdde4021f9mr26538982wrz.61.1674725517439;
        Thu, 26 Jan 2023 01:31:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e4-20020adfef04000000b002bded7da2b8sm754023wro.102.2023.01.26.01.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 01:31:57 -0800 (PST)
Message-ID: <febd59ed-ff7b-ffc4-5568-d856703c9123@linaro.org>
Date:   Thu, 26 Jan 2023 10:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] clk: qcom: restrict drivers per ARM/ARM64
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
 <20230123094925.54824-2-krzysztof.kozlowski@linaro.org>
 <7ddf5c74de84c5dc291996423cb1eb46.sboyd@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7ddf5c74de84c5dc291996423cb1eb46.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/01/2023 21:44, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-01-23 01:49:25)
>> There is no point to allow selecting pin-controller drivers for Qualcomm
> 
> pin controllers?

Copy-paste, I'll fix it.

> 
>> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
>> kernel configuration more difficult as many do not remember the Qualcomm
>> SoCs model names/numbers.  There won't be a single image for ARMv7 and
>> ARMv8/9 SoCs, so no features/options are lost.
> 
> Are the drivers used in arm32 emulation mode on these SoCs? I recall
> there are some SoCs they run with the arm architecture.

I did not add it to the few SoCs which have upstream DTS in ARM and
ARM64. I added only to the ones which are in one specific folder. Also
my patch does not affect defconfigs (qcom_defconfig and arm64/defconfig).

Whether downstream could be affected, I do not know. Anyway, what's
downstream it's the downstream's problem...


Best regards,
Krzysztof

