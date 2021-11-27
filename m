Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2D6C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 27 Nov 2021 13:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhK0NXz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 27 Nov 2021 08:23:55 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33622
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354921AbhK0NVz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 27 Nov 2021 08:21:55 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DD8F940028
        for <linux-clk@vger.kernel.org>; Sat, 27 Nov 2021 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638019119;
        bh=XlNC1VCy2s9y66a1+PddNrIyqziFzmje/wU1Hvd5Nh0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=efESBC0EAwon/eGEgVisqN6nJDi2sBoysuAFRJDYHKX+fCg+OFpvTcNCZAZFauJRR
         FBsK3IK/MG69S+oFlV2rCsIVz9f712vYs0anwYjaTk5wctDDy48fwUmXp5Wp/Dwnyw
         29CrnIBxm+ZbxubleHn/Q8ffVhbZMItLcTxLfJkk5eftLyZ5UfDcWdWFy4KqE7Dje7
         qB3WO8tVKDQAYr5La06ox6jgVhwxYaV+2cA221hbKpgK5GqFgU1XNp5Hr0Qjk9oqFi
         cMKHHwjtf1hDFwZ53EyDK72W3yiu8Cd/03zvLn8I5yKQpBhXEk2psIveF9JIN1aJl2
         ++gjpJX88Rl/w==
Received: by mail-wr1-f70.google.com with SMTP id q17-20020adff791000000b00183e734ba48so2020549wrp.8
        for <linux-clk@vger.kernel.org>; Sat, 27 Nov 2021 05:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XlNC1VCy2s9y66a1+PddNrIyqziFzmje/wU1Hvd5Nh0=;
        b=aVZsrjiyf2rMh/AFQXtzTqCnBQook1xZBB0rm65bwYb5W6o0o1YXWWSq4IeyS3q/SN
         NfvhYNTFGrODxdXplIKR169PzUB0ApmDOtLf+rp0PAz/spv7YM1IKWrRVctV5RcmfDc5
         kyZL7cSeDxS/pI+GHFz400dCr3M06KDCEf6MeA1gW7mrWnbUu9MnfCWy85jmsUdpJuuI
         GNMyhbxRtx2ht+EMoECszZflvkK7JjDbLqxvXliS27k7Neq3o4Iy60SzDh7CPZJEF0+E
         2HaQ16lDU4Pc0CBmroVU8hTmxA4Rksyr1k0BDFM3kBfwXCpsVhinLcghoUwcJcZ94nRI
         b/aA==
X-Gm-Message-State: AOAM532ldCO154PvdcsRS0pCH63Ucm4tZVyRzFlQIPhKPyS10LUsZgwk
        xy7bKk0uLy9U6xlNO7dS2UJpocXlCkQibusACCIjMEgQ+TXf353qRXUj3E015cL48yJxpyRWBEe
        pPIbI2S+4niJjU2Ydh1/0kL3/SRvh2agoKG6+AQ==
X-Received: by 2002:a05:600c:4e91:: with SMTP id f17mr23109838wmq.195.1638019119539;
        Sat, 27 Nov 2021 05:18:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzND8ZpYpxyHTPjzGXUg7OxWsPcMAELukJVLJ0LTeNw9xcGhvRvcFGjzAFQKfSCYQJnygsZCA==
X-Received: by 2002:a05:600c:4e91:: with SMTP id f17mr23109807wmq.195.1638019119359;
        Sat, 27 Nov 2021 05:18:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h27sm15600780wmc.43.2021.11.27.05.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Nov 2021 05:18:39 -0800 (PST)
Message-ID: <c5702c2f-d5ea-b322-f10d-93352979a1a1@canonical.com>
Date:   Sat, 27 Nov 2021 14:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211126203641.24005-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211126203641.24005-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/11/2021 21:36, Sam Protsenko wrote:
> System Register is used to configure system behavior, like USI protocol,
> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> make it possible to modify SYSREG registers.
> 
> While at it, add also missing PMU and GPIO clocks, which looks necessary
> and might be needed for corresponding Exynos850 features soon.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  include/dt-bindings/clock/exynos850.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
