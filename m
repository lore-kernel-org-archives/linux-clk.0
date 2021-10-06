Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36161C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 12:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FB1E6109F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 12:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238617AbhJFMw4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 08:52:56 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49738
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238621AbhJFMwz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 08:52:55 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A4D3E3FFE5
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633524661;
        bh=PKetBUdtpr3Hr2NvlRZBfrIHbbw2Nu4lIQoW/4WvUOo=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=qIkX5gx6oDxcWl2rcnIUJuSMelK04mYJNfaUqN3Qkbz4TmG0JwWo4DcceB+kqj3u6
         b+nVoBsiufKSkFoqS7pmGMhXILYLVlfao4jwzTX8uOfy3Q7G5x0Spygj53afDNcbP1
         75CIyexU42MG1TSF3L+qQTRXQb2bGtTBu9gwA5nlDbFEj9d39hhfSzAJk+lryAW+oW
         k4D0zSj7NfZTx1AQZngeqtHwpcnSMoUsF31wN9U+UPHGw0KnKv2SExfbxBlwPBjrfU
         RqKSNclztvxhiimv5g6eA7W+mEs4B3nikuTIShyK2XcdUqG8HUrJrWAOXuLvPNJhjF
         ksxdyZKTyoEPQ==
Received: by mail-lf1-f72.google.com with SMTP id g9-20020a0565123b8900b003f33a027130so1878170lfv.18
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 05:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PKetBUdtpr3Hr2NvlRZBfrIHbbw2Nu4lIQoW/4WvUOo=;
        b=Ox6+0v78LZgyVUrHa5R0yiceTd13xf13qhdhTaqNCdLXSuc1d+UVCDZb8EDY6E0mtR
         QWioLFucH73MI/+efpNk31UtiUcFhAT7pbRZBme4vM6U2TZkbNxp4mYe49qX5DtEeKTm
         GjceJ9k9n3YPrv70PhPHeJ3N4GSQQzcWVGK0WeMGfc3wXJ9dFJ88SDDkstn59acf/5Vg
         /JoFRo8bofWmDDPID6GrmqdRbxUcKFnlQBSxrT3Sjl12BivgmpVtst7BqiTb10yl2Sby
         SP8OD0S5Qq4wduhNpg7/dsgAHy15pxM9KG2a8MRf1n+wnUqgJyvGRk65SPeQdvkKKMgR
         hyOQ==
X-Gm-Message-State: AOAM533tacjOnvljU7VT5cITXWGxf8Cvplbzay7P2yBmFcXkrGKD4tk4
        o7IbKDehDJMSjoyr6rx7naQSoT1Ki9ljKFkhJveXajPrEQmNhgPtfiTnXxhCosSEi4hGXUVrUuj
        iKvYtxpqzg7+B2imko1au8dxmrEIjJI1kK1vRtw==
X-Received: by 2002:ac2:50d3:: with SMTP id h19mr9138099lfm.63.1633524661203;
        Wed, 06 Oct 2021 05:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYQXpRfbdij+G/IdEjueEdrmnNAVv9YGwPu64Trw30ig3vpNtjLztb74XfXOnojeuZlsz62w==
X-Received: by 2002:ac2:50d3:: with SMTP id h19mr9138078lfm.63.1633524661042;
        Wed, 06 Oct 2021 05:51:01 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q1sm2261481lfg.18.2021.10.06.05.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:51:00 -0700 (PDT)
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-7-semen.protsenko@linaro.org>
 <3da75dbe-2f98-39db-c455-46adead7097b@canonical.com>
 <CAPLW+4k+1x+qwJJWth7=KwsF_Q2+n5LDA8Q+63M-bxXDO=4bZg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <826fa28d-05a9-4a1c-a69b-70fc50e26e24@canonical.com>
Date:   Wed, 6 Oct 2021 14:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4k+1x+qwJJWth7=KwsF_Q2+n5LDA8Q+63M-bxXDO=4bZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/10/2021 13:29, Sam Protsenko wrote:
> On Wed, 15 Sept 2021 at 11:59, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
> 
>>> +             val = ioread32(reg);
>>> +             val |= GATE_MANUAL;
>>> +             val &= ~GATE_ENABLE_HWACG;
>>> +             iowrite32(val, reg);
>>
>> All other drivers use readl/writel, so how about keeping it consistent?
>>
> 
> Ok. Though io* variants looks better to me (API names consistent with
> ioremap/iounmap) :)

The io* variants are for PCI I/O and I/O port. Since we know this is
MMIO, all drivers use regular readX/writeX, so let's keep it the same.

Best regards,
Krzysztof
