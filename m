Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E65C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F1860F70
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhIGM3g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:29:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34018
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344527AbhIGM3e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Sep 2021 08:29:34 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 46FC93F322
        for <linux-clk@vger.kernel.org>; Tue,  7 Sep 2021 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631017707;
        bh=pBLtjph6RQEau8atPQFYfe8U7ef+hzqhMpxfWP4Bq6k=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Tfn1NcuVLCPge2r/rOBHzhLFGXXUuI+xApO4b8JBWTK623p4PndGmw6GBTWpDSE7B
         xTED7cB4Qd+tcTvsiPR5XDxfsATKIsz6gGLsKN9dKo3Ye2IhEGrxjj2VhMHBFD0N9g
         j0A7YeW1rjIRKWWLqIF//KJueX9xPKgINvzDZkxycWndo3UJlnq7D5zN8fU6ZpEbey
         o6DKqOG2fCTT2n+dzaojQ4bnqCGFZUmhBkpyZF0TmT7nJgsaQxHfCtpQXliAolIN8j
         oJGW9mVaN8KxSfwYvktvhtAL9sV5+Pw7oIh5wif9eXqHRBP16f9YWLW/xpxy7AtN5Y
         Fw8W3Mg+2EJQQ==
Received: by mail-wr1-f69.google.com with SMTP id q14-20020a5d574e000000b00157b0978ddeso2051432wrw.5
        for <linux-clk@vger.kernel.org>; Tue, 07 Sep 2021 05:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pBLtjph6RQEau8atPQFYfe8U7ef+hzqhMpxfWP4Bq6k=;
        b=In/cBMWUGQ48LP5A0zJz5jqvOAS79j9CREc+BCn0711YSYH0pflKS5X60ViF9W0hUE
         n98BYo4XXCCYG5RE6tiFzX+i0NaWPWZ6Y6TtbYH4xV8I78+2mtXqND0cqXPBNUhKwA5T
         Ied5EqjRxzqzBlwkc3kDtdn686byoup2YlMKlJm2TDF9g6mCKWxEDLxmSrJcBTGOnOjF
         j2SfruL2IgOQ1F41EOyIuhOXtM7qSOY1cSoNWatvDi4eM0VIfGUirJZ/ZiNa/ugCKero
         u9AdksUMHY5XBvOVrOX0EiiGr551+2Oq4TXydOwJb1fjTNju00k+TvfAjwm5omH4SmP8
         VL6A==
X-Gm-Message-State: AOAM532url7fj9q2x2RmLtorL5vlYYBkfKgiAF87SY8QQvr5qnS0d1fP
        76Pfav0xTMhjGBZR67QaloSz2p78MyKzMO9Z7V5c9uLWt5rOzN+2ujkL28Ncze6SAfJcchBxQXQ
        RmfoLZLaNOQp7p5B0uTbBjSvCwEvZCq50AoqGTg==
X-Received: by 2002:a05:6000:22d:: with SMTP id l13mr18433479wrz.410.1631017707042;
        Tue, 07 Sep 2021 05:28:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH8YGCnEpGP0h3+3v8fKMRKYSjBRI4kwHx1x58weU/Q149zGxzzjPZjvUPLf2ay8j3CaTMaQ==
X-Received: by 2002:a05:6000:22d:: with SMTP id l13mr18433468wrz.410.1631017706939;
        Tue, 07 Sep 2021 05:28:26 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.188])
        by smtp.gmail.com with ESMTPSA id l16sm8515158wrh.44.2021.09.07.05.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:28:26 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210907085115.4254-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ea98e7c6-641f-5db0-6bf8-76072cfe17aa@canonical.com>
Date:   Tue, 7 Sep 2021 14:28:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907085115.4254-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/09/2021 10:51, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
