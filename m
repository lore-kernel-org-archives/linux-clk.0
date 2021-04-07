Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC57C433ED
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 08:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C03861359
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 08:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbhDGI7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:59:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33865 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243861AbhDGI7x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 04:59:53 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lU42J-0007z8-IV
        for linux-clk@vger.kernel.org; Wed, 07 Apr 2021 08:59:43 +0000
Received: by mail-wr1-f72.google.com with SMTP id 75so11328968wrl.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Apr 2021 01:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HrFQR6kSfLloLNA/dDhXdVEPAqQMePY3u8T0+ZWdumA=;
        b=NT4gk+Db87A1KtofZuZUs0HaG9+pMlStoKYFqwrZm7PxSBWo662AbtoZmC3CmzBv8P
         mquLXQum5OGKRISHsds1Q/HV8u3SdCtffOBOW8FNZJszGWljQEmHB4VGa9iAlDH+aHTl
         Z3OVSWyLoAzWSetvN7PvWee690uW5t0YmwpD4NVZm+KOwM5+esy+b2fWAm9E8UtnQW1C
         8yEYxgpb7VnCVSmgrIE8S3Jwz3Aol/9MBPV9n4QsG+KlP9RHhS4fCZINid8Rel0UbQLi
         wK6EibV5w0lnL/Z77q5ZWdwt8fjUODAxYwkUSew4es65EWOHWniIr6KkqLwTxlmWOZnJ
         iY/w==
X-Gm-Message-State: AOAM530uSlzJP9QBim1n5c+OxFsWokFf5Uh4PmjR0os/72GRzFHV6mMW
        WDJxpwsqu6F54wajs/H3WwSNcXXnE/gHM3skGavP+/ch+nOykJroSUerRl+XfMasXGULv5+5iMY
        5X2LLXaACOse1yTVVSqiFFBGVui35uxUKhNyNHQ==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr2989614wra.103.1617785983372;
        Wed, 07 Apr 2021 01:59:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmwG7oM+/Ygyr/WFee4xU5I6OhgemgdCLxHNjNxLusiIVwYFW8pje8fMFnJpExj31WAIghpg==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr2989606wra.103.1617785983256;
        Wed, 07 Apr 2021 01:59:43 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id e9sm22844623wrv.92.2021.04.07.01.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 01:59:42 -0700 (PDT)
Subject: Re: [PATCH] clk: socfpga: arria10: Fix memory leak of socfpga_clk on
 error return
To:     Colin King <colin.king@canonical.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210406170115.430990-1-colin.king@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <450a3b07-044d-602d-f1a0-f0748bbc5bc5@canonical.com>
Date:   Wed, 7 Apr 2021 10:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406170115.430990-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/04/2021 19:01, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an error return path that is not kfree'ing socfpga_clk leading
> to a memory leak. Fix this by adding in the missing kfree call.
> 
> Addresses-Coverity: ("Resource leak")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/clk/socfpga/clk-gate-a10.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
