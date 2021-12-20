Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DE8C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 09:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhLTJbq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:31:46 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59332
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229617AbhLTJbp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 04:31:45 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CB8BC4000E
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639992702;
        bh=q7I5LUCu0tEwQU8mlJ01Zkswbw7h7CV+lz20uT47oA0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=vj+//xh4noKEGlaAHi/wf7nXYbygH1ZIOWRgEACtCbu45VEpxlFo6V6RAfB9P/23E
         HSsB3UVZri9YU4zoG+OP+YkL3o4VFVZAELHZQnAilv/ic30Bxu+9UbrctiZfpx5hpP
         JFfXG2gboB18qnq8z6yu+3s0xJf+FCv450NYUjh6lPw00zr3cXTSHl/tm6s0fWSRcH
         Ag/6Kl0XADA1ZegFY8tAiuZ13v2wf6rugvte8Lll5arKd3hTdIg5nfMDuUwwOYUEQC
         3D6HbtDGbNZZD9dUkF6Bn0IBZQpCOmoW3gRuOAWzs19eiXgCKOI2RSKallNuiJiEs5
         JwObScGz2Eq/w==
Received: by mail-lf1-f71.google.com with SMTP id e2-20020ac25ca2000000b00425a11d14a1so1951368lfq.11
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 01:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q7I5LUCu0tEwQU8mlJ01Zkswbw7h7CV+lz20uT47oA0=;
        b=qTUy1p7P5dZFgjMnN3IC7fnnHYINQHRmZkU/wBCJpxgvTgBzp+oVZZfV4cZR8TRv8B
         EmwBX3BAHj8yYUodwIweG41VIx2odMPOTQdWHlonMFDmSYO3nLmWN0hPLC/cUdlZWwbf
         iMdXY4uDr8fAcNXUp89f01pyTxzibxzd3UovCpJ9a6VRMk9BXWTseKQDzg+OD4YbsFFv
         T4ZEFB6V1R1dbQPbztCfX4ZSzCa4d5erJXH9BfTCOHybN2m4NxoGS9SzPiW+6ilOBVwB
         vVEFhDaYzgtwpgryxo2yC8IWxA+qME+GdZzLsFOkFNX7mTSWH8lD/nas2E64Vm6msfZb
         hbeA==
X-Gm-Message-State: AOAM530h0t7Ay2h/lmFugW9kcvZqeAPVGo23dNfyWSL//E9BLYOV7usV
        g/PTTm/rUBLyye+mFYwv9mXye7Yrh3x5NZDf2d90mBtpKoWZqKK8ks7bTZn6WEexf2IUueRMnPc
        TUGn+UFiiNqqX9ind9Fwz2eZISQD7z8iOwVghLw==
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr14038822ljp.249.1639992696191;
        Mon, 20 Dec 2021 01:31:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgVVgGiKkGKbx4ide5sjyVaqJ3UmUjO0Zkflx9HK1jDuh36xwydUtGqYdkrGBefX8MPBCelg==
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr14038784ljp.249.1639992695825;
        Mon, 20 Dec 2021 01:31:35 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j19sm2466716lji.94.2021.12.20.01.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 01:31:34 -0800 (PST)
Message-ID: <5bd5c0bf-4390-22c2-e4e0-cb02b80dfb9c@canonical.com>
Date:   Mon, 20 Dec 2021 10:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
To:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
 <20211217161549.24836-2-semen.protsenko@linaro.org>
 <2fdc5c97-6c19-8e70-d717-28b29d86160c@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <2fdc5c97-6c19-8e70-d717-28b29d86160c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/12/2021 23:29, Sylwester Nawrocki wrote:
> On 17.12.2021 17:15, Sam Protsenko wrote:
>> System Register is used to configure system behavior, like USI protocol,
>> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
>> make it possible to modify SYSREG registers.
>>
>> While at it, add also missing PMU and GPIO clocks, which looks necessary
>> and might be needed for corresponding Exynos850 features soon.
>>
>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
>> Acked-by: Rob Herring<robh@kernel.org>
>> Acked-by: Chanwoo Choi<cw00.choi@samsung.com>
>> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
> 
> Apologies for late reply, this patch is applied now.
> 

Sam,

The clock is used in the DTSI, so since this was applied, there are only
two choices now:
1. wait for next cycle with DTSI and DTS,
2. Resubmit with replacing the newly added clocks in DTSI/DTS with
numbers and a TODO note.

Best regards,
Krzysztof
