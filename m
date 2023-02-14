Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075D5C05027
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 09:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbjBNJoT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 04:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbjBNJoS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 04:44:18 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA62CDEE
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 01:44:16 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id by3so13656313wrb.10
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 01:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1V6X7LS4W1rOsDectubi4KTeJ0veVK4x1Eb4mq8We4o=;
        b=NTGB1A8hi0FI4d0n7r1u647W9aZjL6itDmVIUW6Qef/Ns1oCssg5+T4pgN8GuHwygL
         LfX5rXVF6PFKzetgUtNSE4/bPKphcZNhNKjBIyaHuwSjYlcESXyVbMAqaV9g8LELU0AY
         W8qgSlxQ1N8mw09qsWLJT+MB9dOxyc+mAxPhIqeanAvZmS+EB8PfpLpuxEZIPeGczM7A
         CQl8XppAmLLKLCwBznID10RjyS6VPpE4qRu1Gq6G41V3rlhchMIOapYbUmhI6SZ8t2g4
         ILlb4U+xDvkPk/bCrfwbDmAadV9uIOXEqG7QPbzVPu5D4k8M1YmPkRMnj19Lu8wU6BgS
         rhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1V6X7LS4W1rOsDectubi4KTeJ0veVK4x1Eb4mq8We4o=;
        b=ueqqh+gcFz8zfE9BBqRMA0ngT83oQLkbY0XYu8tmyO2txZlAsVozn0TJog2cwf98pF
         f2ijIQUTe116Jkqs8xCm2epn9FzxGk1N17lGMqYx+4zaKBhkxoUm3VNKMCr8LiR7dsmG
         7uTluIuqBPCLpG7mEJ4Hq78rtqwHnyarUXxVDP51J3CDFwZl0mT1cBprhjAvv+reSBrV
         z23ma6Fzrkx/sZAOXHyk6EZritp474xZgtMK+Drtfj71gPnFk0oYzXNzjqSySfIO3wHs
         h0CxNW0WVYnWlliQelD3N9cslikQsUfgqL7+UTfgnH2ryMzsOdfKnBackDXM8i69DU5z
         r7TQ==
X-Gm-Message-State: AO0yUKUBmSDiR2C18qrhkmWnpsEfCmmtnbIWr8kx9AsAelwl7v7Xan1t
        eKIC368HqHMb+2A7hcscXYXT3w==
X-Google-Smtp-Source: AK7set+MeaNJDHWeQ3lmWJpTPfV0TrfI0EEoITSixsaaKVn0LPBKNUaNqT/3OtyQiTgAXMzeQBqd/g==
X-Received: by 2002:adf:f712:0:b0:2c5:50aa:f89d with SMTP id r18-20020adff712000000b002c550aaf89dmr1335007wrp.42.1676367855108;
        Tue, 14 Feb 2023 01:44:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b002be099f78c0sm12399605wrr.69.2023.02.14.01.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:44:14 -0800 (PST)
Message-ID: <5c67ecd2-075a-5b0b-feb9-57570f539ee1@linaro.org>
Date:   Tue, 14 Feb 2023 10:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 2/5] arm64: dts: qcom: Add support for Crashdump
 collection on IPQ9574
Content-Language: en-US
To:     POOVENDHAN SELVARAJ <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        robimarko@gmail.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230208053332.16537-1-quic_poovendh@quicinc.com>
 <20230208053332.16537-3-quic_poovendh@quicinc.com>
 <dbc93125-afd5-9ed9-7b45-0d79f728b4a5@linaro.org>
 <1a9ad881-7753-935a-ce7d-a2a79d34f16c@quicinc.com>
 <e569e7e8-4d7f-1e69-5a4b-ee4c4f83d7ce@linaro.org>
 <86bb95e4-2e07-19a5-7b4f-15f25067d513@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <86bb95e4-2e07-19a5-7b4f-15f25067d513@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/02/2023 10:35, POOVENDHAN SELVARAJ wrote:
>>>> compatible = "arm,cortex-a73-pmu";
>>>> interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  >>> @@ -95,11 +102,17 @@
>>>> #address-cells = <2>;
>>>> #size-cells = <2>;
>>>> ranges;
> *>>> -*
>  >> I don't think anything improved here - still unrelated change.
>  >>
> 
> Are you referring to the deleted line here?

Yes, the line removal does not seem related nor justified.

Best regards,
Krzysztof

