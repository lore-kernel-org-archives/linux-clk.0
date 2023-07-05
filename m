Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF95C001B0
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jul 2023 09:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjGEJtG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjGEJtF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jul 2023 05:49:05 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C5E1713
        for <linux-clk@vger.kernel.org>; Wed,  5 Jul 2023 02:49:04 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51d89664272so7653172a12.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Jul 2023 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688550542; x=1691142542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0hymjdKc3LsDVZbTn71V/iWvkbZjVQzkC0ykYCrDKA=;
        b=yAI+yvX50cia2w9g3lMHPgK1Gj8OjNFJSebhnkV/MYd6/+cOKoXjNTbDKMyAU8SATj
         YGSwBZUzVqYnNhZ8moPIiSUE50iEZOGh45nlzpgnlzu0Hzl6U/qF0sUrBVfah4MzC51d
         M78rLVgYEdGjqmGgMJ7BXB3glgWDvDPQe3GVJKbGU6BS7Znls1D02PsZNK3N/IPV30uN
         jYGpHwl7mu/H6ypDxCFF9NI5/e0K/1J16CYBp46cMl5ZSX+KVceX9ewajZqQyVfRJ2iU
         ZraZ2nTu2DEeUawCgomituhKmvRfBH5iZMn3zNcA55MQVoKqcL2DWx9A8l9MkT480CUf
         OQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550542; x=1691142542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0hymjdKc3LsDVZbTn71V/iWvkbZjVQzkC0ykYCrDKA=;
        b=R8R0s9+kM+9arLZu1LoJbT1qK03mit/+PReHeXM1W8ZKyonY9gx2pBl8L13yLQjkzy
         Kuk1cO1jiB6czuokp+FY5z5MrYMi8BGN2WCX0C/EKjHBAi5bXsLIjFLXh2Fdf0lj+rMf
         3SDzBDi8jiROGIjUS4Uz/gtmaNK88WkAQSyA3a7DGfwV17KZa/eabbI78sxddMa1Gbzt
         uqbfuFUuxsCAogWagMel8uurXyRuc/daK+cDUdo1xkqFTITCoazdwAAV9S0EunkxUR6W
         qLqB+Pdafjj0jrk4lhPOB3aktExtt8VU1vpCiRtGHzM8iwpRJB0lUrW6mgt1oTTEmwvZ
         z2BQ==
X-Gm-Message-State: ABy/qLbe5NaHKksFVZIEuxTR0jYIJral2SCQ7f+75RAKpvFf7NQZuX8w
        TzzA+EA5/DrWMNSYSwiULYjtFw==
X-Google-Smtp-Source: APBJJlHizyjKeH7/oYcU4+EGoyZ6s2G1hWWl7OQFBPr94hAtXsAhkUwUDD4PlFbie+q6czFqVk7J3w==
X-Received: by 2002:a17:906:114e:b0:966:5a6c:752d with SMTP id i14-20020a170906114e00b009665a6c752dmr11681724eja.20.1688550542639;
        Wed, 05 Jul 2023 02:49:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n5-20020a170906088500b0098963eb0c3dsm14325556eje.26.2023.07.05.02.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:49:02 -0700 (PDT)
Message-ID: <f888e7e2-9a7d-4525-78a3-cfdecdc8a918@linaro.org>
Date:   Wed, 5 Jul 2023 11:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/7] clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        map220v <map220v300@gmail.com>
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-6-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704163848.169853-6-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2023 18:31, David Wronek wrote:
> From: map220v <map220v300@gmail.com>
> 
> Add the PARENT_ENABLE flag to prevent the clock from getting stuck at
> boot.

What does it mean that "clock getting stuck at boot"? How a clock can stuck?

> 
> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
> Signed-off-by: map220v <map220v300@gmail.com>

Same concerns as for other patches with this. Look:
https://github.com/map220v/sm7125-mainline/commit/e754e5725cb596049df2437d7c857e4d232e87fb

No SoB.

> Signed-off-by: David Wronek <davidwronek@gmail.com>

Fixes must be either first in series or better sent separately. There is
no reason for them to be in this patchset in the first place, because
they are not related.

Best regards,
Krzysztof

