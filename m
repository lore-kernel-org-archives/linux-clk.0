Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C159C77B75
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 04:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjEQEev (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 00:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjEQEeu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 00:34:50 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1E930D6
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 21:34:48 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6439df6c268so188308b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 21:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684298088; x=1686890088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tG1kNE7UYC4wkLWo37BI0qTN7B7iDGV7Ktvk8Nl+rtI=;
        b=MuMlnckAVwMdyNsDsScgi01FUkHiJREx6ygDmlCSAYvvmS3ShaK7bjW6fknneksRan
         Gn8kVbl8VuR04QDcjcOn2IZnJGmGvyU3zvW/c88xIqeULitJJZH1zckUbCGEjZ6OnzNY
         SccIUkQ0mjHOVZhY+pO8e52TMG5owPuhTKBYAAyxQO2Hbyv+n98NDE5vZ3hvvaIkGy3E
         fQ8+2G4hADpDPjI5VuCaB0gvDfMtVanZtS32ty7ZxZB+attc6uabA3/RAs43VTmhYee8
         CIrHZkp1AmUnfoPkzvz5wo1ccJnWqrkvU+2qdLasFp/mal9wglF54LZn881g095OZqmQ
         xDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684298088; x=1686890088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG1kNE7UYC4wkLWo37BI0qTN7B7iDGV7Ktvk8Nl+rtI=;
        b=TJtr0lLWdIZATtKlu1CdTuwNdOEdtHAFpJk+NX0Qc4j3WsEcsCvU41mWSwkjbBk53n
         EIiG0EfkuylaM9TwyN5wLdEH8XGmohUQazWLzwwoAalzDdh1W0gU7Pu96cJjwVdBdvKg
         QoMsVJROZKUPdD+4NaO1xuTyGn7dHTAgX57XUNDkSyZMp1kdMdrWCNBuy2sDeZI8XwVY
         E2hRZKv65c/Ic4nxq/4fWdtcv5QJxK3D8TFTSQQ97fIzuBBdyOY5H3ELRiV3HAFy4hdt
         i/eNLNyuMk1eYFoRoiBPphCt6VBsK2vo67w4CpISGLnA+gPfLPJFZQekt47DUQaB39fz
         8Giw==
X-Gm-Message-State: AC+VfDyswTBU/kiu7A8ScDmW0Vz2HhDB8n25pghQxXkhyCr9e3aI43IS
        PBl1+6nZj35jqv9IHmvDnjjM8g==
X-Google-Smtp-Source: ACHHUZ7ZntCzPC6Kae1pDbO6DYSSci6YTuhSOAjEZpHtW1xnkNQFCJpFTJqzEf+yQY02x5W3U6f6sw==
X-Received: by 2002:a05:6a00:c83:b0:64a:5cde:3a8c with SMTP id a3-20020a056a000c8300b0064a5cde3a8cmr24779255pfv.28.1684298088145;
        Tue, 16 May 2023 21:34:48 -0700 (PDT)
Received: from localhost ([122.172.82.60])
        by smtp.gmail.com with ESMTPSA id k18-20020aa792d2000000b0064cca73d911sm1328858pfa.103.2023.05.16.21.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 21:34:47 -0700 (PDT)
Date:   Wed, 17 May 2023 10:04:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 12/13] ARM: spear: include "pl080.h" for
 pl080_get_signal() prototype
Message-ID: <20230517043445.qhc6ebfq4pwvgiqh@vireshk-i7>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516153109.514251-13-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-05-23, 17:31, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> pl080_get_signal() and pl080_put_signal() are declared in pl080.h
> and defined in pl080.c, but this file is missing an include
> of the header:
> 
> arch/arm/mach-spear/pl080.c:27:5: error: no previous prototype for 'pl080_get_signal'
> arch/arm/mach-spear/pl080.c:62:6: error: no previous prototype for 'pl080_put_signal'
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-spear/pl080.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-spear/pl080.c b/arch/arm/mach-spear/pl080.c
> index d6b8627d2544..47243a8153d0 100644
> --- a/arch/arm/mach-spear/pl080.c
> +++ b/arch/arm/mach-spear/pl080.c
> @@ -16,6 +16,7 @@
>  #include <linux/spinlock_types.h>
>  #include "spear.h"
>  #include "misc_regs.h"
> +#include "pl080.h"
>  
>  static spinlock_t lock = __SPIN_LOCK_UNLOCKED(x);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
