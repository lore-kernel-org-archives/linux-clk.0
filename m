Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D91CDB482
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 06:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjJRG05 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 02:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjJRG0z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 02:26:55 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45099F9
        for <linux-clk@vger.kernel.org>; Tue, 17 Oct 2023 23:26:53 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40790b0a224so12288835e9.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Oct 2023 23:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697610412; x=1698215212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cpIkRhZpiQ7mBKbhvHUIYL8igbsZ6U9JXsFFVqtDv8=;
        b=g3/slUWXUvqoy9TRj8ATbzhArSfZTCYnw5wS7O7iBR3O2RDl9j9H/HPXxicflwdYrc
         1e/xFpGRhCU8d2J/ZkkAiHEFominNw/xy3DCB/ArEqClymlGj0BpRFQKtnD2iPbKpFRL
         iVlbnQ5AkvbxhDd7eWtu38/+ZlZVmeiwTom0NYSEXgkd7DJbEdIe5OAcOsOQ7lQH94ra
         XW840snDiThqVBFU6NjczzbqwkcgFjpUDceoHK0vciO0OQm0xf1nwZrFRxiQK/8Um5Mq
         PhDK7On6N1K+tVHLAW06o3weZ1teswZlkN0lippww8fOTPI+pxsgG6PLlPUO316NQLhD
         r8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697610412; x=1698215212;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cpIkRhZpiQ7mBKbhvHUIYL8igbsZ6U9JXsFFVqtDv8=;
        b=Y3ZuiTohPMLli10v6KU86MIvozCa8E3TUusLIjnqXmTbQq6U1ssl/A1/ZBsp4Ss4bA
         LKvkn5QUETsu6DuHv1jdhPDsHqGGigm5xk38eOkf8EhRq87hhF9bogG+wSkvLyikO9Og
         zSftP5y/SxYElgSkAPCqG5KNXB3x+rijFcyPNOVG4pXPmD8Znn1YzKbsQFqHS9NbZvDJ
         1UClJsVA1l6XCaBdhheQN1Q6L2edUJtNASqL6sI/+ikJI5y5ifeHaVkiS03+Z1PQ22LQ
         zGx8TOkdyswvkCg+z6FyPZol+O2gnfqdV91crNuh4gwza1yhZK4xdQDJt3MDWkQxJNKl
         5N6g==
X-Gm-Message-State: AOJu0YyB4qucHerxUKaeHtCkvQhzWYH0yzlpmZF9kFcU90fJf88S9tj1
        KjzsR60W6FA8iGMhrlFRqmyqeg==
X-Google-Smtp-Source: AGHT+IHRz0J5I0hRkrTglhh5Aww/sby+IxwDCGd8/Ht8ddsA0u0DmCrOJiO4Zl1/HgNO6xk1rk9uPw==
X-Received: by 2002:a05:600c:4fc2:b0:407:8e85:89ad with SMTP id o2-20020a05600c4fc200b004078e8589admr3398971wmq.14.1697610411480;
        Tue, 17 Oct 2023 23:26:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d66c1000000b0032dbf99bf4fsm1309541wrw.89.2023.10.17.23.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 23:26:50 -0700 (PDT)
Message-ID: <9ae8fd8f-7707-4ffe-8773-6db7ba5c3366@tuxon.dev>
Date:   Wed, 18 Oct 2023 09:26:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: remove unnecessary conditions
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <7782b4f1-deed-49dc-8207-b6ea06d7602f@moroto.mountain>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7782b4f1-deed-49dc-8207-b6ea06d7602f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.10.2023 17:06, Dan Carpenter wrote:
> This code checks "if (parent_hw)" is non-NULL, but then it has more
> checks if parent_hw is non-NULL on the lines inside the if statement.
> It is a bit confusing.
> 
> For the else statement, keep in mind that at the start of the function
> we checked:
> 
> 	if (!(parent_name || parent_hw))
> 		return ERR_PTR(-EINVAL);
> 
> That check ensures that if parent_hw is NULL that means that parent_name
> is non-NULL.  At least one must always be non-NULL.  So here again, the
> checks inside the if statement can be removed.
> 
> In the original code, it was a bit confusing and you could easily get
> the impression that "init.num_parents" could be zero.  When we remove
> the unnecessary checking it's more obvious that it's always set to 1.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I had something similar in my queue to submit, but didn't manage to do it
yet. Thanks for taking care of it.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  drivers/clk/at91/clk-utmi.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
> index 40c84f5af5e8..b991180beea1 100644
> --- a/drivers/clk/at91/clk-utmi.c
> +++ b/drivers/clk/at91/clk-utmi.c
> @@ -161,13 +161,11 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>  
>  	init.name = name;
>  	init.ops = ops;
> -	if (parent_hw) {
> -		init.parent_hws = parent_hw ? (const struct clk_hw **)&parent_hw : NULL;
> -		init.num_parents = parent_hw ? 1 : 0;
> -	} else {
> -		init.parent_names = parent_name ? &parent_name : NULL;
> -		init.num_parents = parent_name ? 1 : 0;
> -	}
> +	if (parent_hw)
> +		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	else
> +		init.parent_names = &parent_name;
> +	init.num_parents = 1;
>  	init.flags = flags;
>  
>  	utmi->hw.init = &init;
