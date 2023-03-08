Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C259C678D5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 15:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbjCHPqE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 10:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbjCHPpp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 10:45:45 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D646CA1F3
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 07:44:37 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bi9so21942703lfb.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 07:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678290276;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sHa0ynl+/MvZYCzLTdvR272aMTGiQ/CuCrcneTS2vg=;
        b=wpHZ9Sg2UxLqyLfdW0cPzczzTANQFHOWQ3eNovcKucdxK4yfjlZSzOxeDANPma39kG
         WHQsfz4VFj+VmYm/ztMzatN2Uu8LCuj9u4aP3+JLzsOpprmYatQ22Xjb0y4ocIHdXBZd
         hPQKFL5tHhyR2+hRASVE9NJB61EUN3Cuqn01rEZfCA66VN5W86YsnD/Mw9dP7mUie2WY
         Y0CxOTLAT2CUXIwcX0BHwvC/WkCw3U79VOBxoaDETNINnuMRi3bpqzPJ33jfom716HXL
         rfPLV9d64z+ZbUsyUzpNBwOSV2MRpGtCcTK45VfGINe3vWWhwBTGDyJuXKwjKHlXcTYt
         65sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678290276;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sHa0ynl+/MvZYCzLTdvR272aMTGiQ/CuCrcneTS2vg=;
        b=qJVLYjKh3qmbw3/0dnRHCTn7n3h4kxoDi73yUbItdb+NSPEKY9EJX04AZNYzrOg8Xb
         uHOuTRBWeuqwShju48OcYEEZ2N44qgWtrZj0XEGNVbP2s+/izXshCqjBWMj3r59GRWk/
         EfeKnhJVFVa+0IC2xkKlqGd+gp08neQLd5bwxLgjNh22PXhSK3MFptlZDMq3hqzVtOq7
         BqFQ/Z4BEQZ7qiQCp0zC+ydM2LnfxO8X/xVO6anhmY/hg0cbFFjpnevmjOs97558vwsE
         5JB09LoFFl4XP3I/uR8xnAoIpyB2U6l/3gUqmviBEG3LwglEmCFLZYIPmbfXpvm1QRT1
         bCTg==
X-Gm-Message-State: AO0yUKX7tnZBR+9mW6/cljNUHgzZc9zEJW39ynoWa/shNZO3rarDljl6
        T/eCg2m50uu+ian5eQ+qCqV/Qw==
X-Google-Smtp-Source: AK7set97hJxmBBCQx/SjdIQvs90ErVjhDQ41dncyLnZREk1fb5W+VAu2rtaXfzz/1glKcmJfAWRqFQ==
X-Received: by 2002:ac2:4a8b:0:b0:4e0:c0d0:e209 with SMTP id l11-20020ac24a8b000000b004e0c0d0e209mr5182126lfp.29.1678290275720;
        Wed, 08 Mar 2023 07:44:35 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id q8-20020ac24a68000000b004db4936c866sm2352538lfp.38.2023.03.08.07.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 07:44:35 -0800 (PST)
Message-ID: <2d1661fe-92bd-a117-27a5-cf1803ce363f@linaro.org>
Date:   Wed, 8 Mar 2023 16:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V6 7/9] dt-bindings: firmware: qcom,scm: document IPQ5332
 SCM
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, dmitry.baryshkov@linaro.org,
        geert+renesas@glider.be, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, robimarko@gmail.com,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230307062232.4889-1-quic_kathirav@quicinc.com>
 <20230307062232.4889-8-quic_kathirav@quicinc.com>
 <754a2d38-dd7b-48b6-80e5-683ca193e0b1@linaro.org>
 <ab803e21-76bf-308c-9df0-8b7b45b472b2@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ab803e21-76bf-308c-9df0-8b7b45b472b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 8.03.2023 16:39, Kathiravan T wrote:
> 
> On 3/8/2023 4:31 PM, Konrad Dybcio wrote:
>>
>> On 7.03.2023 07:22, Kathiravan T wrote:
>>> Document the compatible for IPQ5332 SCM.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>>> ---
>> Does this board not have a crypto engine / CE1 clock exposed via
>> RPMCC? It will be enabled by default, but Linux should be aware
>> of it, so that we don't gate it by accident.
> 
> 
> IPQ5332 doesn't have the crypto engine and also it doesn't have RPMCC. Sorry, could you please help to explain how it is related to SCM?
SCM usually requires certain clocks to be up and that often includes
the CE1 clock on fairly recent designs.

Konrad
> 
> Thanks, Kathiravan T.
