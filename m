Return-Path: <SRS0=MiPE=CG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BAAC433E2
	for <linux-clk@archiver.kernel.org>; Fri, 28 Aug 2020 13:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D93320825
	for <linux-clk@archiver.kernel.org>; Fri, 28 Aug 2020 13:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TXNXRBoW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgH1Nwi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Aug 2020 09:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgH1Nwa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Aug 2020 09:52:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40828C06121B
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2020 06:52:27 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so1398258wrw.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2020 06:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=bBT41PTjpkxeOtnmEoEMjQZW/IInuRmPz2VzLucUDlQ=;
        b=TXNXRBoWbCfR99+m6BuMsne9w7crcganml+VXuM1yhnfzWuyUSH8bIO08cnzoDO+m2
         PoOxZ1XZCWmVpvGmwWQSOXJw8a5zy9utICHylZEC+OGmvvM+QZIjILR4hLtGB+1X93Jx
         O/E3s9+nzriK6Li1EY/CGNZUVV1GIWCo88e38bMCc/Z8OHPMRXlEVyKa2H1XaGeqI/x1
         U20TwxVeAX8bhrWFpGEgnobemVoi0YqygRdkRKKfARSa4l1O3vW3v11LyqgF3ItXNNHq
         Wxy6Sa5yhI+DBZLt7+i/9zzueqt/+yzl5+rlXPifogidu42yZjHC28pPr+inXDVkeczj
         RHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=bBT41PTjpkxeOtnmEoEMjQZW/IInuRmPz2VzLucUDlQ=;
        b=MpP1EN1r2rMa3e39t1JAXxgEBB2l1WwVCvDacsFvrDzVhJ4l2QrY6WqjCghiVr4tYV
         Pe6gYwF7M9RXTZL/ID0iSG8JVXTmR87v3UVseU4cbX2s+HBA8m+Lh3mphMpMmfD7GbDr
         4T+F0U3NJ5cnJsNbqaoatTbuahAu9rxDwq4UGihJkUR70OJsYWZ8yW+ZJlMJnsBdisvq
         4dC7ou7Zzti7sU8KyoqAz6XXfrXq1Lf/sX2bJXZTHJbmAg9Pbqh1TxQOfu0lUy43RRJ8
         JDapA0XStBCx+zyX4LPFY2R+lvC3lCXkpa6b4l9aS2ajhFmZWL1e+kT+cmp+NLFW/8HH
         oxvg==
X-Gm-Message-State: AOAM531ShHZUKzL7v4SLmIZex1qHLIHbsFO8M2oGTjd9NJNNAdMxzEYx
        Cqrx3TWQHo8NIS4cwLPSMZKWdA==
X-Google-Smtp-Source: ABdhPJwxGZcjjbY0GowOYDW+dLIMgvBwqE/j+jaly5n+zkPdWErtdEEG2G5gKi3TLyKaKwyipUXMwQ==
X-Received: by 2002:adf:e78b:: with SMTP id n11mr1624422wrm.256.1598622745919;
        Fri, 28 Aug 2020 06:52:25 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m11sm1993303wrn.11.2020.08.28.06.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 06:52:25 -0700 (PDT)
References: <c33df0ebe8be16b56741ce7f873221ab9087a0a6.1598564619.git.stefan@agner.ch>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stefan Agner <stefan@agner.ch>, narmstrong@baylibre.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] clk: meson: g12a: mark fclk_div2 as critical
In-reply-to: <c33df0ebe8be16b56741ce7f873221ab9087a0a6.1598564619.git.stefan@agner.ch>
Date:   Fri, 28 Aug 2020 15:52:24 +0200
Message-ID: <1jft867u93.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 27 Aug 2020 at 23:43, Stefan Agner <stefan@agner.ch> wrote:

> On Amlogic Meson G12b platform, similar to fclk_div3, the fclk_div2
> seems to be necessary for the system to operate correctly as well.
>
> Typically, the clock also gets chosen by the eMMC peripheral. This
> probably masked the problem so far. However, when booting from a SD
> card the clock seems to get disabled which leads to a system freeze.
>
> Let's mark this clock as critical, fixing boot from SD card on G12b
> platforms.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/clk/meson/g12a.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index fad616cac01e..2214b974f748 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
>  			&g12a_fclk_div2_div.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_IS_CRITICAL,
>  	},
>  };

Hi Stephan,

Thanks for reporting and fixing this. That's unfortunately the things we
have to find the "hard way"

Could you please:
1) add a Fixes tag to commit description so stable can pick it up

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")

2) Add a comment similar to the comment block of fdiv3 so we are pretty
clear why this clock needs to be critical and don't have to dig in
history find out.

Also please Cc Marek Szyprowski <m.szyprowski@samsung.com> ... you guys
apparently found this at them time :)

Thanks
