Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9266C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 20 Oct 2022 04:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJTEev (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Oct 2022 00:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiJTEeu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Oct 2022 00:34:50 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A6C402E8
        for <linux-clk@vger.kernel.org>; Wed, 19 Oct 2022 21:34:47 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c24so19238773plo.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Oct 2022 21:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NfwTq6KSXaTvBvDUTpDGop9SqmFDO5Fh0RvPOKiTWbI=;
        b=QKvBGCWBl1Jm4QBZJsY286lI5ke0f2NPknhECrH3GomakRardDXQWoS2XfjfLODLa4
         ndAwozX89v7hp3xuZtDpVQjZRuvr9GDSGmOVWaooVLtAX/owgw7OJIDB98GtYMbj3GGv
         fk5wrU1xayyLjMEloiaxV2S6Ybzww2ATFJJi3G+fd/btiKkjrqrLeq4Sz3SFS1AsXyor
         okQLzSGJaCoYAigpLcTZ4cCvurw03ql0lI5STxvpXSP+l2IwBTRctBTOqBDzQvCSlTEG
         ZI4DSxPFnB0hZCfoIhU8I2B/W/ZGmq269S+K7EVgKjCioa6z6hb02D1ZtOh2fRYTX0QC
         leXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NfwTq6KSXaTvBvDUTpDGop9SqmFDO5Fh0RvPOKiTWbI=;
        b=6K3ZNQZAID23SqYf+Fb+QXJhD2u89G4uqqPuGuGTc+WRcBq72uFvDKFc7eG12UhYRv
         aZyYbcXVgd7YVRiHjh0t6dXIDGUz04l6jN70ZNF53fO6r8ywfp4r9k7kwmjSZosyH7Lu
         CwKRRycHZMamhWkA0fhhkPWLQJWO8Yp1pRypqzA17rjq2S/elR9zjVLT7+BEUk4Y0yOV
         QynrfP5kiSzegx3xukU5GxW1VeU2yZoiqWUi+5vHw8L5pGpenQin41UWiVcvF20UhwpO
         KdrLW/F9tWLveVH/1M8B96Rnvxs4n4NPs99cV0KQWRNsKQxv7hxI5xRS+vjTKoIa1dcD
         X3Tg==
X-Gm-Message-State: ACrzQf2wddt0WWbs0FiGt/2DSXc5aVAeHWfssLpimBgYKJcRO+uIO+rp
        SQtx2y+E6DKkD75c03a1KVqWwMRMXQgGIw==
X-Google-Smtp-Source: AMsMyM6vcnMT++NWeov3vKwcKtr+Kuuvmsv8j4tn+2jkvG9WAcYV2d8+GgDtPrj1Zisu1OyLJH8vUQ==
X-Received: by 2002:a17:90a:708e:b0:212:4582:28e0 with SMTP id g14-20020a17090a708e00b00212458228e0mr838265pjk.72.1666240487411;
        Wed, 19 Oct 2022 21:34:47 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b00181e55d02dcsm11590235pla.139.2022.10.19.21.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 21:34:09 -0700 (PDT)
Date:   Thu, 20 Oct 2022 10:03:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 6/6] clk: spear: Fix SSP clock definition on SPEAr600
Message-ID: <20221020043354.y74why6vkvj3ccuo@vireshk-i7>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
 <20221019133208.319626-7-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019133208.319626-7-kory.maincent@bootlin.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-10-22, 15:32, Köry Maincent wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> There is no SPEAr600 device named "ssp-pl022.x". Instead, the description
> of the SSP (Synchronous Serial Port) was recently added to the Device Tree,
> and the device name is "xxx.spi", so we should associate the SSP gateable
> clock to these device names.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/clk/spear/spear6xx_clock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
