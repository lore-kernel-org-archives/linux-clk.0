Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDE2C4338F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jul 2021 17:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 064D960F48
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jul 2021 17:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhG3RVj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jul 2021 13:21:39 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:44276
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229738AbhG3RVi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jul 2021 13:21:38 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id D3E7B3F251
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627665692;
        bh=o5z17HicOMnibSKxbfutUtdmQTlkkNRFgUGIEJq9A5o=;
        h=From:To:Cc:References:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ZVIGCDb24xeKb9w9QH9WlzHkt4PY56fn+kpp80yW0Y9wQvJ0CH+DhRQ2ygVAWck5d
         Ma8UM17gs5WzkxBhRY0Wqfv1UYdX4VMzD0ujprMDkDEvauW+WlmQA13sKjUJgnr8K2
         qpoSJUOnfCZkQ4gfNckoM5//wF1SfCIm2IiHRM0RTVo6usPcgR1HmnH2yM5EhiAN1U
         /cTab7z0l8YywfW2Vb6KzU/lV/ydix1NjJLxN5oWa/ykn0Wig1dOzGWTDLooA7KEMu
         JxgQwmj//embW3fbV+bU7roZgG18zuelOei1Mm25F3Ld4mEz2Q+EKbZ/+oH1M5Ov8H
         aXTJqPDyPHVNA==
Received: by mail-ed1-f70.google.com with SMTP id b88-20020a509f610000b02903ab1f22e1dcso4938506edf.23
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 10:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o5z17HicOMnibSKxbfutUtdmQTlkkNRFgUGIEJq9A5o=;
        b=gBmdYbs9X5BNzadCL/gfimdWieZA7+TDxHGYo/+eFuwpYzJv10IExldHnaK4VH8vTQ
         /Q2x94tWB45RYD6PqvNz+O7E5b9WNDpy8qfoPTEbmXp7Z6z9VMwnm2E1skzzF6xLeSgB
         f5j1CYvrqJCyaSF5wApWmgQOATTFyKhGEwsowDCeShgi+IA95uXd0N+B6wU8yBa2wIv9
         Ffn7QMU/mmhISxYXC8TUOXZAyjkGO2FoB0JiXfUWy9gmD+yXEbG4L7B45sC52BHQyuyD
         mHfaZXgUkvobw6/jIDwrYRLA3hsqYJtxnQczc9p6IUwKIsNsRyrft822td51d4/uvdNo
         d2Og==
X-Gm-Message-State: AOAM532dqPIwSUUxSQus8ghxw4pjauE/DY5/mh1Q5xTVzdzfacPH0WQx
        C7enNg9Qs4b6slOe18XRcuEUR3ELy0NJBic3g618HpcGQRK//IacN6pYKg8QWBxg7icjLOesL3X
        6DTVELa6/ICOsNH5Ij3LU0bFPLhwHp6089ft7mQ==
X-Received: by 2002:a17:907:724b:: with SMTP id ds11mr3758099ejc.192.1627665692502;
        Fri, 30 Jul 2021 10:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFiKJlif1uhqb84VdmehIjJr5DEUQdSGnnvL110bm0Y0Y4Awj/aQgY4XpZWPb/ITBePmMBnw==
X-Received: by 2002:a17:907:724b:: with SMTP id ds11mr3758080ejc.192.1627665692316;
        Fri, 30 Jul 2021 10:21:32 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id p16sm944758eds.73.2021.07.30.10.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 10:21:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
Message-ID: <c3486111-0ec9-9679-d2a2-68b2f33a2450@canonical.com>
Date:   Fri, 30 Jul 2021 19:21:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/07/2021 17:18, Krzysztof Kozlowski wrote:
> On 30/07/2021 16:49, Sam Protsenko wrote:
>> This patch series adds initial platform support for Samsung Exynos850
>> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
>> rootfs as a RAM disk. More advanced platform support (like MMC driver
>> additions) will be added later. The idea is to keep the first submission
>> minimal to ease the review, and then build up on top of that.
>>
>> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
>>
> 
> Great work!
> 
> What's the SoC revision number (should be accessible via
> /sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
> might bring confusion...

Judging by vendor's sources it is quite confusing. It looks mostly like
Exynos3830 but in few other cases it uses Exynos9 compatibles (Exynos9,
Exynos9820). Only in few places there is Exynos850. Marketing department
made it so confusing...  The revision embedded in SoC would be very
interesting.

Anyway, judging by current versioning, there is a risk Samsung will come
with a new chipset name conflicting with existing ones. It already
overflowed.

It's even worse with a thingy called "Exynos9 auto" which hides
numbering even more.


Best regards,
Krzysztof
