Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC35C63697
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 16:51:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95AE422227
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 16:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="llhVzZqd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbgKSQv0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 11:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbgKSQv0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 11:51:26 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15E8C0613CF
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 08:51:25 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id u12so7213097wrt.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 08:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=IUxoppfqaSQfsgS7sOWn2afMXOkizKDwhUSj+oVrHcg=;
        b=llhVzZqdVGyYKolK2rraEMEYaT5uKZuLlzaCVTV7wB36pCE+nauvjqnkPbaluaKEev
         rs6/8MjTfbiEc01TqH8nOqxKK7+z2MB3uQeCdPaLstqYdkYSNhnW4eO/3YFpy9z0BoxT
         wGyjkYDjZANdzUoZ8nsy4j8/1tmhU2Xa/mII8VKwYZcXtbBll1KcsE+AD12sZ6BceRXJ
         ehavDdTG7CkvNGgHOgpTLoScRLGnRj1LgTd1d5d3OG9z4bAg0BIXcXePDIo18CKUteac
         Un0IwT6ElV5SGgaR8BmBzwqzv5zLTPT1YUHtnmzZV2LB/mmhTfGr2xx+O0/uFHqngrhT
         OBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=IUxoppfqaSQfsgS7sOWn2afMXOkizKDwhUSj+oVrHcg=;
        b=N+0tiWiabQIR1dP2UFH+SsrTDvaSZ2dkAKp4OCDkr9RvdIIuMmOlTTUJLyHS7/GB5R
         7ZZAOiq8zNejtbWlHZIqzvDOCBCUSb/END8iRcHjex3ys7ASFKXN9XVKZDzeoZc2gAkN
         uA8x2vE42gQ4V9pv8qYubKgs24IiuCaA79iTKKdFZlqVaJyh7bStZ3Lfj74kilnLZ3jQ
         dgZjJJHLQZlRofKNbuu1XrpV4zVO2TbJy879jDFghd3F/L+ylE3KUAw+/9TIRGFlq2Nf
         u82p0waHPyiMNKyR1Jn8keZUwkxxFxE7YO4E1GYVpsUI2RGVhoCBF/vP0Ahxw01L2jNr
         k+Yg==
X-Gm-Message-State: AOAM530jJ4JtY9iQ1vWlv+eI7p0Zqw42REZ8XK4dCmk/5/I2gg4KvJVG
        U08N8A+xncv5zz06iYrCqhWZU1+xg+5vAbAV
X-Google-Smtp-Source: ABdhPJwnkIXJoN3H0698Zt2fIJTEH3pRamAve0MklS/Z6BoCyJmmYSy6ATWf3ecrunxy7/KcKK7KHA==
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr10950862wru.287.1605804684487;
        Thu, 19 Nov 2020 08:51:24 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id o10sm642195wma.47.2020.11.19.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:51:23 -0800 (PST)
References: <20201118190930.34352-1-khilman@baylibre.com>
 <1jzh3d8fal.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] clk: meson: Kconfig: fix dependency for G12A
In-reply-to: <1jzh3d8fal.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jwnyh8f3p.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 19 Nov 2020 17:51:23 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 19 Nov 2020 at 17:47, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Wed 18 Nov 2020 at 20:09, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> When building only G12A, ensure that VID_PLL_DIV clock driver is
>> selected, otherwise results in this build error:
>>
>> ERROR: modpost: "meson_vid_pll_div_ro_ops" [drivers/clk/meson/g12a.ko] undefined!
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")

And applied, Thx

>
>> ---
>>  drivers/clk/meson/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 034da203e8e0..9a8a548d839d 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>>  	select COMMON_CLK_MESON_AO_CLKC
>>  	select COMMON_CLK_MESON_EE_CLKC
>>  	select COMMON_CLK_MESON_CPU_DYNDIV
>> +	select COMMON_CLK_MESON_VID_PLL_DIV
>>  	select MFD_SYSCON
>>  	help
>>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2

