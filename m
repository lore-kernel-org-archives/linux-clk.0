Return-Path: <SRS0=MiPE=CG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BB6C433E7
	for <linux-clk@archiver.kernel.org>; Fri, 28 Aug 2020 13:43:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A59D2207DF
	for <linux-clk@archiver.kernel.org>; Fri, 28 Aug 2020 13:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G5ldVFyP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbgH1Nn1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Aug 2020 09:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbgH1NmD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Aug 2020 09:42:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051F2C061234
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2020 06:41:56 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k20so946767wmi.5
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2020 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=PlKhaukYosONnLRa/HMOIn8Ab+6xHhpFAWIiWSmABu4=;
        b=G5ldVFyPK11BLqtsAWgo5XKpAM1Mr5Ov0xHlog/sjfM8VfiVO72KS0bUCXS4s1DGur
         t6NrmCvzCbu80s1bw2iZjCY7Xsmds8d+/fcE12qI8RXSTMIDnJnfANa64sR+cmBH9MBH
         p89rHAqpcEiQ2FeQzSBN6jswn7G5ge+kmPJmfp0dQEwssNxt/OX6YQ12QYp7LekWWnXJ
         JzDewihMOHksjxrXK5v6SRUetqe9jt3VDx+ynzYKW0J5vLT+AmrL0MOZX7IAc7GBQmXF
         RzU0pTTVaS0p+4eAHDufaYbS6wdLpp7cPpkWREChKItwQqY8wflBgsqRLY5BGH3DS8vo
         XFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=PlKhaukYosONnLRa/HMOIn8Ab+6xHhpFAWIiWSmABu4=;
        b=SykM9T2IQ4kn8jJGGgolo/2+LbLekdAXbFrDDzSUw+bsNGMXbUI8/sl3Bd5JvGkIO6
         q+NK4MJUcif7dKitgywnEBNF+1YSj4DWXPlOSpEfKigLcmh+o9jKn0uJKf74G0ZCbh8d
         7XxPfH1umKmXXgvbOJhQXpPCfuqC5bdi6P3lF1vTGSPclEk364tO7++k5oWe+n8k3FX2
         swBuQhHd1Ook3bRMvefNdmAKknAlQvuCY/N8e8OFmrqdyEtp/AQX9flINkjUfZZXgA6D
         EqsInp1HyY2FTFbMtNc9jqE3q6m9ZjYTxrXoYYFyR4lijTv0pmQEgSdSZeiIXg5MMYE5
         MBKA==
X-Gm-Message-State: AOAM533kEYeXc6tElTBN/3NAvb+WuOqeVuDStnevK4jgwUTWMl5d8oKV
        9BbU8kQ3tPINdQrvxdtwGOd6Hw==
X-Google-Smtp-Source: ABdhPJw9rWugJDCUBnw255eYKA2/3pk957bjgTD+s607Bpq7K2FxICIbUOkkHg0aQik7x0lb0qmZXw==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr1780898wmj.140.1598622115510;
        Fri, 28 Aug 2020 06:41:55 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m1sm2224353wmc.28.2020.08.28.06.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 06:41:54 -0700 (PDT)
References: <CGME20200828130714eucas1p26b45e68ee12ca6c31b0ebe62bf699ba7@eucas1p2.samsung.com> <20200828130707.9045-1-m.szyprowski@samsung.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        "Kevin Hilman" <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] clk: meson: g12a: mark fclk_div2 as CLK_IGNORE_UNUSED
In-reply-to: <20200828130707.9045-1-m.szyprowski@samsung.com>
Date:   Fri, 28 Aug 2020 15:41:53 +0200
Message-ID: <1jh7sm7uqm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 28 Aug 2020 at 15:07, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Add CLK_IGNORE_UNUSED flag to the "fclk_div2" clock to fix boot hang on
> the Hardkernel's Odroid N2 board (with bootloader booted from SD card and
> kernel loaded via FTFP).
>
> It looks that this clock is disabled by the generic unused clocks
> scanning code before it gets enabled by the meson-gx-mmc driver.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Without this patch the only way to boot OdroidN2 board with mainline
> kernel is to append clk_ignore_unused kernel parameter. I've build the
> kernel from the default arm64's defconfig. The kernel is loaded via TFTP
> using vendor's u-boot.
> ---
>  drivers/clk/clk.c        | 5 +++++
>  drivers/clk/meson/g12a.c | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 9803d44bb157..4106b6231be4 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
>  			&g12a_fclk_div2_div.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_IGNORE_UNUSED,

Hi Marek,

I just received another patch making this clock critical which I'm more
inclined to take. It should solve this problem you reporting as well.

In general CLK_IGNORE_UNUSED is not best way to address these problems as
a particular race condition (with probe defferal for ex) could still
turn the clock off ... which is apparently something we can't tolerate.

Thanks for reporting

>  	},
>  };

