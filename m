Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE067C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 09:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbiF2J7r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiF2J7q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 05:59:46 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FE23CA62
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:59:44 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z19so21395119edb.11
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wHx0xHehg63vfEGKTlzZUfteHn01fhYVqm+Y98MQ7+U=;
        b=cq3NqapgxQIZNLj/B4EpJSN83FT6u7scmebwaohN243g5lWrwO8nYBNIAUn1qhvgUb
         7jmmYqH4sKXTgPqROvurvn1vcXpXmylTudSKxbz3wfUavJZu/drqoz5sEa+W5iQTRblF
         5XSJkq1wtz/vUkhZOETe59hjQCYJ80VPeHXi2+7FT76LK3iGsf9cOxGtJxUm6fVg4+tX
         gHvUST/E4kcHFVBni8Uo5KdGCn6dbo2m2ucg+YQITuLGMf03hSWn6qRpS2d5prRfI4YM
         nOlY0VqzuovmFZbZyEnVCPfbor3VtedyU1MSOkm8RT7eAzy78HLxQXHEw1K4eepqjNJl
         5dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wHx0xHehg63vfEGKTlzZUfteHn01fhYVqm+Y98MQ7+U=;
        b=IrUQD0yO6jWJDWuAAg+Cik4cFNvA1q+ouBw1tH5IGQjNMrDYeE/4klxdYCtKrBKomd
         6ARp6QXS5fSaILQZ7YxsyM2V0Q9DAoBkkiuctqMS+hKbcDpdV2Olk7GsK/kGdy12vQmj
         3Idnw3o8ZGxVp5/6lHOgYfNzlt4mtqnR2p0A8GOxq0RfANH3Lh7OP1FdGOtPjuHwOeDW
         Lm894faTDJNwuVxAg0qRfUKzVuanDpLA9o6qaaf7+2qPTi+ojQkgtXRk2eNGQRs75X6K
         2qzcRYeHsYAjv5wUbviE9HnfCU73IMuEf2dgGOwyCn5k7ApbHkonQCVK07zeZDqtDkAu
         UCjw==
X-Gm-Message-State: AJIora8KyZVyDlUsdUBp8CVTKMOV9ZQgAplC+OsNZZx1cDgqN3zLmG2v
        /R+kGCwoVj5+yoNt4HuoeK4sUmHSd8lfsg==
X-Google-Smtp-Source: AGRyM1uKH7BIvUrbVdQs4hTQzzjvedfKmrpPqHS5rBnnbwQUfXiaigl6zGQSbVqTeAGptfLzPSzvTA==
X-Received: by 2002:a05:6402:430e:b0:435:9e41:6858 with SMTP id m14-20020a056402430e00b004359e416858mr3130822edc.69.1656496782905;
        Wed, 29 Jun 2022 02:59:42 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bo5-20020a170906d04500b006ff0fe78cb7sm7516695ejb.133.2022.06.29.02.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 02:59:42 -0700 (PDT)
Message-ID: <db26821d-9780-5829-5078-d8f8fe6e5875@linaro.org>
Date:   Wed, 29 Jun 2022 11:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] clk: samsung: exynosautov9: add missing gate clks
 for peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220628104138.152118-1-chanho61.park@samsung.com>
 <CGME20220628104347epcas2p4502a4524de0c98ababe8cab4b7b73c3f@epcas2p4.samsung.com>
 <20220628104138.152118-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628104138.152118-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/06/2022 12:41, Chanho Park wrote:
> "gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to peric0
> and peric1 respectively.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
