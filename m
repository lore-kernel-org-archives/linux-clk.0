Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D761DC433ED
	for <linux-clk@archiver.kernel.org>; Thu, 20 May 2021 14:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEE17613C4
	for <linux-clk@archiver.kernel.org>; Thu, 20 May 2021 14:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241299AbhETOHX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 May 2021 10:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238081AbhETOGC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 May 2021 10:06:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCE7C061761
        for <linux-clk@vger.kernel.org>; Thu, 20 May 2021 07:02:43 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h4so17764003wrt.12
        for <linux-clk@vger.kernel.org>; Thu, 20 May 2021 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cz0/1ZOfO54oR2U6DPLhE6s49BLA+WlRGKus2Uz7Bfs=;
        b=A4kzq6aK3MU8PNd4Cy6MM9AtUaEz7OChC7pxTVn+dWRwks8+8dKRxsEzgY98KKjuPG
         +DgjsXh5+lw/0IGFjmLkyukjDNCijkCsePiO8AWP1Alz+H9xHlN+pkFYCd+h/lP4Sldw
         NslR9lRh+Lg3OQ5/J1Heyj81CUIsGZ//OEfNc2bvMi64tio1ZZyQl9BeSJHDCr3KG3kK
         qYGlM8ctm4ckmirs53vsz2zB+BOoK201eGbj52PCASR9Iz5Ht0KVkxZr7UJjCZxqBUnv
         NJJlu5TaaV0UTFg2uOkfQFi5/9IYV55JKZwcJAGowg96Z4m3C6uImI3qdGAiJBwfSMll
         aFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Cz0/1ZOfO54oR2U6DPLhE6s49BLA+WlRGKus2Uz7Bfs=;
        b=nAJYmGI9RIxVrzIwpU+aI/zZI8gpGXr/lBjzYxhcpbqXNI75fGTcT0vX4+1ct6uLrd
         iH8VllCgpXPh+SaU+R4gmfusWdKGSfs6oR+dmDGZZCENJRbIRaP/yaYpOssi4rwOzo02
         YgAnnQGPT0ESdJt4BH26BVCTrPCRrx4B0CSIOzalEJrU0e51/RDKzkYEgdiu0CkBKFjd
         J2kSKTHz9OinQfHroR0qPj8yXQGzQ1ZYJglhgkskSMMUR+cEfEl2EHll4LwcqR7S8alv
         lvwi5qFNTb0/TuEQuDfODfwDjNeypd+ZIrE9S4kbAQgulX/FdhLzhPRgfsCTinxtRAUK
         FsZw==
X-Gm-Message-State: AOAM532Ta7Rg9OG5LFHx3uRiPxM0RTjgDfPzJkTsd7LWkHZoAjZJgLK5
        g6yg3F0Xl6Jheg4EmsJDtVIuNg==
X-Google-Smtp-Source: ABdhPJwydengR9TjNPw+zXzBcINPg6RpLDjSqmmkEqNHkwp9baP1lWqBIluKFtAJTmEU5jo689Wc7w==
X-Received: by 2002:a5d:4b89:: with SMTP id b9mr4472110wrt.238.1621519362300;
        Thu, 20 May 2021 07:02:42 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d88a:b479:b222:83bb? ([2a01:e0a:90c:e290:d88a:b479:b222:83bb])
        by smtp.gmail.com with ESMTPSA id s5sm3260428wrw.95.2021.05.20.07.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 07:02:41 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210429090325.60970-1-jbrunet@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <df839588-1ff2-2d7f-4364-2b0d8942d6ef@baylibre.com>
Date:   Thu, 20 May 2021 16:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429090325.60970-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2021 11:03, Jerome Brunet wrote:
> While some SoC samples are able to lock with a PLL factor of 55, others
> samples can't. ATM, a minimum of 60 appears to work on all the samples
> I have tried.
> 
> Even with 60, it sometimes takes a long time for the PLL to eventually
> lock. The documentation says that the minimum rate of these PLLs DCO
> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
> 
> With factor range changed, the PLL seems to lock quickly (enough) so far.
> It is still unclear if the range was the only reason for the delay.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index b080359b4645..a805bac93c11 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>  };
>  
>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
> -	.min = 55,
> +	.min = 125,
>  	.max = 255,
>  };
>  
> 


Sorry for bothering with the DSI stuff, I'll fix this when we are ready to upstream DSI support for G12A.

I had this patch for a while in my integration branches, so:
Acked-by: Neil Armstrong <narmstrong@baylibre.com>


Neil
