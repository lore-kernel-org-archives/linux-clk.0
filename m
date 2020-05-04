Return-Path: <SRS0=oKF9=6S=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78DBC47257
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 08:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 976B920735
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 08:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q+Aqs4SE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgEDIze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 May 2020 04:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727951AbgEDIze (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 May 2020 04:55:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84206C061A0E
        for <linux-clk@vger.kernel.org>; Mon,  4 May 2020 01:55:32 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z6so8094670wml.2
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2020 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SNjxJ48X/rl6hjN+vla+LpQhWwTuERynNvR/GbTeioI=;
        b=Q+Aqs4SEzZUxEE/Je3bV89qqZWPmWByHUPk2Q5BTBry6TFVZVOnnhwnmjU1OAvkZ/P
         ARidv/8x94rTCrUOnz7r22dfO2BaCna3yb3sUyvDNtj4zf+kN3GN8WfA6kRF4Jig9K+T
         Teybf0N/SonFwXVqDUIQsdg3bBOgk/yj3vSbykPUUaUjYUFg8bSsOdbYJzvQQnxtf0E3
         GxHjYw/xwgs0LLNTdNK2kEjqdEp4QBI67QWq06ncEjDasu1kDVNQ9wc5MAgfSM9LlygC
         fFRHmHCA96Q/eB2Q0jvASh8wbWzYpQDtT64KU0vp2AKI+7TJnLRt9fqpsoVn3EWHfjaA
         iieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SNjxJ48X/rl6hjN+vla+LpQhWwTuERynNvR/GbTeioI=;
        b=lJWiGDFj2I9MJgyuub646K+TE9gbBllaOVLcCE6P7bvU2DcBXVxauOyohlvnxjXlFb
         p56QmJA1S4uFSV207ra5iyvNmZ5NDqkE0XNasWQJQU6w2dSwJstnZUBbRL4lvN5QUYUl
         /46OvT9HMALiPvFk+RXhsyIpwX8ERYOIvhpSzFO13CbYaNCTUy0qHmCyjBSJOfazNpDY
         fi2+rNpr2LM5X0h45powGoGGpdr4eBKLudjGT/tchTG254u+E3ma3Mq1S/foX66dPngz
         HHCPcfbdz23csnb4mFrwcsvSJqMCy8pzbSxZ3UfD2hF2rVeOlmwZ6ZU0h9/1qCubrBO8
         3HSg==
X-Gm-Message-State: AGi0PuYFMUwjR226kMHP8fIV090LspLnGBTYiGzx5tio8sXdf8CwDuen
        pwP413BR+9jSrpES6ipnC+npKA==
X-Google-Smtp-Source: APiQypLIu5XYyLvjvzr6H38pPYriIIo9ay0MJUR3mN66/1O4dEqAKKbIpFUupbQN4qf60YvJbNiK8A==
X-Received: by 2002:a1c:9d84:: with SMTP id g126mr12452726wme.184.1588582531295;
        Mon, 04 May 2020 01:55:31 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id u12sm12941324wmu.25.2020.05.04.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:55:30 -0700 (PDT)
Date:   Mon, 4 May 2020 09:55:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Kevin Brodsky <Kevin.Brodsky@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 08/16] mfd: vexpress-sysreg: Drop selecting
 CONFIG_CLKSRC_MMIO
Message-ID: <20200504085528.GH298816@dell>
References: <20200429205825.10604-1-robh@kernel.org>
 <20200429205825.10604-9-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429205825.10604-9-robh@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 29 Apr 2020, Rob Herring wrote:

> Nothing in the VExpress sysregs nor the MFD child drivers use
> CONFIG_CLKSRC_MMIO. There's the 24MHz counter, but that's handled by
> drivers/clocksource/timer-versatile.c which doesn't use
> CONFIG_CLKSRC_MMIO either. So let's just drop CONFIG_CLKSRC_MMIO.
> 
> As the !ARCH_USES_GETTIMEOFFSET dependency was added for
> CONFIG_CLKSRC_MMIO, that can be dropped, too.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/mfd/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
