Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1398C64E7C
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 18:34:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E197207BC
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 18:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GpnsUtXV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387417AbgKPSeY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 13:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731711AbgKPSeV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2020 13:34:21 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B80AC0613CF
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2020 10:34:20 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id a18so14970139pfl.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2020 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=QVvcJdJmpqnlFCLLkW4zJyWf8eFpaM5XCv8ZqOAZ0do=;
        b=GpnsUtXV4YL0rAUZfUERSVnakbTycQixdwQn/hCf72h7cri1fmlDUiNpse79XjaCw2
         g2P6pw+NVIaxFf5IhooVnjLPtIzy6VAdcLReIgAl1KDzlaY+IDcZetkYDD595W4+NKsf
         wgUh1h0rWegX0a2s9q4Zz73YgdlnUWXve3rX9xie55+JTzA6U1dtlOo7Cx2/io/BZQY/
         xc1RbdkWd2Tp3ADIiKEjTz+rkKTTHPIjaZjuOrbMACi4h25rJMElou3zDamd6G/fPyua
         eSv5tt2toV6jHCTL9eQgGyU1CWr675DHtGd2rxlldeYiJP0sp8J6CRp2tQ0x1SWBM5Vs
         QVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=QVvcJdJmpqnlFCLLkW4zJyWf8eFpaM5XCv8ZqOAZ0do=;
        b=MYCX85imcUpsAJgh2c3g8JTN4ROpQQWHFQaYzKhSsfbTPkPvjKfZ+cvcHKn2ApvEoU
         6PXEEQTTnLDtElzJYvgqwvV+1KNaoJ5D2SH6Kf6TWhKsni5DIfOoRX8pKy/KoZEKGwg6
         TT16ZNzDViettSFOsvElhAP0s5WEKVnXTi6HDq0u/rzH0OGEmOJeeYiXDwMEkKpjXc5E
         ZG/Kv90/g57AqD5cfyuvyiAP+k+H8Tv7ukQVjyj5rM+/v4cvHxT16ubdWFGZ5dOVAQ0v
         FNKWZIE2ckato/fw6o6GsNmf5QoThJv3WwWtsRdSlRwHTmH8J7oWhS1OxSDywrQ6i7yx
         MkwA==
X-Gm-Message-State: AOAM530PGssC+wEaoY/M64P+4Br7plImxaA7G2p62vkNqe7PmzRytKVI
        FwDWqU7aKXHmmt2DWCmdXn5Exg==
X-Google-Smtp-Source: ABdhPJx+jGW+KoJEtsBTl+HxuBZ6EhpovPRpR3LhArqlcwWGbl3byEZO0CeKNKnYCF0Ey7VMLWtNog==
X-Received: by 2002:a17:90a:d591:: with SMTP id v17mr261644pju.4.1605551659589;
        Mon, 16 Nov 2020 10:34:19 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id j19sm20395117pfd.189.2020.11.16.10.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 10:34:19 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: meson: enable building as modules
In-Reply-To: <1jft5hpq85.fsf@starbuckisacylon.baylibre.com>
References: <20201109233622.23598-1-khilman@baylibre.com> <1jft5hpq85.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 16 Nov 2020 10:34:18 -0800
Message-ID: <7hsg9940d1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Tue 10 Nov 2020 at 00:36, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Make it possible to build all clk drivers as modules, but default
>> remains built-in.
>>
>> No functional changes.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>> Depends on series adding new API to get clk consumer from clk_hw:
>> https://lore.kernel.org/linux-amlogic/20201021162147.563655-1-jbrunet@baylibre.com/
>
> and
>
> https://lore.kernel.org/r/20201021163847.595189-1-jbrunet@baylibre.com
>
> Once these notifier allocations are dealt with, I'm happy to take this.
>
> One minor details though ...

[...]

>>  config COMMON_CLK_G12A
>> -	bool "G12 and SM1 SoC clock controllers support"
>> +	tristate "G12 and SM1 SoC clock controllers support"
>>  	depends on ARM64
>>  	default y
>>  	select COMMON_CLK_MESON_REGMAP
>> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>>  	select COMMON_CLK_MESON_AO_CLKC
>>  	select COMMON_CLK_MESON_EE_CLKC
>>  	select COMMON_CLK_MESON_CPU_DYNDIV
>> +	select COMMON_CLK_MESON_VID_PLL_DIV
>
> This looks like a fix which could be sent separately with a fix tag,
> doesn't it ?

Ah, yes.  This is a fix which should be sent separately.  I'll split it
out and resend.

Thanks for the review,

Kevin
