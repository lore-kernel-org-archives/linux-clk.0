Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B42C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 13:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56B64613A7
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 13:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350773AbhI3NSp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 09:18:45 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39346
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350528AbhI3NSo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Sep 2021 09:18:44 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 46D3E40260
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633007821;
        bh=RCNF115QrSenyhS4+VUmTb+/09HgZQVEEH62W5zhJ9o=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NPBdil4tQLTdbn/InaRcY28R5pI15hbMigaqlVuDNvUHKLUI4t/k6TQ84trvRfQS2
         f23JmlvnVzvCcIduDKPldzYvsS/b21/um2jRTsF3CZymQ5CPiK9ZVGDIoZBEAk+xhW
         Fjbh+U19j8uXrSGlu8e0ugo337FaRr9czHMconAkylmLZLB4jVHcvvjJ08G7eJvXnx
         Kn1GifhLbxK/7I3+slh9wtQtBoj/CJjphNSpDgFXLE0LzHy1hmyIsVlkQypv74mpqv
         pHc2VdIR7O1X1zOuVXj7R+M2g4bHnW11VAXJlGR2k1Q1sNoMo0uKWUroM3Hom7gZzf
         5/oEBpi2r1eSA==
Received: by mail-lf1-f71.google.com with SMTP id d16-20020a056512369000b003fca9e038ddso5600186lfs.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RCNF115QrSenyhS4+VUmTb+/09HgZQVEEH62W5zhJ9o=;
        b=CkiUhtpM44GHSJD4XKoxxRZ9K9zKqYpNgvEcvHxA1qUDLzCJq4/2aPLByG8UU45I1Y
         /AVqJFkNFYhjX31vs++3oveavqWg+0CgwQxmp5upu4UGZrTPSkkZ1anK3TvxjEvX08mi
         TaMlK+dd3v4FOruLZrXQ5ddlcyH70lTbGHpawiZyGAVwPzUsawMV3KGX+Q1NeeJICSCe
         8lOwLE6DCUk0O25YCcwHpIW/jT5y6qTveNEusAo2zGuB0gIX2s/5Uec5gLf8FgZMcRht
         CZT92N/Nz46G3D3/8EhwRx67hpZdh0Asqv0W/6SctFoNNlwMz+xhAmPta3F0tPjny0WP
         oWuw==
X-Gm-Message-State: AOAM53326D7MQFbrq9QT0ZpoQwiPp9qoVFTYASSZEP1fTMqTlSa4vx1e
        nxfLtzbTMppk38Npik8GYYVKX/aiv9QcEhTwBsFPa9IihbVehxO2DFcvl8Vu4uFqlSOZo7I6HiL
        vGOZInF/nTtlBJ9h5CQqUDDZ4SD2YaSPFB3rJSQ==
X-Received: by 2002:a2e:a596:: with SMTP id m22mr6316949ljp.262.1633007820688;
        Thu, 30 Sep 2021 06:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy09YmqEMO9K/DkFa/bZTei75H3U3dhuXPBwEhVk4C2y92R9e/R2akQYKqXZiF/L9tEarb/qQ==
X-Received: by 2002:a2e:a596:: with SMTP id m22mr6316925ljp.262.1633007820526;
        Thu, 30 Sep 2021 06:17:00 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id f26sm341405ljj.82.2021.09.30.06.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 06:17:00 -0700 (PDT)
Subject: Re: [PATCH 10/12] mfd: dt-bindings: samsung,s5m8767: document buck
 and LDO supplies
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
 <20210928084949.27939-11-krzysztof.kozlowski@canonical.com>
 <YVWx+08egbGPiYYt@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e5ab2ba9-e4ae-30db-8e54-8af42d7f3bf1@canonical.com>
Date:   Thu, 30 Sep 2021 15:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWx+08egbGPiYYt@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/09/2021 14:47, Lee Jones wrote:
> On Tue, 28 Sep 2021, Krzysztof Kozlowski wrote:
> 
>> Document the properties with regulator supplies for bucks and LDOs.  At
>> least one board uses it (Exynos5250 Arndale).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
> 
> These all need Rob's Ack.

Correct.

> 
> But can you start with reworking the subject line please.
> 
> It should be:
> 
>   "dt-bindings: mfd: <component>: <Subject starting with an uppercase char>"

Sure, just have in mind that Mark wants them the other way around for
regulator. :)

Best regards,
Krzysztof
