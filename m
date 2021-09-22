Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6524C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 08:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2EF56134F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 08:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233582AbhIVIMh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 04:12:37 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46756
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233554AbhIVIMb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 04:12:31 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E798C3F048
        for <linux-clk@vger.kernel.org>; Wed, 22 Sep 2021 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632298258;
        bh=P8Qe07F/xjMQdNLxVav+Rfl78SB2e9oBWelI8/7HSJc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ipSWKYeenn5tZF1Kr6wKaMcSRUat1u6CwmnYr4WrC02kROUQpYfZQ94ZsUcNSbi0u
         wdYmBf7E0s0byAmRaICB23GqWBdCR9aXAoxnYZY4UQaIXZr2WO9JAWp6AOjs6JRqDt
         amu4KBvhXWWpzuofD2OhpEaqVP4bhTUawHQL9TEBNW1cbupOsdnd4AZhN17dwdXh3f
         oSolPb0ORahsiPfKshml0Z4fcu95pkYV3w5c7e4aS5d3GARLDAeLC8pXY3uBcSF0P/
         fsVsFRTBQxonTseLnZ63acpk6etfaCPhQMuF3I5aZd/jjp3EcBp5CEnkIpD4WZ9Q88
         WPE2S5xRcL0iw==
Received: by mail-wr1-f69.google.com with SMTP id m18-20020adfe952000000b0015b0aa32fd6so1379452wrn.12
        for <linux-clk@vger.kernel.org>; Wed, 22 Sep 2021 01:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P8Qe07F/xjMQdNLxVav+Rfl78SB2e9oBWelI8/7HSJc=;
        b=IeKwQ1y+ZybtTpMEmpd7077y0oQzlRAbOttkLWmOah2YHX1VqJgL1n1EKh2YrL55OE
         8rwA/7D50tO07puC5n69sgYc0+pQ8k51lhXvLSa/CMDMqBoF+aAVaV9vzZn5aCEeVZKq
         8dp803zXgF3mn5hsyCYtdsoXaRJLC3pdMZQOdBexmzW44V/3jEtozjV/1V9Jh4fB7+Ns
         e/SQqU94WxcLGa1f4zogyqn0rTFqI161O3IhqADJoNEWzAB5K+Cm6+MRIrjIOdSr7bj6
         As7ZO1YMr5a/F6cw3Yxk36iH6rH8WQblV26984CSFrY9iRuKpURqTwEtjQOihwmhSFlh
         BeXw==
X-Gm-Message-State: AOAM530xmcyw0nCw3nAzT72qT3lCkcqIMszgsJJrjr6LrxwrNg1iIPAS
        FTfA/CMcEu17DLpwbudScA0ZUoS0H9TBCPJDx7XXkV7amRxYgpBN52AIqPogZqsLYWaJZe/rawN
        t2dbLVmo83AumfYI0RnKFJLrW7Quk0Mjzs0IeUQ==
X-Received: by 2002:a05:600c:3b89:: with SMTP id n9mr9113905wms.186.1632298258647;
        Wed, 22 Sep 2021 01:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb3Ljj7oUI5lHEYQz4nwFDjBGGdyp2FKjKpmWPv5gSTXpVI7LSRlWIyJA3WG9xT/pBfVR0VA==
X-Received: by 2002:a05:600c:3b89:: with SMTP id n9mr9113885wms.186.1632298258458;
        Wed, 22 Sep 2021 01:10:58 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d24sm1174219wmb.35.2021.09.22.01.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 01:10:58 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 1/4] mfd: sec-irq: Do not enforce (incorrect)
 interrupt trigger type
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7ac677f1-2928-21de-a226-449e72b1bd10@canonical.com>
Date:   Wed, 22 Sep 2021 10:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/06/2021 13:04, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Interrupt line can be configured on different hardware in different way,
> even inverted.  Therefore driver should not enforce specific trigger
> type - edge falling - but instead rely on Devicetree to configure it.
> 
> The Samsung PMIC drivers are used only on Devicetree boards.
> 
> Additionally, the PMIC datasheets describe the interrupt line as active
> low with a requirement of acknowledge from the CPU therefore the edge
> falling is not correct.
> 
> Marek Szyprowski reports that together with DTS change (proper level in
> DTS) it fixes RTC alarm failure that he observed from time to time on
> TM2e board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> ---
> 
> Rebased on https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next
> 
> Changes since v1:
> 1. Mention in commit msg that this fixes TM2e RTC alarm.
> 2. Add Marek's tested-by.
> ---
>  drivers/mfd/sec-irq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Dear Lee,

This was already a resend. Any comments from your side?

Best regards,
Krzysztof
