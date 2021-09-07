Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9170DC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A72C60F70
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhIGM3g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:29:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33994
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344149AbhIGM3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Sep 2021 08:29:12 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 850593F329
        for <linux-clk@vger.kernel.org>; Tue,  7 Sep 2021 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631017685;
        bh=i4ZGHX9mGJzs9Nqqb56NmrxFgegnuQrVd9flgc2QjQE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NHrQCyQEmLonlr6kRYIqMrZ7qmGrWYBsP38XNe8JEz28xYKLK1CFPplV+RKKy8Bdv
         NQ5BhRwzZOvApZuXWWigbo3vszinbNWOl3gGsZlDtcmPMaaFOkbY6k7DSbJMKxzj4B
         kZZZpE28mhQIZFR1UP1lbZZ/bEXU9Vi+igcrZg1dYNFBBlh7YM7Oyd53yu/2SvlmjV
         LHDeoGc5UIsJa2aCRYAbMj38g8ZXpeOtYNNnhNvwI6Y+RYIGi1vtwPbmQhFEG5Oze9
         1Mr2wvVO02KZr2vzjY+j3dU7dH/wREo06AabxCV+fJAqocQ+REYAa+KavC8c5C6JZi
         8dp6rJ4yrt++Q==
Received: by mail-wr1-f69.google.com with SMTP id p10-20020a5d68ca000000b001552bf8b9daso2052591wrw.22
        for <linux-clk@vger.kernel.org>; Tue, 07 Sep 2021 05:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i4ZGHX9mGJzs9Nqqb56NmrxFgegnuQrVd9flgc2QjQE=;
        b=TLG6y4vAogU4NMRsCUYkTZ8Ps95V9OKiPpq4vwW9rmpT18u2I+k3AsvSZoiRRzRM3l
         ZL1yuW2s8toIPVp/PTj9TU4NDbzrAlKdCzw6IOVnMYk4gS1kDB4+6z2rq5MOltxRQqsr
         M3OB64HQH5g4wyOpK9oEZrvyE1kknqYKX9jJw0/W4ltjBIecq9DlH3q9zTU7sobdThLf
         TU+ubPBmJAM1n2/tda3+tPlWoagmyaYp2KHhz8ximnOH+xXP+6qHmnXcPyY08CgJOx3d
         e0GJoJpG+hsSkYo6Ab5rxTvJ8uGVBdwQ9XvNTA9vIqtUPyGcPMw11Ze9AW4+QHPPbHAG
         UZVg==
X-Gm-Message-State: AOAM532uQ6XiILs0unblujLoWc9WyYcadrFSxgEDGNcwGdrVZ2vUuFWh
        i920NftPtPEzvF/9Sk65Ua/o2LxUmdUKboueTdGfYYrlYVlt8zlnx14bxF/JnHVXFGwKysdqosJ
        JzR7QPot8QthgZ/Kmzx+uEtMKf4pcvMVqTgi2bA==
X-Received: by 2002:adf:9d45:: with SMTP id o5mr18367591wre.226.1631017685247;
        Tue, 07 Sep 2021 05:28:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxLSApf9aQAMF6rcSiRU6Die4JjL+/6CF8DzzLKlDlLHeOBw4SUW1cF3S2JUunqQGD5sLqZQ==
X-Received: by 2002:adf:9d45:: with SMTP id o5mr18367571wre.226.1631017685071;
        Tue, 07 Sep 2021 05:28:05 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id l7sm2333190wmj.9.2021.09.07.05.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:28:04 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: exynos4412-isp: Make use of the helper
 function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210907085107.4203-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2b378450-4ea5-e30f-750d-9e20bc1d113e@canonical.com>
Date:   Tue, 7 Sep 2021 14:28:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907085107.4203-1-caihuoqing@baidu.com>
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
>  drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
