Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F135C47083
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 06:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 322BC6121D
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 06:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhFDG1u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhFDG1t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jun 2021 02:27:49 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144EBC06174A
        for <linux-clk@vger.kernel.org>; Thu,  3 Jun 2021 23:26:04 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id b145-20020a1c80970000b029019c8c824054so7182156wmd.5
        for <linux-clk@vger.kernel.org>; Thu, 03 Jun 2021 23:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XWiGoQ9cXot7jOVjL8R3Jy7JG2GE+CLSEjZfNbVzYKM=;
        b=rFhr0ddRev6e86NKbMfJoCaI4Iidw4ZhSOXXMJVaC1ktXUrOxb4xBTrFcDAfICXHAT
         xZ7NieCTxYzbhGbTJNuo19T6HiQYYwaKL17f1XDGlMlGRlSsBp2O2QIC6WvUWBCTSo7C
         06UalwS5DmH8sftLZan8pB27R26abP+dCznvG5MkaCoq3drpdGbCrMpcgi8yOGqFVSCZ
         E5Xbx7WYDKcmOoqEq8FzEJ4OqIosuQffXLLUf4ymbW8pJWx404vTtDajxVRKrTRhd7Ka
         4U5w2R1uordGu9KS51hgOUwLQ72Vc8tdSIv/N5LhqC2/ADvyTZiU+m0ULX+ZCS13wVpW
         9f9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XWiGoQ9cXot7jOVjL8R3Jy7JG2GE+CLSEjZfNbVzYKM=;
        b=rgyejGnrrOgrwUQ+MGCsoS8ByKRoqYGcznFZ1MK7vmSbAYmCNQsUBOLB78U9Rp3FA1
         fiu8qhQ8riZAqtAZK8NR2Bv0O1wwCP8j/Pi0AENEeikN/ZJnZ4hv69sBxEKgzD+RVssh
         sEsIPQIikE7m5O7lBvogiTyBq0/Mh4V3Uo8ilLHTpv6QQW9FfGAa06QKDfbrtDARH4XW
         +xINB7aOyEV/l4hJhzyQmTX5OaQtz1Mwp2eFy5jG7qcymh8ahuTLopqgdkIO0Y+XnKrV
         d811n7xmydUFef5c+S1fFuLfbH4HWVTSiwpJAJkyER0+adfTgfAcZVpF7BwpsWfSjLX5
         0F4A==
X-Gm-Message-State: AOAM531msu7QcvDWSy75en0JnAkvGqLq5uI0yJush7jEbV4b5IuEMUI7
        HND4una0+0QtKK7Ef2Ke/CxXxA==
X-Google-Smtp-Source: ABdhPJyZKXbYg8qPw1WN9jMPm9RRfxl+hLlPTeAoN6oByt7B6P//XuntI5CD0bI4w1rC1rVaOnZHPg==
X-Received: by 2002:a7b:c44f:: with SMTP id l15mr1933863wmi.151.1622787962608;
        Thu, 03 Jun 2021 23:26:02 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local ([2a01:e0a:90c:e290:71d6:f7f5:b70f:ffea])
        by smtp.gmail.com with ESMTPSA id u18sm4692482wmj.15.2021.06.03.23.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 23:26:02 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: Add missing NNA source clocks for g12b
To:     xieqinick@gmail.com, jbrunet@baylibre.com, mturquette@baylibre.com,
        sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     nick@khadas.com, artem@khadas.com
References: <20210604032957.224496-1-xieqinick@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <2288650e-316a-3534-21a7-9962796b7d1a@baylibre.com>
Date:   Fri, 4 Jun 2021 08:26:00 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604032957.224496-1-xieqinick@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Le 04/06/2021 à 05:29, xieqinick@gmail.com a écrit :
> From: Nick Xie <nick@khadas.com>
> 
> This adds the Neural Network Accelerator source clocks for g12b.
> 
> Initial support for sm1 already exist in
> commit 2f1efa5340ef
> ("clk: meson: g12a: Add support for NNA CLK source clocks")
> 
> The sm1 and g12b share the same NNA source clocks.
> This patch add missing NNA clocks for A311D (g12b).
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  drivers/clk/meson/g12a.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index b080359b4645..6a1db16b126f 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4723,6 +4723,12 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>  		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>  		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>  		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
> +		[CLKID_NNA_AXI_CLK_SEL]		= &sm1_nna_axi_clk_sel.hw,
> +		[CLKID_NNA_AXI_CLK_DIV]		= &sm1_nna_axi_clk_div.hw,
> +		[CLKID_NNA_AXI_CLK]		= &sm1_nna_axi_clk.hw,
> +		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
> +		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
> +		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
>  		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
>  		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>  		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil
