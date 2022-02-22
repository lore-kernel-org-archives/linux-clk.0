Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A65C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 14:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbiBVOHX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 09:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbiBVOHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 09:07:21 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A234169283
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 06:06:46 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7BC923F33A
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645538769;
        bh=Ex20pGdyVA6rdZa+N+dbyBUHdPBBAkWrdlc+5TIlRVw=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=LZj1lTQWYAuXyOw8wPcwYXN57oHdRLVT9Zx7hDEThfmdURtJXyXj304gTuNmsiX6C
         qi3rImXtthv/qtln2EnHrAJo+RmXE2SUrvJrCm0vpN94dPZUDSkQY3A4kia09D8RgI
         XasGZm7RvAfVG0d1ltt0lfmdHfri7AbcZfsTPWOCcxKJ3Sh93S72HwtCtFeHD1Tfys
         T/ciF2fpg/bOsy5NcS2/Tyqmm/COZmi3CXoCiyAt9u9zXbtt7vtBhpLWYyWDtdTI6F
         h0iAFHZ/9bZV3HYZrk+8+g2rYjZwYoVBzzOG+PWjHIc8L0QJNi9oJM5w493DS+tCad
         Hjg8ocD+6UnJQ==
Received: by mail-ej1-f69.google.com with SMTP id m4-20020a170906160400b006be3f85906eso5793751ejd.23
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 06:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ex20pGdyVA6rdZa+N+dbyBUHdPBBAkWrdlc+5TIlRVw=;
        b=ZRD3Z0wWLOO5M+eBFiPv4yn2klcTdpsIWHFSEjiN3YQIDT25x6mk+UKgecczZtbVH7
         mMpfN7gtXQhgqdHubXq7qM2F4fD/dXjLzaaOOEg6Y/JnaCYQFG8uBMoz3eOqs5IUCtSb
         fVEFHv7antT4Yb8M7AaxjTpmyFKtNuVRI0ZT87Fo6+wtQ8IwRujQQgbOsdXBQ73fxA+4
         0ZhA+TUAeQQJlm8gYfdT0b5eH0xHM6meXf5nP2JesOkHhd/pj+weYt1I+WDLgmT99wcL
         F+GW4PJ7y54aZJ+hV/EuKpJ14wchbBwvAneTaemf0ci7j4I3qnB5oOgcQqYEDN5wUAZc
         1BsQ==
X-Gm-Message-State: AOAM530yjN3oZ2yAh8YSl9ZHe4FYU6Ny/qHImTe4LPpHGCGCttm++MPb
        r1M1JVJwAH8INx/OEFqUNOUYuuJZ4vx2DwmRZut6+7Ezqo3mU6pET0u324kMnXu+8z5qlmGSgQm
        G66tHxO+ww5t/1NQSPffpdQGRYsyzSbb01RaEjA==
X-Received: by 2002:a17:906:bc46:b0:6cd:e855:18fc with SMTP id s6-20020a170906bc4600b006cde85518fcmr18907784ejv.263.1645538769164;
        Tue, 22 Feb 2022 06:06:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUUFo+MCawKbbrGDwa6/+HFHVXyMoHCh84TK/EYexbFGbI2d+9a7o32GG01mcO2bXV4O9S7A==
X-Received: by 2002:a17:906:bc46:b0:6cd:e855:18fc with SMTP id s6-20020a170906bc4600b006cde85518fcmr18907772ejv.263.1645538769004;
        Tue, 22 Feb 2022 06:06:09 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id z11sm2185298ejr.99.2022.02.22.06.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 06:06:08 -0800 (PST)
Message-ID: <afa7001d-901e-55bf-b8dc-77051b1e7f78@canonical.com>
Date:   Tue, 22 Feb 2022 15:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-US
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
 <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/02/2022 14:51, Rasmus Villemoes wrote:
> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>> patch makes sense now?
>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>
>> Not tested - please review and test (e.g. by writing to dirver_override
>> sysfs entry with KASAN enabled).
> 
> Perhaps it would make sense to update the core code to release using
> kfree_const(), allowing drivers to set the initial value with
> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
> will continue to work [but if they kstrdup() a string literal they could
> be changed to use kstrdup_const].

The core here means several buses, so the change would not be that
small. However I don't see the reason why "driver_override" is special
and should be freed with kfree_const() while most of other places don't
use it.

The driver_override field definition is here obvious: "char *", so any
assignments of "const char *" are logically wrong (although GCC does not
warn of this literal string const discarding). Adding kfree_const() is
hiding the problem - someone did not read the definition of assigned field.

Best regards,
Krzysztof
