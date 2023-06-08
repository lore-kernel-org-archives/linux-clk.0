Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF27C7EE29
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 09:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbjFHJqq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 05:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbjFHJqo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 05:46:44 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD16E2736
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 02:46:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977d0ee1736so66111666b.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686217599; x=1688809599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwfSUtJegYHwFh0wAFzwyY1ZdyGT7Mgb4oZNMttq6XE=;
        b=CDkhEftlaSLF6sdt8nNs7se4Qhcq/8O3MuP09B7vsVKxRA56s5qk9D+TBxSBsibyta
         ILLKhP8B68VLieek7PbP+ZOBVcDCPG1gM7bKz2uAVh9oSDCpHeJj3ax4XRdSlMO6mDRO
         PsblGCIp65wf6MOL985w6Z/KOnFXTTPb/QydQec4Zp356KPHvJM0TvvQsDXFsXB4r43U
         LZHq4+rl8/6ya+T6uTHNum1CxtPo5F4tY/EeHn2pgRbcxelnv3tTnbijXAjHkIBdbA8b
         KCWkcjrr018aICM55M+Nq40ina0F9+odCmDx1dV0ECVCFiCDHxHJgA1dMSTeJWOnVjmQ
         7NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686217599; x=1688809599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwfSUtJegYHwFh0wAFzwyY1ZdyGT7Mgb4oZNMttq6XE=;
        b=dTZugpvkjVzTxqo8ArlyUgWjPh3rfF0SFAKcapErPAuXZQvOgIncLYv7toevbLmtqr
         am1lt+2F2/7ebycRp9gskCUw6JppD1TTNMWe+EK2ipLYWd1cCh03RG4gSYPWafD4ny+S
         D8JFttALCi1F0ZVfxgvSoWDnjLPnMWm2+35bK7m0kXn/evuY0O3DviWUvxbOlgQFHEKN
         bYPMEboTiDDsrDKcq7FrfTLMwtVcQ0VLFZwlwZ4YkcsMDKmgnUbzq0q8GdJYPUHco8SS
         5DAB4JhhzRrIbkMoDqknGbltr+NqIg2NRXUxBtyBg5z2l78OwG/1xPhzS/svk95oYvHr
         TpYg==
X-Gm-Message-State: AC+VfDwlRtopmhHfvyTf20lsOCVvokHeVYOOJ6r14bsZ+uWb0KT3gmbo
        nDnyPiYhgOVeMyby/KRTpYF09Q==
X-Google-Smtp-Source: ACHHUZ6zW9Jfzg9e3QUsXi49uAOKReuTXYpPcNMEk2ASw/T2zQjerzPEQW1Qxs/eV0hDTQYTXM17pA==
X-Received: by 2002:a17:907:3e28:b0:978:8e58:e19f with SMTP id hp40-20020a1709073e2800b009788e58e19fmr3216261ejc.16.1686217599358;
        Thu, 08 Jun 2023 02:46:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r23-20020a170906705700b00965e9a23f2bsm462807ejj.134.2023.06.08.02.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:46:38 -0700 (PDT)
Message-ID: <5242c754-0546-fbd9-141a-b4632c24ee50@linaro.org>
Date:   Thu, 8 Jun 2023 11:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] dt-bindings: clock: versal: Add versal-net compatible
 string
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Cc:     git@amd.com, devicetree@vger.kernel.org, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, michal.simek@amd.com, mturquette@baylibre.com
References: <20230608092526.6462-1-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608092526.6462-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/06/2023 11:25, Shubhrajyoti Datta wrote:
> Add dt-binding documentation for Versal NET platforms.

What are versal net platforms? It's different SoC? You have entire
commit msg to explain it...

Best regards,
Krzysztof

