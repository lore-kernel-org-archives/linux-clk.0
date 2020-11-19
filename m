Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC11C64E7C
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 16:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C5ED2222A
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 16:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="teLgHfrA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgKSQrS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 11:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbgKSQrR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 11:47:17 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70731C0613CF
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 08:47:17 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so7111946wrb.9
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=zchuhEm0vT5ynG8KlZ4xLj8iDkIzG/5Ra4QZPMTjKtM=;
        b=teLgHfrAXPCaab7EgYkxY8biXsFr1CQ7/yZVtDevYa8cOeUBQHaXUr2vue2nWiOsRa
         uHZ7wjs0UcKg18Azlna5IFlZHJZ1Z8h2TeCoeO/TDz7tTmtcrWbM8lQtqySLmnuvH0PY
         e9jnsKW/SPjebjuNAGaT2G6Q5QS+Nuza7TokLvF4S6s8fMmJxHOVGM7+dKBssc0c45QE
         mjk6wNn3wNEFgeWYr82WtB1nrMM2dHwYtSmnX4U6ZypKmCjCLD7Fq1nZqNRaVJ2r9Gfe
         ZB0tIqwF8WB5s/8sejLr0IeTMvv/RQ50NMo2BmC09AlUORtxtwpGWWq8tjZJv9OxmbFQ
         nruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=zchuhEm0vT5ynG8KlZ4xLj8iDkIzG/5Ra4QZPMTjKtM=;
        b=mCYvT6GlU8tL/vMM1mFkOUfR5xTJdIF3nqQmlriD5eFEJG9VxUPk71lTkO3gALEN3h
         DVFwEZr6LnrmJ27+3TstzxV3E/8VNm72o2YszlMBnqYexSN915jz/7h3t3VyN8UmWL6v
         w7S6rL9ajOilTszp+YVq5KLYO1yowESVuyq/JgJBiROhaW6KgNhU0Bv+94uN6ild+uIM
         eh0LiXdl4jGQbH50CFNjMpsnzcJfMURYXzHg6jnpjBeqeNOHUWw+0jTg4F35wTWuVcRj
         ZSbCN0wcnA/B4Z/OfSo2oY/StUzRa9T3KAZ/YrohBpUyvMnfpiFUowGoNLu8j0Q0KFsx
         vqoA==
X-Gm-Message-State: AOAM532zWZ6DTt7qHwIi7zsd9Hg1Iw/YhFLMu7MWcFt7NQAdGm+OYrPy
        jbKUd6vcQKoqiTYTSMMbcNJDeg==
X-Google-Smtp-Source: ABdhPJwuw665IRQWBR0WeOLYFbpO68TS81GPWNJy8/BMBgccH4mf6tkM0TDusJannl0uKrlaZRXEdQ==
X-Received: by 2002:a5d:62ca:: with SMTP id o10mr10878705wrv.422.1605804436202;
        Thu, 19 Nov 2020 08:47:16 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id w17sm409626wru.82.2020.11.19.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:47:15 -0800 (PST)
References: <20201118190930.34352-1-khilman@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] clk: meson: Kconfig: fix dependency for G12A
In-reply-to: <20201118190930.34352-1-khilman@baylibre.com>
Message-ID: <1jzh3d8fal.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 19 Nov 2020 17:47:14 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 18 Nov 2020 at 20:09, Kevin Hilman <khilman@baylibre.com> wrote:

> When building only G12A, ensure that VID_PLL_DIV clock driver is
> selected, otherwise results in this build error:
>
> ERROR: modpost: "meson_vid_pll_div_ro_ops" [drivers/clk/meson/g12a.ko] undefined!
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")

> ---
>  drivers/clk/meson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 034da203e8e0..9a8a548d839d 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>  	select COMMON_CLK_MESON_AO_CLKC
>  	select COMMON_CLK_MESON_EE_CLKC
>  	select COMMON_CLK_MESON_CPU_DYNDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2

