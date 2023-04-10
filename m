Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95411C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 15:30:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjDJPai (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 11:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjDJPah (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 11:30:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E62830F4
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 08:30:35 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id qb20so12868539ejc.6
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681140634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Itkfx/SKWmTgvLKHAD1AdOCobJxj9e9oDbXIhOz5Grk=;
        b=Soklrh6KjQhWPbFfaBnFO5reP5hGWsaazUyTUoMePLaBh/KHj/BM2NMXEUvbGQzM4Y
         mul5E1svfxf+7g85Kpf5DWc2ug5mnF9wTntDKgl37P4tfS5PC09gC6M3drJmNHiYA+ek
         nLHQD77Gk4Ge4LusG7Wgg2layKERLzNbdfpW1C7s8DUpRcl1zTzN1Dzc9XLopAytsyPH
         y6QT2mDvRSuWNkCwnqpFvNY/PgknOVasHcfZzTLUdnta+zOrMBZ3vjctjVJGMkMjHKx0
         isGhGs2gB4rZFbUuNDKJIsO+LzlBLU9CCjciSE+lbJAwfwk5uT8YZb37Zf9m8CNZZWXK
         CEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681140634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Itkfx/SKWmTgvLKHAD1AdOCobJxj9e9oDbXIhOz5Grk=;
        b=LAmc95jLrdTav7cyywt7Fby5Bes3Xh51Lfv1IjS4ycae0ucPR6opLl56X8bTb/NX0t
         U3kfiz5YcuxKyU6AkUvuLX1bUd1Ah1M9X8TKA+GTcYZmqTVBGehwGnAcVxu+7n0RSwzM
         Blxwl9qnkgaH1Gw7zqSq3+WWG0mzrML0ExTrWhM0F88EZaXv96asCIdMJDVELodbCB3l
         kDLBBsbgI65n1EVMwJsHxmRLqQuQ8jREByCrNd0uQQfErDnetUUhtG3Kt1IYo5AHAYuF
         Ah6qf2/DvHWaL1CMnFwMwf76ZhMtbdO37IIM3AlvoIrF1kfuJXYrXPE70QOqq/EbJOe2
         Cxzg==
X-Gm-Message-State: AAQBX9c8gyzjmqudGfpoRm95POJ3hqI8CUiEbtCRQ9+a/UEAoVfeTur+
        Sd48J4KZuJSgnHlO+e6tAhNaDg==
X-Google-Smtp-Source: AKy350YOl6LmnKef1jR9aqU4sERFWWSnDuFwHk4cC7wGrdApNE4eG/tOeHTBsxeVq5DBEqq0wJL0AA==
X-Received: by 2002:a17:907:a395:b0:94a:6e08:fec5 with SMTP id se21-20020a170907a39500b0094a6e08fec5mr4377644ejc.29.1681140633994;
        Mon, 10 Apr 2023 08:30:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:eacd:ffa4:1df7:3870? ([2a02:810d:15c0:828:eacd:ffa4:1df7:3870])
        by smtp.gmail.com with ESMTPSA id s27-20020a1709060c1b00b009475bd8f441sm5168414ejf.60.2023.04.10.08.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 08:30:33 -0700 (PDT)
Message-ID: <92f8fa5c-7753-865a-83a3-2a53c2c3a8f6@linaro.org>
Date:   Mon, 10 Apr 2023 17:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/7] dt-bindings: iommu: arm,smmu: enable clocks for
 sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230406200723.552644-1-brgl@bgdev.pl>
 <20230406200723.552644-5-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406200723.552644-5-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/04/2023 22:07, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The KGSL iommu will require the clocks property to be set. Enable it for
> sa8775p in the bindings.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++--


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

