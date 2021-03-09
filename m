Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F97FC433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 08:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A25064F69
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 08:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhCIIuX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Mar 2021 03:50:23 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59363 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhCIIuC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 03:50:02 -0500
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lJY40-00034u-M3
        for linux-clk@vger.kernel.org; Tue, 09 Mar 2021 08:50:00 +0000
Received: by mail-wr1-f72.google.com with SMTP id h5so6095819wrr.17
        for <linux-clk@vger.kernel.org>; Tue, 09 Mar 2021 00:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SPN8vZGI8qCPyOxRkgbIoU+nCJADrRpUpS5VZAd17hQ=;
        b=nVYvegJMT4QJulyB+pg18ihVv8uHl+oXyxhTCKBLPjIiujINA7YJaPH7xFtpvC37bK
         fKzm3j2A62tKloU/wdZusdnuUPQvLfLZwbaJiV7najdCnwUkR30UK9bCwF1L/1NHzY7L
         ICMsQ8DA1z8ex1hLgSh/SLe0CGpKDYSPD9hKpkmTCi6G4TzjLlzOYhUgWbRilEgW5kxj
         XA8LPfvyiqocSlGELxDgif+p+b5u3vQMBRFjWWeptW3Xs8R2MOIIVzcF4aJwKJWLUhv+
         LMXvsMS1LBdgHb/nmbcKxaBNW/M7Uvsoxn60ixvbK/Cy1orT648+a9GYOl0qLHHlkLrB
         iP6Q==
X-Gm-Message-State: AOAM530zRjcmF6UnFjifaeyy/rs/9OFcTymxuS4Ae3tL1Hqg6VWSEZmg
        XuR03TVAerTSr0H76PITgF+Ay48Eygul72Cbsnkpsx0c6mq5sH/iIfOpjmAr3TxwGoxIwk/LAnl
        ZXef31c9baWVbu/aZYY3wJG6D8F3Isoeqaoo49A==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr2773970wmi.151.1615279800329;
        Tue, 09 Mar 2021 00:50:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrJZNyJE9B32wem/EqH35cn/jWxU3fIpyhIw/276Lggs/nwF/mHfMonQ9ARhM+9bPT/mJeAQ==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr2773952wmi.151.1615279800191;
        Tue, 09 Mar 2021 00:50:00 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id p27sm3068427wmi.12.2021.03.09.00.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 00:49:59 -0800 (PST)
Subject: Re: [PATCH 3/3] clk: socfpga: allow compile testing of Stratix 10 /
 Agilex clocks
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org
References: <20210308182339.379775-1-krzysztof.kozlowski@canonical.com>
 <20210308182339.379775-4-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9c8109f7-47b3-a865-5bd7-656b7c3c318f@canonical.com>
Date:   Tue, 9 Mar 2021 09:49:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308182339.379775-4-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2021 19:23, Krzysztof Kozlowski wrote:
> The Stratix 10 / Agilex / N5X clocks do not use anything other than OF
> or COMMON_CLK so they should be compile testable on most of the
> platforms.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/clk/Makefile        |  5 +----
>  drivers/clk/socfpga/Kconfig | 22 ++++++++++++++++------
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 12e46b12e587..9b582b3fca34 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -104,10 +104,7 @@ obj-y					+= renesas/
>  obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> -obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
> -obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
> -obj-$(CONFIG_ARCH_N5X)			+= socfpga/
> -obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
> +obj-y					+= socfpga/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> index 4922cc35f4cc..de7b3137e215 100644
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -1,13 +1,23 @@
>  # SPDX-License-Identifier: GPL-2.0
> +config COMMON_CLK_SOCFPGA
> +	bool "Intel SoCFPGA family clock support" if COMPILE_TEST

Kernel test robot found here wrong configuration - possibility to
disable the clocks with compile test. I'll send a v2.

Best regards,
Krzysztof
