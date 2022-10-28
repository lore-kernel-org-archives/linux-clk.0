Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C1CECAAA1
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 11:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiJ1LnJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Oct 2022 07:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiJ1LnI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Oct 2022 07:43:08 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8191D29BE
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 04:43:07 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id n18so3849755qvt.11
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pa4o10V2uYugUVoKqq6yjjDg+mNOr/BQAbRwWBsPRtM=;
        b=JX5M/+/2HWQ10e3W0WLl6CWzXoXlie2tjB4pKMvJdcii+roJFGtinwIaklhaF6DUKG
         OtSpXZg6xjI5Hpvsu3ORDq4Zetq4sDRcnd3G4GMJY0Y7YH1MCPx6YRwYrg4f6k4NejnF
         FJRWrWznSuAuIbRVkpImnS2kfGrAoLFtFeZonvM0hrOGVGQNcmb8+N2p+Uhfq9cP0VeC
         23his/m8b4sUZUqewSRIGGC3/A0+ixueVylCLnWZvFQb4rvpKLC6J3OrC7okwU/IIfxY
         cE48yUVCtlF0HhCUeuiiN4YP87VEqgKai3EO3eU9Lw3YiaZH4/v+hrc8M8yHTVYxsRxT
         Xwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pa4o10V2uYugUVoKqq6yjjDg+mNOr/BQAbRwWBsPRtM=;
        b=T/sczGJeevEUS7q0bFLa3ImFHb7mtwPROe7JXpcNYZEWa17pNIiwrs6vfbsMFkO3aI
         crdWepGsFrPXDWDJw+LxdaVlZwMj1ri00IbCXlQ201n+J0tmyZIk7u6HJnkVFWhbNBJt
         PlwHsyMVhhSAiCyf+Frs6lOWwb1arUK/i/TW+7fc15aYUCtt639nPjQ4LQVa82RhQXhj
         8GTKFRuXSeQXkn7m65TjPgJoNginYELoyouFAwiwZCPz1/P+h/157Db1EETyUn0EL5Lc
         hTerKENkM1OvHSwFoUJFM3yv8V4yEMr4wutMTi+j3WSO/e/ZkdnFpffdVEagA5ShnpJG
         KQeA==
X-Gm-Message-State: ACrzQf0sG05O0vzdBX8tS1r4yXrFuOhiJWkHaif0VP9mJiNJEdg2r+8o
        0zowV561oHlb3Kg9hC9T33wOmeXVhrrLcw==
X-Google-Smtp-Source: AMsMyM7bghuS9h/0jCAZoW8otuRB7+u3RvPRMdDpIVdgW6VfT6Pm7FaGmGBHKMiy1B/XHwmLyL6kHA==
X-Received: by 2002:ad4:4ea2:0:b0:4b7:e8a3:e043 with SMTP id ed2-20020ad44ea2000000b004b7e8a3e043mr36526888qvb.34.1666957386382;
        Fri, 28 Oct 2022 04:43:06 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q11-20020a05620a0d8b00b006ee9d734479sm2776093qkl.33.2022.10.28.04.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:43:05 -0700 (PDT)
Message-ID: <01a38c4c-b42a-c170-3c3d-0b7e087bfaa4@linaro.org>
Date:   Fri, 28 Oct 2022 07:43:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: add loongson-2 clock include
 file
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20221028025504.13247-1-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028025504.13247-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 22:55, Yinbo Zhu wrote:
> This file defines all Loongson-2 SoC clock indexes, it should be
> included in the device tree in which there's device using the
> clocks.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Change in v5:
> 		1. Replace loongson2/Loongson2 with loongson-2/Loongson-2.
> 		2. Replace soc with SoC.
> 

Where is the rest of the changelog?

Best regards,
Krzysztof

