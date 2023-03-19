Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D170BC7619A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 12:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCSMZm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 08:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjCSMZl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 08:25:41 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1397A90
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:25:35 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id h8so36850967ede.8
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFpW7DvYItPfLOavEDwf4Jv4q9OdZqCjmJNXxWGKgnw=;
        b=wBl/FZVyPgenBUiH7+ZKEfBWanrTHgh5D7yMrsmn25uzyjc3atmJVo+aEnYW+Lb4lh
         KUXzNuZUdbRLn8V5LmgNWehFT37Ep2EhrX1jMRQ77Ejl5DayBiE0ldlwW2XrtSlssQZr
         WkMY2qgcA20/8tBonUvE3f4UB10yPesZnaZsuEzB+dsABBWritlLho4AL9br7K+6fkDe
         TWAKFLLqQKazItu3wky+V1Ce6aUW2WU2rBZxdlf3gihjZg8ZGg0mIbSy6JLHLurG/dm8
         vfFKXtEi74MGZOoVimxsztnJ28pP6nHaeF6L0yOunsaxz0o91zOqGS3NoXWtgOuaYjDC
         g+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFpW7DvYItPfLOavEDwf4Jv4q9OdZqCjmJNXxWGKgnw=;
        b=exciLUU/YO5YR+QL45fsUSyIM8fsm3NtlDIfxqjanwxS7qZ6NYWTR2UJrdMzgbQxAC
         CuzQHrp3hz9t+bNqDChTIp89vSOMtlE6yXp/yUBloY2CeguLex9uuY5rqAyKOEQFWz+P
         AK7jhB8GV6+FCiURLDVazwAfHVuOO8ioZw2JY61QGHfIk2AV04Hv9wPcJydXpcnHnJlL
         O9h0YJVnE10Gcay34oLFG6KBMmbBeSWqx+L+lFvR82mKVIhB//SAlscsrDqHtLlpirp/
         OPmdhCDTcDM8SqY5RuLL/TOe5ra4xQm43W4DEkW3AL2xxaryZ3jWA7SgyjlGFJATZ+PP
         DHTw==
X-Gm-Message-State: AO0yUKWgfW/zS1uSAkiAOrZEyMb5Hh7MAzsMWfjn2gks92umJaSM8hkz
        Bnk2B1Dq177uwfrjjUz61qvrsQ==
X-Google-Smtp-Source: AK7set9aSrS8i0GCekJwdkTs9pBj5b6jS08qCGaGpkNZS1KjkYCsinLht12Zf3/m+HWtB30GSoHOWA==
X-Received: by 2002:a17:906:6b94:b0:932:8cd:1021 with SMTP id l20-20020a1709066b9400b0093208cd1021mr5697603ejr.33.1679228733967;
        Sun, 19 Mar 2023 05:25:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id g25-20020a50d0d9000000b00501c2a9e16dsm480036edf.74.2023.03.19.05.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:25:33 -0700 (PDT)
Message-ID: <bf3a25e8-7076-d023-3b67-4d6c65790bba@linaro.org>
Date:   Sun, 19 Mar 2023 13:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-5-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316030514.137427-5-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2023 04:05, Xingyu Wu wrote:
> Add PLL clock inputs from PLL clock generator.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

